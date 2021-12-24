package compiler

import "fmt"


func ParseExpression(p *TokenPeeker) (Expression, error) {
	tok := p.PeekOne()
	if tok.Type == WORD {
		tok := p.Read()
		next := p.PeekOne()
		if next.Type == OP_COLONEQ {
			// declaration
			p.Read()

			assignable, err := ParseAssignable(p)
			if err != nil {
				return nil, err
			}
			return Declaration{
				To:    Var(tok.Value),
				Value: assignable,
			}, nil
		} else if next.Type == OP_EQ {
			p.Read()
			assignable, err := ParseAssignable(p)
			if err != nil {
				return nil, err
			}
			return Assignment{
				To:    Var(tok.Value),
				Value: assignable,
			}, nil
		} else if next.Type == LPAREN {
			p.Unread()
			fnCall, err := ParseFunctionCall(p)
			return fnCall, err
		}
	} else if tok.Type == KW_IF {
		tok, err := ParseIfBlock(p)
		return tok, err
	} else if tok.Type == KW_RETURN {
		p.Read()
		val, err := ParseAssignable(p)
		if err != nil {
			return nil, err
		}
		return &Return{ val }, nil
	}

	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting expression, found: %q", tok.Value),
	}
}

func ParseIfBlock(p *TokenPeeker) (*IfElseBlock, error) {
	tok := p.Read()
	if tok.Type != KW_IF {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected IF, found: %q", tok.Value),
		}
	}
	// read expression
	expr, err := ParseAssignable(p)
	if err != nil {
		return nil, err
	}
	ifelse := IfElseBlock{
		Condition: expr,
	}

	// expect open bracket
	if tok := p.Read(); tok.Type != LBRACKET {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Expected {, found: %q", tok.Value),
		}
	}

	body, err := ParseBlock(p)
	if err != nil {
		return nil, err
	}

	ifelse.Body = body
	return &ifelse, nil
}

func ParseFunctionCall(p *TokenPeeker) (*FnCall, error) {
	tok := p.Read()
	if tok.Type != WORD {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected WORD, found: %q", tok.Value),
		}
	}

	if tok := p.Read(); tok.Type != LPAREN {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected (, found: %q", tok.Value),
		}
	} // read lparen

	params := []Assignable{}
	for p.PeekOne() != nil && p.PeekOne().Type != RPAREN {
		if len(params) > 0 {
			if sep := p.PeekOne(); sep.Type == COMMA {
				p.Read()
			} else {
				return nil, &ParseError{
					Pos:   sep.Position,
					error: fmt.Sprintf("Expected separator ',', found: %q", sep.Value),
				}
			}
		}

		assignable, err := ParseAssignable(p)
		if err != nil {
			return nil, err
		}
		params = append(params, assignable)
	}
	if t := p.Read(); t.Type != RPAREN {
		return nil, &ParseError{
			Pos:   t.Position,
			error: fmt.Sprintf("Expected ) , found: %q", t.Value),
		}
	}
	return &FnCall{
		Name:   Var(tok.Value),
		Params: params,
	}, nil
}

func ParseBlock(p *TokenPeeker) ([]Expression, error) {
	// TODO: parse function body
	expressions := []Expression{}
	for p.PeekOne().Type != RBRACKET {
		// skip empty new lines
		if p.PeekOne().Type == NL {
			p.Read()
			continue
		}
		expr, err := ParseExpression(p)
		if err != nil {
			return nil, err
		}
		expressions = append(expressions, expr)
	}

	return expressions, nil
}


func ParseAtomicAssignable(p *TokenPeeker) (Assignable, error) {
	tok := p.PeekOne()
	if tok == nil {
		return nil, &ParseError{
			Pos:   -1,
			error: fmt.Sprintf("Expecing assignable while reaching end of file"),
		}
	}

	if tok.Type == INT {
		p.Read()
		return Number{
			Type:  "int",
			Value: tok.Value,
		}, nil
	} else if tok.Type == STR {
		tok := p.Read()
		return &String{Value: tok.Value[1 : len(tok.Value)-1]}, nil
	} else if tok.Type == WORD {
		tok := p.Read()
		if p.PeekOne() != nil && p.PeekOne().Type == LPAREN {
			p.Unread()
			fn, err := ParseFunctionCall(p)
			return fn, err
		}
		return Var(tok.Value), nil
	} else if tok.Type == KW_TRUE || tok.Type == KW_FALSE {
		p.Read()
		return Boolean(tok.Value), nil
	}
	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting assignable, found: %q", tok.Value),
	}
}

// read tokens until an arithmetic operator is found
func ParseAssignable(p *TokenPeeker) (Assignable, error){
	type Op struct {
		Priority int
		New func(left, right Assignable)Assignable
	}
	opmap := map[TokenType]Op{
		OP_PLUS: {
			10,
			func(left, right Assignable)Assignable{
				return Sum{Left: left, Right: right}
			},
		},
		OP_MINUS: {
			10,
			func(left, right Assignable)Assignable{
				return OpMinus{Left: left, Right: right}
			},
		},
		OP_STAR: {
			20,
			func(l, r Assignable)Assignable{
				return OpTimes{Left: l, Right: r}
			},
		},
		OP_OVER: {
			20,
			func(l, r Assignable)Assignable{
				return OpOver{Left: l, Right: r}
			},
		},
	}
	// read assignalbe,

	// check for operator
	assignables := []Assignable{}
	ops := []TokenType{}
	for {
		ass, err := ParseAtomicAssignable(p)
		if err != nil {
			return nil, err
		}
		assignables = append(assignables, ass)

		tok := p.PeekOne()
		if tok == nil {
			// end of tokens
			break
		}
		_, ok := opmap[tok.Type]
		if !ok {
			break
		}
		// token is an concat operator, read it
		p.Read()
		ops = append(ops, tok.Type)
	}

	if len(ops) != len(assignables) - 1 {
		return nil, &ParseError{
			Pos: p.PeekOne().Position,
			error: fmt.Sprintf("Mismatching number of operator for expression"),
		}
	}

	for len(assignables) != 1{
		// find max priority
		maxPriority := 0
		for _, op := range ops {
			if opmap[op].Priority > maxPriority {
				maxPriority = opmap[op].Priority
			}
		}
		// execute sequentially all operations with that priority
		newAssignables := []Assignable{
			assignables[0],
		}
		newOps := []TokenType{}

		for i, op := range ops {
			currOp := opmap[op]
			if currOp.Priority != maxPriority {
				newAssignables = append(newAssignables, assignables[i + 1])
				newOps = append(newOps, op)
				continue
			}

			lastIdx := len(newAssignables) -1
			newAssignables[lastIdx] = currOp.New(newAssignables[lastIdx], assignables[i + 1])
		}

		assignables = newAssignables
		ops = newOps
	}

	return assignables[0], nil
}
