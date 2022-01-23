package compiler

import (
	"fmt"
	"log"
	"strings"
)

func (v *Var) ToLLVM(scopes *Scopes) (string, error) {
	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	v.Uid = fmt.Sprintf("%%.tmp%d", id)
	varType, err := scopes.GetDefinedVar(v.Name)
	if err != nil {
		return "", err
	}
	v.Type = varType
	typeRepr, err := scopes.TypeRepr(varType)
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("%s = load %s, %s* %%%s", v.Uid, typeRepr, typeRepr, v.Name), nil
}
func (v *Var) AddrToLLVM(scopes *Scopes) (string, error) {
	realtype, err := scopes.GetDefinedVar(v.Name)
	if err != nil {
		return "", err
	}
	v.Type = realtype
	return "", nil
}
func (v *Var) AddrId() (string, error) {
	return fmt.Sprintf("%%%s", v.Name), nil
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
func (v *Var) RealType(scopes Scopes) (string, error) {
	if v.Type == "" || v.Type == nil {
		log.Panicf("RuntimeError: called 'RealType' before ToLLVM initialization")
		return "", nil
	}
	return RealType(v.Type), nil
}

func (v *Var) Id() (string, error) {
	if v.Uid == "" {
		log.Panicf("RuntimeError: called 'Id' before ToLLVM initialization")
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

	var toassign, immtype, prepCode string
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

	initCode, err := a.To.(SSAAddr).AddrToLLVM(scopes)
	if err != nil {
		log.Panicf("Unable to init variable: %v", err)
	}

	vartype, err := a.To.RealType(*scopes)
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	if !SameType(immtype, vartype) {
		log.Panicf("Implicit casting not implemented!!! %#v != %#v", immtype, vartype)
	}

	typerepr, err := a.To.TypeRepr(*scopes)
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	varid, err := a.To.(SSAAddr).AddrId()
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

func (ac *ArrayCell) RealType(scopes Scopes) (string, error) {
	// typerepr, err := ac.Var.RealType(scopes)
	typeval, err := scopes.GetDefinedVar(ac.varname())
	return RealType(typeval.(*ArrayType).Base), err
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
