package compiler

import (
	"fmt"
	"log"
	"strings"
)

func (v *Var) ToLLVM(scopes *Scopes) (string, error) {
	prepCode, err := v.AddrToLLVM(scopes)
	if err != nil {
		return "", err
	}

	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	newId := fmt.Sprintf("%%.tmp%d", id)

	typeRepr, err := scopes.TypeRepr(v.Type)
	if err != nil {
		return "", err
	}

	code := []string{prepCode}
	code = append(code, fmt.Sprintf("%s = load %s, %s* %s", newId, typeRepr, typeRepr, v.Uid))
	v.Uid = newId
	return strings.Trim(strings.Join(code, "\n"), "\n"), nil
}


func (v *Var) AddrToLLVM(scopes *Scopes) (string, error) {
	realtype, err := scopes.GetDefinedVar(v.Name)
	v.Type = realtype
	code := []string{}
	v.Uid = fmt.Sprintf("%%%s", v.Name)

	if v.Trailer != nil && len(v.Trailer) > 0 {
		// TODO: check if it's not a module name

		// auto-dereference
		for true {
			if ptr, ok := v.Type.(*Pointer); ok {
				id, err := scopes.ReserveLocal()
				if err != nil {
					log.Panicf("Unable to dereference: %v", err)
				}
				typerepr, err := scopes.TypeRepr(ptr.Of)
				if err != nil {
					log.Panicf("Unable to represent type (%#v): %v", ptr.Of, err)
				}

				tmpId := fmt.Sprintf("%%.tmp%d", id)
				code = append(
					code,
					fmt.Sprintf("%s = load %s*, %s** %s", tmpId, typerepr, typerepr, v.Uid),
				)

				v.Uid = tmpId
				v.Type = ptr.Of
			} else {
				break
			}
		}

		for _, name := range v.Trailer {
			currtyperepr, err := scopes.TypeRepr(v.Type)
			if err != nil {
				log.Panicf("Unable to represent type %#v: %v", v.Type, err)
			}
			if str, ok := v.Type.(string); ok{
				typ, repr, err := scopes.GetDefinedType(str)
				if err == nil {
					currtyperepr = repr
					v.Type = typ
				}
			}

			st, ok := v.Type.(*StructType)
			if !ok {
				return "", fmt.Errorf("Unable to retrieve dot value %q from non struct type: %#v", name, v.Type)
			}

			var field *Argument = nil
			index := 0
			for idx, arg := range st.Fields {
				if arg.Name == name {
					field = &arg
					index = idx
					break
				}
			}
			if field == nil {
				return "", fmt.Errorf("Field %q is not defined on struct %#v", name, st)
			}

			varId, err := scopes.ReserveLocal()
			if err != nil {
				log.Panicf("Unable to reserve id: %v", err)
			}

			newId := fmt.Sprintf("%%.tmp%d", varId)
			code = append(
				code,
				fmt.Sprintf("%s = getelementptr %s, %s* %s, i32 0, i32 %d", newId,  currtyperepr, currtyperepr, v.Uid, index),
			)
			v.Type = field.Type
			v.Uid = newId
		}
	}
	if err != nil {
		return "", err
	}
	return strings.Join(code, "\n"), nil
}

func (v *Var) AddrId() (string, error) {
	if v.Uid == "" {
		log.Panicf("AddrId called before AddrTollvm initialization")
	}
	return v.Uid, nil
}

func (v *Var) TypeRepr(scopes Scopes) (string, error) {
	if v.Type == "" || v.Type == nil {
		log.Panicf("RuntimeError: called 'RealType' before ToLLVM initialization")
		return "", nil
	}
	typeRepr, err := scopes.TypeRepr(v.Type)
	if err != nil {
		return "", err
	}
	return typeRepr, nil
}
func (v *Var) RealType(scopes Scopes) (Type, error) {
	if v.Type == "" || v.Type == nil {
		log.Panicf("RuntimeError: called 'RealType' before ToLLVM initialization")
		return "", nil
	}
	return v.Type, nil
}

func (v *Var) Id() (string, error) {
	if v.Uid == "" {
		log.Panicf("RuntimeError: called 'Id' of %q before ToLLVM initialization", v.Name)
	}
	return v.Uid, nil
}

func (d *Declaration) ToLLVM(scopes *Scopes) (string, error) {
	var prepCode string
	var rval string
	var realtype Type

	if imm, ok := d.Value.(LLVMImmediate); ok {
		immval, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			log.Panicf("Unable to retrieve immediate value for %#v: %v", d.Value, err)
			return "", err
		}
		realtype, err = d.Value.(SSAValue).RealType(*scopes)
		if err != nil {
			log.Panicf("Unable to retrieve real value for %#v: %v", d.Value, err)
			return "", err
		}
		rval = immval.Value
	} else if ssa, ok := d.Value.(SSAValue); ok {
		var err error
		prepCode, err = ssa.ToLLVM(scopes)
		if err != nil {
			return "", err
		}

		realtype, err = ssa.RealType(*scopes)
		if err != nil {
			return "", err
		}
		rval, err = ssa.Id()
	} else if d.Value != nil {
		return "", fmt.Errorf("%v does not implement SSAValue!", d.Value)
	} else if d.Value == nil {
		if d.To.Type == "" {
			return "", fmt.Errorf("Unable to automatically detect type for variable %q", d.To.Name)
		}
		realtype = d.To.Type
	}

	if err := scopes.DefineVariable(d.To.Name, realtype); err != nil {
		return "", err
	}

	rtype, err := scopes.TypeRepr(realtype)
	if err != nil {
		return "", err
	}

	assignment := ""
	if d.Value != nil {
		assignment = fmt.Sprintf("store %s %s, %s* %%%s", rtype, rval, rtype, d.To.Name)
	}

	return strings.Join(
		[]string{
			prepCode,
			fmt.Sprintf("%%%s = alloca %s", d.To.Name, rtype),
			assignment,
		}, "\n",
	), nil
}

func (a *Assignment) ToLLVM(scopes *Scopes) (string, error) {

	var immtype Type
	var toassign, prepCode string
	if imm, ok := a.Value.(LLVMImmediate); ok {
		immediate, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			log.Panicf("Unable to retrieve immediate type: %v", err)
		}
		toassign = immediate.Value
		immtype, err = a.Value.(SSAValue).RealType(*scopes)
		if err != nil {
			log.Panicf("Error retrieving real type: %v", err)
		}
	} else if ssa, ok := a.Value.(SSAValue); ok {
		var err error
		prepCode, err = ssa.ToLLVM(scopes)
		if err != nil {
			log.Panicf("Unable to initialize ToLLVM: %v", err)
		}
		toassign, err = ssa.Id()
		if err != nil {
			log.Panicf("Unable to retrieve Id of SSAValue: %v", err)
		}
		immtype, err = ssa.RealType(*scopes)
		if err != nil {
			log.Panicf("Unable to retrieve real type: %v", err)
		}
	} else {
		log.Panicf("Value does not implement LLVMImmediate or SSAValue: %#v", a.Value)
	}

	ssaAddr := a.To.(SSAAddr)
	initCode, err := ssaAddr.AddrToLLVM(scopes)
	if err != nil {
		log.Panicf("Unable to init variable: %v", err)
	}

	vartype, err := a.To.RealType(*scopes)
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	if !SameType(immtype, vartype) {
		log.Panicf("Implicit casting not implemented!!! %#v != %#v (%#v, %#v)", immtype, vartype, a.To, a.Value)
	}

	typerepr, err := a.To.TypeRepr(*scopes)
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	varid, err := ssaAddr.AddrId()
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	code := fmt.Sprintf("store %s %s, %s* %s", typerepr, toassign, typerepr, varid)
	return strings.Trim(
		strings.Join(
			[]string{
				prepCode,
				initCode,
				code,
			}, "\n",
		), "\n",
	), nil
}


func (ac *ArrayCell) Id() (string, error) {
	if ac.Uid == "" {
		log.Panicf("ProgrammingError: Id called before ToLLVM initialization")
	}
	return ac.Uid, nil
}
func (ac *ArrayCell) varname() (string) {
	if name, ok := ac.Var.(*Var); ok {
		return name.Name
	}

	return ac.Var.(*ArrayCell).varname()
}

func (ac *ArrayCell) RealType(scopes Scopes) (Type, error) {
	// typerepr, err := ac.Var.RealType(scopes)
	typeval, err := scopes.GetDefinedVar(ac.varname())
	return typeval.(*ArrayType).Base, err
}

func (ac *ArrayCell) TypeRepr(scopes Scopes) (string, error) {
	typeval, err := scopes.GetDefinedVar(ac.varname())
	if err != nil {
		return "", err
	}
	typerepr, err := scopes.TypeRepr(typeval.(*ArrayType).Base)
	return typerepr, err
}

func (ac *ArrayCell) ToLLVM(scopes *Scopes) (string, error) {
	init, err := ac.Var.(SSAAddr).AddrToLLVM(scopes)
	if err != nil {
		return "", err
	}

	ofIdx, err := ac.Var.(SSAAddr).AddrId()
	if err != nil {
		return "", err
	}

	vartype, err := scopes.GetDefinedVar(ac.varname())
	if err != nil {
		return "", err
	}
	typename, err := scopes.TypeRepr(vartype)
	if err != nil {
		return "", err
	}

	lid, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	loadId := fmt.Sprintf("%%.tmp%d", lid)

	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	ac.Uid = fmt.Sprintf("%%.tmp%d", id)

	var postype, posid string
	if imm, ok := ac.Pos.(LLVMImmediate); ok {
		immvalue, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return "", err
		}
		postype, err = scopes.TypeRepr(immvalue.Type)
		if err != nil {
			return "", err
		}
		posid = immvalue.Value
	}

	celltype, err := ac.TypeRepr(*scopes)
	if err != nil {
		return "", err
	}

	return strings.Trim(
		strings.Join(
			[]string{
				init,
				fmt.Sprintf("%s = getelementptr %s, %s*%s, i32 0, %s %s", loadId, typename, typename, ofIdx, postype, posid),
				fmt.Sprintf("%s = load %s, %s* %s", ac.Uid, celltype, celltype, loadId),
			}, "\n",
		), "\n",
	), nil
}

func (ac *ArrayCell) AddrToLLVM(scopes *Scopes) (string, error) {
	id, err := scopes.ReserveLocal()
	if err != nil {
		log.Panicf("Unable to reserve local id: %v", err)
	}
	ac.Uid = fmt.Sprintf("%%.tmp%d", id)

	initCode, err := ac.Var.(SSAAddr).AddrToLLVM(scopes)
	varid, err := ac.Var.(SSAAddr).AddrId()
	if err != nil {
		log.Panicf("Unable to get var addr: %v", err)
	}

	vartype, err := scopes.GetDefinedVar(ac.varname())
	if err != nil {
		return "", err
	}
	typename, err := scopes.TypeRepr(vartype)
	if err != nil {
		return "", err
	}


	var postype, posid string
	if imm, ok := ac.Pos.(LLVMImmediate); ok {
		immvalue, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return "", err
		}
		postype, err = scopes.TypeRepr(immvalue.Type)
		if err != nil {
			return "", err
		}
		posid = immvalue.Value
	}

	code := fmt.Sprintf("%s = getelementptr %s, %s*%s, i32 0, %s %s", ac.Uid, typename, typename, varid, postype, posid)
	return strings.Trim(
		strings.Join(
			[]string{
				initCode,
				code,
			}, "\n",
		), "\n",
	), nil
}

func (ac *ArrayCell) AddrId() (string, error) {
	if ac.Uid == "" {
		log.Panicf("AddrId called before AddrToLLVM initialization")
	}

	return ac.Uid, nil
}
