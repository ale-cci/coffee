package compiler

import (
	"fmt"
	"strconv"
)

func ParseTopLevelExpression(p *TokenPeeker) (Expression, error) {
	tok := p.PeekOne()
	if tok.Type == KW_IF {
		tok, err := ParseIfBlock(p)
		return tok, err
	} else if tok.Type == KW_FOR {
		tok, err := ParseForLoop(p)
		return tok, err
	} else if tok.Type == KW_RETURN {
		p.Read()
		val, err := ParseAssignable(p)
		if err != nil {
			return &Return{nil}, nil
		}
		return &Return{val}, nil
	} else if tok.Type == WORD || tok.Type == T_INT || tok.Type == T_CHAR {
		// a = b || a[] var = 3
		p.Read()
		if tok := p.PeekOne(); tok.Type == WORD || tok.Type == LSBRACKET || tok.Type == OP_STAR {
			// int a || int[1] a || a[1] = 3 cases ||
			p.Unread()
			typename, err := ParseType(p)
			if err != nil {
				return nil, err
			}

			varname := p.Read()
			if tok.Type == LSBRACKET && varname.Type == OP_EQ {
				// this is an assignment
				value, err := ParseAssignable(p)
				if err != nil {
					return nil, err
				}
				arr, err := ArrayTypeToArrayCell(typename)
				if err != nil {
					return nil, &ParseError{
						Pos:   varname.Position,
						error: err.Error(),
					}
				}
				return &Assignment{
					To:    arr,
					Value: value,
				}, nil
			} else if varname.Type != WORD {
				return nil, &ParseError{
					Pos:   varname.Position,
					error: fmt.Sprintf("Expecting variable name, got %q", varname.Value),
				}
			}

			// expect equal
			if tok := p.PeekOne(); tok.Type == OP_EQ {
				p.Read()
				value, err := ParseAssignable(p)
				if err != nil {
					return nil, err
				}
				return &Declaration{
					To: &Var{
						Type: typename,
						Name: varname.Value,
					},
					Value: value,
				}, nil
			}
			// comma
			return &Declaration{
				To: &Var{
					Type: typename,
					Name: varname.Value,
				},
				Value: nil,
			}, nil
		} else {
			p.Unread()
		}
	}
	expr, err := ParseExpression(p)
	return expr, err
}

// this is required because i've fucked up the type declaration
func ArrayTypeToArrayCell(t Type) (*ArrayCell, error) {
	arr := t.(*ArrayType)

	if hasArray, ok := arr.Base.(ArrayType); ok {
		// contains another array
		content, err := ArrayTypeToArrayCell(hasArray)
		if err != nil {
			return nil, err
		}
		return &ArrayCell{
			Var: content,
			Pos: &Number{Value: fmt.Sprintf("%d", arr.Size), Type: "int"},
		}, nil
	} else if varname, ok := arr.Base.(string); ok {
		return &ArrayCell{
			Var: &Var{Name: varname},
			Pos: &Number{Value: fmt.Sprintf("%d", arr.Size), Type: "int"},
		}, nil
	}
	return nil, fmt.Errorf("Unable to parse array type to array cell %#v", arr.Base)
}

func ParseForLoop(p *TokenPeeker) (*ForLoop, error) {
	tok := p.Read()
	if tok.Type != KW_FOR {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expecting 'for' keyword, got: %q", tok.Value),
		}
	}

	init, err := ParseExpression(p)
	if err != nil {
		return nil, err
	}
	// assert ;
	tok = p.Read()
	if tok.Type != SEMICOLON {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expecting ; in 'for' definition block, got %q", tok.Value),
		}
	}

	cond, err := ParseAssignable(p)
	if err != nil {
		return nil, err
	}
	// assert ;
	tok = p.Read()
	if tok.Type != SEMICOLON {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expecting ; in 'for' definition block, got %q", tok.Value),
		}
	}

	var iter Expression = nil
	if p.PeekOne().Type != LBRACKET {
		iter, err = ParseExpression(p)
		if err != nil {
			return nil, err
		}
	}

	// expect open bracket
	if tok := p.Read(); tok.Type != LBRACKET {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected {, found: %q", tok.Value),
		}
	}

	body, err := ParseBlock(p)
	if err != nil {
		return nil, err
	}

	return &ForLoop{
		Init:      init,
		Incr:      iter,
		Condition: cond,
		Body:      body,
	}, nil
}

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
			return &Declaration{
				To:    &Var{Name: tok.Value},
				Value: assignable,
			}, nil
		} else if next.Type == DOT {
			p.Unread()
			attr, err := ParseAttrs(p)
			if err != nil {
				return nil, err
			}

			if p.PeekOne().Type == LPAREN {
				params, err := ParseFunctionCallParens(p)
				if err != nil {
					return nil, err
				}
				return &FnCall{
					Name: attr,
					Params: params,
				}, nil
			}

			if p.PeekOne().Type == OP_EQ {
				p.Read()
				assignable, err := ParseAssignable(p)
				if err != nil {
					return nil, err
				}
				return &Assignment{
					To: attr,
					Value: assignable,
				}, nil
			}

			return attr, nil
		} else if next.Type == OP_EQ {
			p.Read()
			assignable, err := ParseAssignable(p)
			if err != nil {
				return nil, err
			}
			return &Assignment{
				To:    &Var{Name: tok.Value},
				Value: assignable,
			}, nil
		} else if next.Type == LPAREN {
			p.Unread()
			fnCall, err := ParseFunctionCall(p)
			return fnCall, err
		} else if next.Type == LSBRACKET {
			p.Read()
			name := tok.Value
			indexToken := p.Read()
			if indexToken.Type != INT {
				return nil, &ParseError{
					Pos:   indexToken.Position,
					error: fmt.Sprintf("Expected int value, fount: %q", indexToken.Value),
				}
			}

			index, err := strconv.Atoi(indexToken.Value)
			if err != nil {
				return nil, &ParseError{
					Pos:   indexToken.Position,
					error: fmt.Sprintf("Failed integer conversion of: %q", indexToken.Value),
				}
			}

			if tok := p.Read(); tok.Type != RSBRACKET {
				return nil, &ParseError{
					Pos:   tok.Position,
					error: fmt.Sprintf("Expected closed ], found %q", tok.Value),
				}

			}

			return &ArrayCell{
				Var: &Var{Name: name},
				Pos: &Number{Value: fmt.Sprintf("%d", index), Type: "int"},
			}, nil
		}
	}

	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting expression, found: %q", tok.Value),
	}
}

func ParseIfBlock(p *TokenPeeker) (*IfElseBlock, error) {
	tok := p.Read()
	if tok.Type != KW_IF && tok.Type != KW_ELIF {
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
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected {, found: %q", tok.Value),
		}
	}

	body, err := ParseBlock(p)
	if err != nil {
		return nil, err
	}
	ifelse.Body = body

	next := p.PeekOne()

	if next != nil && next.Type == KW_ELIF {
		block, err := ParseIfBlock(p)
		if err != nil {
			return nil, err
		}
		ifelse.Else = []Expression{block}

	} else if next != nil && next.Type == KW_ELSE {
		p.Read()
		if tok := p.Read(); tok.Type != LBRACKET {
			return nil, &ParseError{
				Pos:   tok.Position,
				error: fmt.Sprintf("Expected { after else, found: %q", tok.Value),
			}
		}
		body, err := ParseBlock(p)
		if err != nil {
			return nil, err
		}
		ifelse.Else = body
	}
	return &ifelse, nil
}

func ParseFunctionCallParens(p *TokenPeeker) ([]Assignable, error) {
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
	return params, nil
}

func ParseFunctionCall(p *TokenPeeker) (*FnCall, error) {
	tok := p.Read()
	if tok.Type != WORD {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected WORD, found: %q", tok.Value),
		}
	}

	params, err := ParseFunctionCallParens(p)
	if err != nil {
		return nil, err
	}
	return &FnCall{
		Name:   &Var{Name: tok.Value},
		Params: params,
	}, nil
}
func ParseAttrs(p *TokenPeeker) (*Var, error) {
	tok := p.Read()
	if tok.Type != WORD {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("expected WORD got %q", tok.Value),
		}
	}
	p.Read()
	attr := &Var{Name: tok.Value, Trailer: []string{}}
	for true {
		next := p.Read()
		if next.Type != WORD {
			return nil, &ParseError{
				Pos:   next.Position,
				error: fmt.Sprintf("expected WORD got %q", next.Value),
			}
		}
		attr.Trailer = append(attr.Trailer, next.Value)

		next = p.PeekOne()
		if next == nil || next.Type != DOT {
			break
		}
		p.Read()
	}

	return attr, nil
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
		expr, err := ParseTopLevelExpression(p)
		if err != nil {
			return nil, err
		}
		expressions = append(expressions, expr)
	}

	// read end token
	tok := p.Read()
	if tok == nil {
		return nil, &ParseError{
			Pos:   -1,
			error: "Code block must be closed by '}', reached end of file",
		}
	}
	if tok.Type != RBRACKET {
		return nil, &ParseError{
			Pos:   -1,
			error: fmt.Sprintf("Expected '}', got %s", tok.Value),
		}
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
		return &Number{
			Type:  "int",
			Value: tok.Value,
		}, nil
	} else if tok.Type == OP_BIN_AND {
		p.Read()
		ass, err := ParseAtomicAssignable(p)
		if err != nil {
			return nil, err
		}
		return &Addr{
			Of: ass.(*Var),
		}, nil
	} else if tok.Type == STR {
		tok := p.Read()
		return &String{Value: tok.Value[1 : len(tok.Value)-1]}, nil
	} else if tok.Type == WORD {
		tok := p.Read()
		next := p.PeekOne()
		if next == nil {
			return &Var{Name: tok.Value}, nil
		}
		if next.Type == LPAREN {
			p.Unread()
			fn, err := ParseFunctionCall(p)
			return fn, err
		} else if next.Type == DOT {
			p.Unread()
			attr, err := ParseAttrs(p)
			if err != nil {
				return nil, err
			}
			if p.PeekOne() != nil && p.PeekOne().Type == LPAREN {
				params, err := ParseFunctionCallParens(p)
				if err != nil {
					return nil, err
				}
				return &FnCall{
					Name: attr,
					Params: params,
				}, nil
			}
			return attr, nil
		} else if next.Type == LSBRACKET {
			var val SSAValue
			val = &Var{Name: tok.Value}

			for p.PeekOne() != nil && p.PeekOne().Type == LSBRACKET {
				p.Read()
				pos, err := ParseAssignable(p)
				if err != nil {
					return nil, err
				}
				if tok := p.Read(); tok.Type != RSBRACKET {
					return nil, &ParseError{
						Pos:   tok.Position,
						error: fmt.Sprintf("Expecting ], got %q", tok.Value),
					}
				}
				val = &ArrayCell{Var: val, Pos: pos}
			}

			return val, nil
		}

		return &Var{Name: tok.Value}, nil
	} else if tok.Type == KW_TRUE || tok.Type == KW_FALSE {
		p.Read()
		return &Boolean{Value: tok.Value}, nil
	} else if tok.Type == LSBRACKET {
		// parse array [1, 2, 3]
		p.Read()
		for p.PeekOne().Type != RSBRACKET {
			// read assignable
			// expect comma or closed paren
		}
		if tok := p.Read(); tok.Type != RSBRACKET {
			return nil, &ParseError{
				Pos:   tok.Position,
				error: fmt.Sprintf("Expecting closed ], got %q", tok.Value),
			}
		}
		return &StaticArray{
			Elements: []Assignable{},
		}, nil
	}
	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting assignable, found: %q", tok.Value),
	}
}
