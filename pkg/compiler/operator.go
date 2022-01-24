package compiler

import (
	"fmt"
	"log"
	"strings"
)

type Operator struct {
	uid      string
	Optype   TokenType
	realtype string
	Left     Assignable
	Right    Assignable
}

func (o *Operator) ToLLVM(scopes *Scopes) (string, error) {
	// 1. find lhs and rhs values
	// 2. check if lhs & rhs have the same type
	// 3. set the typename of the operator
	// 4. request id for the current operator
	// return code
	code := []string{}

	var ltype, rtype string
	var lval, rval string

	if imm, ok := o.Left.(LLVMImmediate); ok {
		immvalue, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return "", err
		}
		ltype, err = o.Left.(SSAValue).RealType(*scopes)
		if err != nil {
			log.Panicf("Error con converting immediate type: %#v", err)
		}
		lval = immvalue.Value
	} else {
		var lssa SSAValue
		if lssa, ok = o.Left.(SSAValue); !ok {
			return "", fmt.Errorf("Left Assignable %#v does not implement SSAValue", o.Left)
		}
		lcode, err := lssa.ToLLVM(scopes)
		if err != nil {
			return "", fmt.Errorf("Error while converting operator: %v", err)
		}

		code = append(code, lcode)

		ltype, err = lssa.RealType(*scopes)
		if err != nil {
			return "", fmt.Errorf("Error while converting operator: %v", err)
		}
		lval, err = lssa.Id()
		if err != nil {
			return "", fmt.Errorf("Unable to retrieve lval: %v", err)
		}
	}

	if imm, ok := o.Right.(LLVMImmediate); ok {
		immvalue, err := imm.ToImmediateLLVM(scopes)
		if err != nil {
			return "", err
		}
		rtype, err = o.Right.(SSAValue).RealType(*scopes)
		if err != nil {
			return "", err
		}
		rval = immvalue.Value
	} else {
		var rssa SSAValue
		if rssa, ok = o.Right.(SSAValue); !ok {
			return "", fmt.Errorf("Right Assignable %#v does not implement SSAValue", o.Right)
		}
		rcode, err := rssa.ToLLVM(scopes)
		if err != nil {
			log.Printf("Rssa: %#v", rssa)
			log.Panicf("Error while converting operator: %v", err)
		}

		code = append(code, rcode)

		rtype, err = rssa.RealType(*scopes)
		if err != nil {
			return "", fmt.Errorf("Error while converting operator: %v", err)
		}
		rval, err = rssa.Id()
		if err != nil {
			return "", fmt.Errorf("Unable to retrieve lval: %v", err)
		}
	}

	if rtype != ltype {
		return "", fmt.Errorf("Mismatching types: %#v != %#v", ltype, rtype)
	}

	op_uid, err := scopes.ReserveLocal()
	if err != nil {
		return "", fmt.Errorf("unable to reserve local operator: %v", err)
	}

	var op string
	switch o.Optype {
	case OP_PLUS:
		op = "add"
		break
	case OP_MINUS:
		op = "sub"
		break
	case OP_LESS:
		op = "icmp slt"
		break
	case OP_GREATER:
		op = "icmp sgt"
		break
	case OP_EQQ:
		op = "icmp seq"
		break
	// OP_STAR
	// OP_OVER
	// OP_EQ
	// OP_COLONEQ
	// OP_PLUSEQ
	default:
		return "", fmt.Errorf("Missing operator properties for %#v", o.Optype)
	}


	o.uid = fmt.Sprintf("%%.tmp%d", op_uid)

	boolOps := []TokenType{
		OP_LESS, OP_GREATER,
	}
	o.realtype = ltype
	for _, tokentype := range boolOps {
		if tokentype == o.Optype {
			o.realtype = "bool"
			break
		}
	}

	llvmType, err := scopes.TypeRepr(ltype)
	if err != nil {
		log.Panicf("Unable to convert type %s: %v", ltype, err)
		return "", err
	}
	code = append(code, fmt.Sprintf("%s = %s %s %s, %s", o.uid, op, llvmType, lval, rval))
	return strings.Join(code, "\n"), nil
}

func (o *Operator) RealType(scopes Scopes) (string, error) {
	if o.realtype == "" {
		return "", fmt.Errorf("Trying to retrieve operator type before ToLLVM initialization")
	}
	return o.realtype, nil
}

func (o *Operator) TypeRepr(scopes Scopes) (string, error) {
	if o.realtype == "" {
		return "", fmt.Errorf("Trying to retrieve operator type before llvm initialization")
	}
	repr, err := scopes.TypeRepr(o.realtype)
	if err != nil {
		log.Panicf("Unable to retrieve operator type: %v", err)
		return "", err
	}
	return repr, nil
}

func (o *Operator) Id() (string, error) {
	if o.uid == "" {
		return "", fmt.Errorf("Trying to retrieve id before llvm initialization")
	}
	return o.uid, nil
}


func NewOperator(optype TokenType, left, right Assignable) (*Operator, error) {
	return &Operator{
		Optype: optype,
		Left:   left,
		Right:  right,
	}, nil
}

func ParseAssignable(p *TokenPeeker) (Assignable, error) {
	// https://en.cppreference.com/w/c/language/operator_precedence
	precedence := map[TokenType]int{
		OP_PLUS:   10, // +
		OP_MINUS:  10, // -
		OP_STAR:   20, // *
		OP_OVER:   20, // /
		OP_LESS:    5,  // <
		OP_GREATER: 5, // >
		OP_EQQ:     4, // ==
	}
	var err error

	// Step 1: read the whole expression
	assignables := []Assignable{}
	ops := []TokenType{}
	for {
		assignable, err := ParseAtomicAssignable(p)
		if err != nil {
			return nil, fmt.Errorf("Unable to read assignable: %v", err)
		}
		assignables = append(assignables, assignable)
		tok := p.PeekOne()
		if tok == nil {
			// eof reached
			break
		}

		if _, ok := precedence[tok.Type]; !ok {
			break
		}
		p.Read()
		ops = append(ops, tok.Type)
	}

	if len(ops) != len(assignables)-1 {
		return nil, &ParseError{
			Pos:   p.PeekOne().Position,
			error: fmt.Sprintf("Mismatching number of operator and expressions"),
		}
	}

	for len(assignables) != 1 {
		// find max priority
		maxPriority := 0
		for _, op := range ops {
			if precedence[op] > maxPriority {
				maxPriority = precedence[op]
			}
		}

		newAssignables := []Assignable{assignables[0]}
		newOps := []TokenType{}

		for i, op := range ops {
			if precedence[op] < maxPriority {
				// ignore this operator
				newAssignables = append(newAssignables, assignables[i + 1])
				newOps = append(newOps, op)
				continue
			}

			lastIdx := len(newAssignables) - 1
			newAssignables[lastIdx], err = NewOperator(op, newAssignables[lastIdx], assignables[i + 1])
			if err != nil {
				return nil, err
			}
		}
		assignables = newAssignables
		ops = newOps
	}
	return assignables[0], nil
}
