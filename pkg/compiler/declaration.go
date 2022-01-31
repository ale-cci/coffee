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
	if _, ok := scopes.CurrentMod().globalNames[v.Name]; ok {
		v.Name = v.Trailer[0]
		for i := 0; i < len(v.Trailer) -1; i += 1 {
			v.Trailer[i] = v.Trailer[i + 1]
		}
		v.Trailer = v.Trailer[:len(v.Trailer) -1]
	}
	varData, err := scopes.Variable(v.Name)
	if err != nil {
		return "", err
	}

	v.Type = varData.Type
	code := []string{}
	v.Uid = varData.Name

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
			if str, ok := v.Type.(string); ok {
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
				fmt.Sprintf("%s = getelementptr %s, %s* %s, i32 0, i32 %d", newId, currtyperepr, currtyperepr, v.Uid, index),
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

type SSAInfo struct {
	Uid      string
	Init     string
	RealType Type
	TypeRepr string
}

func ParseSSA(val SSAValue, scopes *Scopes) (*SSAInfo, error) {
	info := SSAInfo{}

	if imm, ok := val.(LLVMImmediate); ok {
		immvalue, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return nil, err
		}
		info.RealType, err = imm.(SSAValue).RealType(*scopes)
		if err != nil {
			return nil, err
		}

		info.TypeRepr, err = scopes.TypeRepr(immvalue.Type)
		if err != nil {
			return nil, err
		}
		info.Uid = immvalue.Value
		info.Init = ""
		return &info, nil
	} else if ssa, ok := val.(SSAValue); ok {
		var err error
		info.Init, err = ssa.ToLLVM(scopes)
		if err != nil {
			return nil, err
		}

		info.RealType, err = ssa.RealType(*scopes)
		if err != nil {
			return nil, err
		}
		info.TypeRepr, err = scopes.TypeRepr(info.RealType)
		if err != nil {
			return nil, err
		}

		info.Uid, err = ssa.Id()
		if err != nil {
			return nil, err
		}
		return &info, nil
	}

	log.Panicf("Unable to convert %#v to SSAValue", val)
	return nil, nil
}

func (d *Declaration) ToLLVM(scopes *Scopes) (string, error) {
	var ssa *SSAInfo = &SSAInfo{}
	var err error

	assignment := ""
	if d.Value == nil {
		if d.To.Type == "" || d.To.Type == nil {
			return "", fmt.Errorf("Unable to infer type for variable: %#v", d.To)
		}
		ssa.RealType = d.To.Type
		ssa.TypeRepr, err = scopes.TypeRepr(ssa.RealType)
	} else {

		ssa, err = ParseSSA(d.Value.(SSAValue), scopes)
		if err != nil {
			return "", err
		}
		assignment = fmt.Sprintf("store %s %s, %s* %%%s", ssa.TypeRepr, ssa.Uid, ssa.TypeRepr, d.To.Name)
	}

	if err != nil {
		return "", err
	}

	uid := fmt.Sprintf("%%%s", d.To.Name)
	if err := scopes.DefineVariable(d.To.Name, ssa.RealType, uid); err != nil {
		return "", err
	}

	return strings.Join(
		[]string{
			ssa.Init,
			fmt.Sprintf("%s = alloca %s", uid, ssa.TypeRepr),
			assignment,
		}, "\n",
	), nil
}

func (c *Casting) ToLLVM(scopes *Scopes) (string, error) {
	ssa := c.Of.(SSAValue)
	prepCode, err := ssa.ToLLVM(scopes)
	if err != nil {
		return "", err
	}

	typerepr, err := c.TypeRepr(*scopes)
	if err != nil {
		return "", err
	}
	ssaType, err := ssa.TypeRepr(*scopes)
	if err != nil {
		return "", err
	}
	ssaId, err := ssa.Id()
	if err != nil {
		return "", err
	}

	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	c.Uid = fmt.Sprintf("%%.tmp%d", id)
	return strings.Join(
		[]string{
			prepCode,
			fmt.Sprintf("%s = bitcast %s %s to %s", c.Uid, ssaType, ssaId, typerepr),
		}, "\n",
	), nil
}

func (c *Casting) Id() (string, error) {
	if c.Uid == "" {
		log.Panicf("Called casting.Id() before ToLLVM initialization")
	}
	return c.Uid, nil
}
func (c *Casting) TypeRepr(scopes Scopes) (string, error) {
	repr, err := scopes.TypeRepr(c.Type)
	return repr, err
}
func (c *Casting) RealType(scopes Scopes) (Type, error) {
	return c.Type, nil
}

func (a *Assignment) ToLLVM(scopes *Scopes) (string, error) {
	ssaInfo, err := ParseSSA(a.Value.(SSAValue), scopes)
	if err != nil {
		return "", err
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

	if !SameType(vartype, ssaInfo.RealType) {
		log.Printf("Fst: %#v", a.To)
		log.Printf("Snd: %#v", a.Value)
		log.Panicf("Implicit casting not implemented!!! %#v != %#v", ssaInfo.RealType, vartype)
	}

	typerepr, err := a.To.TypeRepr(*scopes)
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	varid, err := ssaAddr.AddrId()
	if err != nil {
		log.Panicf("In assignment: %v", err)
	}

	code := fmt.Sprintf("store %s %s, %s* %s", typerepr, ssaInfo.Uid, typerepr, varid)
	return strings.Trim(
		strings.Join(
			[]string{
				ssaInfo.Init,
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
func (ac *ArrayCell) varname() string {
	if name, ok := ac.Var.(*Var); ok {
		return name.Name
	}

	return ac.Var.(*ArrayCell).varname()
}

func (ac *ArrayCell) RealType(scopes Scopes) (Type, error) {
	basetype, err := scopes.GetDefinedVar(ac.varname())
	if err != nil {
		return nil, err
	}

	var elem interface{}
	elem = ac

	for ;; {
		if cell, ok := elem.(*ArrayCell); !ok {
			break
		} else {
			elem = cell.Var

			switch t := basetype.(type) {
			case *ArrayType:
				basetype = t.Base
			case *Pointer:
				basetype = t.Of
			default:
				log.Panicf("Unable to dereference type: %#v", t)
			}
		}
	}
	return basetype, nil
}

func (ac *ArrayCell) TypeRepr(scopes Scopes) (string, error) {
	rt, err := ac.RealType(scopes)
	if err != nil {
		return "", err
	}
	t, err  := scopes.TypeRepr(rt)
	return t, err
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

	posInfo, err := ParseSSA(ac.Pos.(SSAValue), scopes)
	if err != nil {
		return "", err
	}

	celltype, err := ac.TypeRepr(*scopes)
	if err != nil {
		return "", err
	}

	if _, ok := vartype.(*Pointer); ok {
		id, err := scopes.ReserveLocal()
		if err != nil {
			return "", err
		}
		tmpId := ac.Uid
		ac.Uid = fmt.Sprintf("%%.tmp%d", id)
		return strings.Trim(
			strings.Join(
				[]string{
					init,
					posInfo.Init,
					fmt.Sprintf("%s = load %s*, %s** %s", loadId, celltype, celltype, ofIdx),
					fmt.Sprintf("%s = getelementptr %s, %s* %s, %s %s", tmpId, celltype, celltype, loadId, posInfo.TypeRepr, posInfo.Uid),
					fmt.Sprintf("%s = load %s, %s* %s", ac.Uid, celltype, celltype, tmpId),
				}, "\n",
			), "\n",
		), nil
	}

	return strings.Trim(
		strings.Join(
			[]string{
				init,
				posInfo.Init,
				fmt.Sprintf("%s = getelementptr %s, %s*%s, i32 0, %s %s", loadId, typename, typename, ofIdx, posInfo.TypeRepr, posInfo.Uid),
				fmt.Sprintf("%s = load %s, %s* %s", ac.Uid, celltype, celltype, loadId),
			}, "\n",
		), "\n",
	), nil
}

func (ac *ArrayCell) AddrToLLVM(scopes *Scopes) (string, error) {
	info, err := ParseSSA(ac.Pos.(SSAValue), scopes)
	if err != nil {
		return "", err
	}

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

	if _, ok := vartype.(*Pointer); ok {
		typename, err := ac.TypeRepr(*scopes)
		if err != nil {
			return "", err
		}
		// extract pointer from array
		id, err := scopes.ReserveLocal()
		if err != nil {
			return "", err
		}
		tmpId := ac.Uid
		ac.Uid = fmt.Sprintf("%%.tmp%d", id)

		return strings.Trim(
			strings.Join(
				[]string{
					initCode,
					info.Init,
					fmt.Sprintf("%s = load %s*, %s** %s", tmpId, typename, typename, varid),
					fmt.Sprintf("%s = getelementptr %s, %s* %s, %s %s", ac.Uid, typename, typename, tmpId, info.TypeRepr, info.Uid),
				}, "\n",
			), "\n",
		), nil
	}
	typename, err := scopes.TypeRepr(vartype)

	code := fmt.Sprintf("%s = getelementptr %s, %s* %s, i32 0, %s %s", ac.Uid, typename, typename, varid, info.TypeRepr, info.Uid)
	return strings.Trim(
		strings.Join(
			[]string{
				initCode,
				info.Init,
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
