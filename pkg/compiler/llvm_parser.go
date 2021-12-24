package compiler

import (
	"fmt"
	"strings"
)

// 1. find names visible for the current scope
//     - buildtin: types, external functions
//     - global: all top level blocks
//     - current scope for other names
//   Top level block should say what:
//       - names it exports
//       - functions it exports
//       - types it exports
// 2. start parsing current block
//  - push a new empty scope
//  - start parsing each expression

func (r *Return) ToLLVM(scopes Scopes) (string, error) {
	rv := ""
	if num, ok := r.Value.(Number); ok {
		typename, err := scopes.TypeRepr(num.Type)
		if err != nil {
			return "", err
		}
		rv = fmt.Sprintf("%s %s", typename, num.Value)
	} else {
		panic("TODO!!!")
	}
	code := fmt.Sprintf("ret %s", rv)
	return code, nil
}


func (f *Function) ToLLVM(scopes Scopes) (string, error) {
	scopes.Push()
	strReturnType, err  := scopes.TypeRepr(f.ReturnType)
	if err != nil {
		return "", err
	}
	strFunctionName := "@" + f.Name
	strFunctionArgs := ""
	strFunctionBody := ""

	for _, expr := range f.Body {
		ssa, ok := expr.(SSA)
		if !ok {
			return "", fmt.Errorf("ToLLVM method not implemented on: %#v", expr)
		}
		code, err := ssa.ToLLVM(scopes)
		if err != nil {
			return "", err
		}
		strFunctionBody += ("\n" + code)
	}

	code := fmt.Sprintf(
		"define %s %s(%s) {%s\n}",
		strReturnType,
		strFunctionName,
		strFunctionArgs,
		strFunctionBody,
	)
	scopes.Pop()
	return code, nil
}


func ToLLVM(ast *AST) (string, error) {
	scopes := ScopesFrom([]RtScope{
		// top level scope
		{
			TypeAliases: map[string]string{
				"int": "i32",
				"bool": "i1",
			},
		},
		// add global scopes
	})

	blocks := []string{}
	for _, state := range *ast {
		if fn, ok := state.(*Function); ok {
			code, err := fn.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			blocks = append(blocks, code)
		} else {
			return "", fmt.Errorf("Invalid top level instruction: %#v", state)
		}
	}
	return strings.Join(blocks, "\n"), nil
}
