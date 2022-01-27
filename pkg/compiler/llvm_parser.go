package compiler

import (
	"bytes"
	"fmt"
	"io/ioutil"
    "os"
	"log"
	"strings"
    "path/filepath"
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

func (b *Boolean) ToLLVM(scopes *Scopes) (string, error) {
	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	b.Uid = fmt.Sprintf("%%.tmp%d", id)
	boolValue := 0
	if b.Value == "true" {
		boolValue = 1
	}
	return fmt.Sprintf("%%.tmp%d = add i1 0, %d", id, boolValue), nil
}

func (b *Boolean) RealType(scopes Scopes) (string, error) {
	return "bool", nil
}

func (b *Boolean) Id() (string, error) {
	if b.Uid == "" {
		return "", fmt.Errorf("Unable to get uid before ToLLVM call in (bool)")
	}
	return b.Uid, nil
}
func (b *Boolean) TypeRepr(scopes Scopes) (string, error) {
	typestring, err := scopes.TypeRepr("bool")
	return typestring, err
}

func (op *OpLess) ToLLVM(scopes *Scopes) (string, error) {
	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	// detect left and right
	var lhs, rhs string

	if num, ok := op.Left.(Number); ok {
		lhs = num.Value
	} else if ssa, ok := op.Left.(SSAValue); ok {
		ssa.ToLLVM(scopes)
	} else {
		return "", fmt.Errorf("Assignblae %#v does not implement SSAValue", op.Left)
	}
	if num, ok := op.Right.(Number); ok {
		rhs = num.Value
	}
	code := fmt.Sprintf("%%.tmp%d = icmp slt i32 %s, %s", id, lhs, rhs)
	return code, nil
}
func (op *OpLess) TypeRepr(scopes Scopes) (string, error) {
	typestring, err := scopes.TypeRepr("int")
	return typestring, err
}
func (op *OpLess) Id() (string, error) {
	return "%.tmp0", nil
}

func (f *ForLoop) ToLLVM(scopes *Scopes) (string, error) {
	initCode, err := f.Init.(SSA).ToLLVM(scopes)
	if err != nil {
		return "", err
	}

	loopId, err := scopes.ReserveLocal()
	if err != nil {
		log.Panicf("Unable to reserve local value: %v", err)
	}

	ssaCondition, implemented := f.Condition.(SSAValue)
	if !implemented {
		log.Panicf("for condition does not implement ssavalue")
	}


	loopCond, err := ssaCondition.ToLLVM(scopes)
	if err != nil {
		log.Panicf("Unable to convert condition to SSA: %v", err)
	}

	condId, err := ssaCondition.Id()
	if err != nil {
		log.Panicf("Unable to convert condition to SSA: %v", err)
	}
	loopBody := []string{}
	for _, expr := range f.Body {
		exprCode, err := expr.(SSA).ToLLVM(scopes)
		loopBody = append(loopBody, exprCode)
		if err != nil {
			log.Panicf("Unable to convert condition to SSA: %v", err)
		}
	}

	iter, err := f.Incr.(SSA).ToLLVM(scopes)
	if err != nil {
		log.Panicf("Unable to convert iter condition to SSA: %v", err)
	}

	loopBodyStr := strings.Join(loopBody, "\n")
	return strings.Join(
		[]string{
			initCode,
			fmt.Sprintf("br label %%.for.start.%d", loopId),
			fmt.Sprintf(".for.start.%d:", loopId),
			loopCond,
			fmt.Sprintf("br i1 %s, label %%.for.continue.%d, label %%.for.end.%d", condId, loopId, loopId),
			fmt.Sprintf(".for.continue.%d:", loopId),
			loopBodyStr,
			iter,
			fmt.Sprintf("br label %%.for.start.%d", loopId),
			fmt.Sprintf(".for.end.%d:", loopId),
		}, "\n",
	), nil
}

func (b *IfElseBlock) ToLLVM(scopes *Scopes) (string, error) {
	// reserve label counter
	// true condition
	// false condition
	// end

	var err error
	var cond string
	var code string
	if ssa, ok := b.Condition.(SSAValue); ok {
		code, err = ssa.ToLLVM(scopes)
		if err != nil {
			return "", err
		}
		cond, err = ssa.Id()
		if err != nil {
			return "", err
		}
	} else {
		return "", fmt.Errorf("Assignable %#v does not implement SSAValue", b.Condition)
	}

	labelId, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}

	iftruebody := []string{}
	for _, expr := range(b.Body) {
		if ll, ok := expr.(SSA); ok {
			code, err := ll.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			iftruebody = append(iftruebody, code)
		} else {
			return "", fmt.Errorf("Unable to treat %#v as ssa, does not implement methods", expr)
		}
	}

	iffalsebody := []string{}
	for _, expr := range(b.Else) {
		if ll, ok := expr.(SSA); ok {
			code, err := ll.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			iffalsebody = append(iffalsebody, code)
		} else {
			return "", fmt.Errorf("Unable to treat %#v as ssa, does not implement methods", expr)
		}
	}


	template :=  strings.Join([]string{
		"br i1 %s, label %%.if.true.%d, label %%.if.false.%d",
		".if.true.%d:",
		"%s", // if true body
		"br label %%.if.end.%d",
		".if.false.%d:",
		"%s", // if false body
		"br label %%.if.end.%d",
		".if.end.%d:",
	}, "\n")

	return code + "\n" + fmt.Sprintf(
		template,
		cond,
		labelId, // br true
		labelId, // br false
		labelId, // label true
		strings.Join(iftruebody, "\n"),
		labelId, // br to end
		labelId, // label false
		strings.Join(iffalsebody, "\n"),
		labelId, // br to end
		labelId, // end
	), nil
}

func (r *Return) ToLLVM(scopes *Scopes) (string, error) {
	rv := ""
	if num, ok := r.Value.(*Number); ok {
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


func (f *Function) ToLLVM(scopes *Scopes) (string, error) {
	scopes.Push()
	strReturnType, err  := scopes.TypeRepr(f.ReturnType)
	if err != nil {
		return "", err
	}
	strFunctionName := "@" + scopes.prefix + f.Name
	strFunctionArgs := ""
	strFunctionBody := ""

	var lastexpr Expression
	for _, expr := range f.Body {
		ssa, ok := expr.(SSA)
		if !ok {
			return "", fmt.Errorf("ToLLVM method not implemented on: %#v", expr)
		}
		lastexpr= ssa
		code, err := ssa.ToLLVM(scopes)
		if err != nil {
			return "", err
		}
		strFunctionBody += ("\n" + code)
	}

	if _, ok := lastexpr.(Return); !ok && strReturnType == "void" {
		strFunctionBody += "\nret void"
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

func (e *ExternFunc) ToLLVM(scopes *Scopes) (string, error) {
	// it only makes sense at global level
	strReturnType, err := scopes.TypeRepr(e.ReturnType)
	if err != nil {
		return "", err
	}
	strFuncName := "@" + e.Name
	strFuncArgs := ""
	return fmt.Sprintf("declare %s %s (%s)", strReturnType, strFuncName, strFuncArgs), nil
}

func (f *FnCall) ToLLVM(scopes *Scopes) (string, error) {
	definedFn, err := scopes.GetDefined(f.Name.Name)
	if err != nil {
		return "", err
	}
	strReturnType, err := scopes.TypeRepr(definedFn.HasType)
	if err != nil {
		return "", err
	}
	// prepare and parse assignables
	if len(definedFn.Arguments) != len(f.Params) {
		return "", fmt.Errorf("Too little or too much arguments provided for function call: %q", f.Name)
	}

	code := []string{}
	args := []string{}
	for i, assignable := range f.Params {
		arg, err := scopes.TypeRepr(definedFn.Arguments[i].Type)
		if err != nil {
			return "", err
		}

		if casted, ok := assignable.(SSAValue); ok {
			ops, err := casted.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			code = append(code, ops)
			uid, err := casted.Id()
			if err != nil {
				return "", err
			}
			arg += uid

		} else {
			return "", fmt.Errorf("NotImplementedError: Assignable has not enough methods to be used as a SSAValue: %#v", assignable)
		}
		args = append(args, arg)
	}

	strArgs := strings.Join(args, ",")
	call := fmt.Sprintf("call %s @%s(%s)", strReturnType, f.Name.Name, strArgs)
	code = append(code, call)
	return strings.Join(code, "\n"), nil
}

func (s *String) RealType(scopes Scopes) (string, error) {
	return "str", nil
}

func (s *String) TypeRepr(scopes Scopes) (string, error) {
	name, err := scopes.TypeRepr("str")
	return name, err
}

func (s *String) ToLLVM(scopes *Scopes) (string, error) {
	// lookup constant value
	constantValue, err := scopes.DefineConstantString(s.Value)
	if err != nil {
		return "", err
	}

	uid, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	s.Uid = fmt.Sprintf("%%.tmp%d", uid)
	return fmt.Sprintf(
		"%s = getelementptr %s, %s*%s, i64 0, i64 0",
		s.Uid,
		constantValue.TypeRepr,
		constantValue.TypeRepr,
		constantValue.Uid,
	), nil
}
func (s *String) Id() (string, error) {
	if s.Uid == "" {
		return "", fmt.Errorf("Tried to access assignable id before compilation")
	}
	return s.Uid, nil
}

func BuildScopes() *Scopes {
	scopes := ScopesFrom([]RtScope{
		// top level scope
		{
			TypeAliases: map[string]string{
				"void": "void",
				"int": "i32",
				"chr": "i8",
				"bool": "i1",
				"str": "i8*",
			},
		},
		// add global scopes
	})
    scopes.modules = make(map[string]ImportInfo)
	return &scopes
}

func ToLLVM(scopes *Scopes, ast *AST) (string, error) {
	globalScopes := scopes.Push()
	for _, topLevelOp := range *ast {
		switch v := topLevelOp.(type) {
		case *Function:
			globalScopes.DefineVar(v.Name, v.ReturnType, v.Args, false)
		case *ExternFunc:
			globalScopes.DefineVar(v.Name, v.ReturnType, v.Args, true)
		}
	}

	blocks := []string{}
	for _, state := range *ast {
		if fn, ok := state.(*Function); ok {
			code, err := fn.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			blocks = append(blocks, code)
		} else if alias, ok := state.(*TypeAlias); ok {
			code, err := alias.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			blocks = append(blocks, code)
		} else if imp, ok := state.(*Import); ok {
			code, err := imp.ToLLVM(scopes)
			if err != nil {
				return "", err
			}
			blocks = append(blocks, code)
		} else if _, ok := state.(*ExternFunc); ok {
			continue
			// code, err := ext.ToLLVM(scopes)
			// if err != nil {
			// 	return "", err
			// }
			// blocks = append(blocks, code)
		} else {
			return "", fmt.Errorf("Invalid top level instruction: %#v", state)
		}
	}
	globals, err := scopes.DefineGlobals(globalScopes)
	if err != nil {
		return "", err
	}

	blocks = append(globals, blocks...)
	return strings.Trim(strings.Join(blocks, "\n"), "\n"), nil
}

func (t *TypeAlias) ToLLVM(scopes *Scopes) (string, error) {
	t.Uid = fmt.Sprintf("%%.type.%s", t.Name)
	repr, err := scopes.TypeRepr(t.Type)
	if err != nil {
		return "", err
	}
	if err := scopes.DefineTypeAlias(t.Name, t.Uid); err != nil {
		return "", err
	}
	return fmt.Sprintf("%s = type %s", t.Uid, repr), nil
}

func (imp *Import) ToLLVM(scopes *Scopes) (string, error) {
    // get absolute path for file
    path, err := os.Getwd()
    if err != nil {
        return "", err
    }

    abspath := filepath.Join(path, imp.Path + ".bn")
    if _, ok := scopes.modules[abspath]; ok {
        return "", nil
    }
	content, err := ioutil.ReadFile(abspath)

	if err != nil {
		return "", err
	}
	tokens, err := Tokenize(bytes.NewReader(content))
	if err != nil {
		return "", err
	}

	ast, err := Parse(tokens)
	if err != nil {
		return "", err
	}
	prefixId, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}

	prevPrefix := scopes.prefix
	scopes.prefix = fmt.Sprintf(".mod%d.", prefixId)
    scopes.modules[abspath] = ImportInfo{ false, scopes.prefix }
	code, err := ToLLVM(scopes, ast)
	scopes.prefix = prevPrefix
	return code, err
}
