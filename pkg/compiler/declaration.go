package compiler

import (
	"fmt"
	"strings"
)

func (d *Declaration) ToLLVM(scopes *Scopes) (string, error) {

	var rtype, rval string
	if imm, ok := d.Value.(LLVMImmediate); ok {
		immval, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return "", err
		}
		rtype = immval.Type
		rval = immval.Value
	} else {
		return "", fmt.Errorf("No immediate value")
	}
	return strings.Join(
		[]string{
			fmt.Sprintf("%%%s = alloca %s", string(d.To), rtype),
			fmt.Sprintf("store %s %s, %s* %%%s", rtype, rval, rtype, string(d.To)),
		}, "\n",
	), nil
}
