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

func (v *Var) TypeRepr(scopes Scopes) (string, error) {
	typeRepr, err := scopes.TypeRepr(v.Type)
	if err != nil {
		return "", err
	}
	return typeRepr, nil
}
func (v *Var) RealType(scopes Scopes) (string, error) {
	if v.Type == "" {
		log.Panicf("RuntimeError: called 'RealType' before ToLLVM initialization")
		return "", nil
	}
	return v.Type.(string), nil
}

func (v *Var) Id() (string, error) {
	if v.Uid == "" {
		return "", fmt.Errorf("RuntimeError: called Var.id before TOLLVM initialization")
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
	}

	rtype, err := scopes.TypeRepr(realtype)
	if err != nil {
		return "", err
	}

	if err := scopes.DefineVariable(d.To.Name, realtype); err != nil {
		return "", err
	}


	return strings.Join(
		[]string{
			prepCode,
			fmt.Sprintf("%%%s = alloca %s", d.To.Name, rtype),
			fmt.Sprintf("store %s %s, %s* %%%s", rtype, rval, rtype, d.To.Name),
		}, "\n",
	), nil
}
