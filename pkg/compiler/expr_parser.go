package compiler

import "fmt"

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
			return nil, err
		}
		return &Return{val}, nil
	}
	expr, err := ParseExpression(p)
	return expr, err
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

	iter, err := ParseExpression(p)
	if err != nil {
		return nil, err
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
		}
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
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected {, found: %q", tok.Value),
		}
	}

	body, err := ParseBlock(p)
	if err != nil {
		return nil, err
	}
	ifelse.Body = body

	if nextToken := p.PeekOne(); nextToken != nil && nextToken.Type == KW_ELSE {
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
		Name:   &Var{Name: tok.Value},
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
		return &Var{Name: tok.Value}, nil
	} else if tok.Type == KW_TRUE || tok.Type == KW_FALSE {
		p.Read()
		return &Boolean{Value: tok.Value}, nil
	}
	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting assignable, found: %q", tok.Value),
	}
}
