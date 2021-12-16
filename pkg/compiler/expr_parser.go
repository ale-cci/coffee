package compiler

import "fmt"

type Declaration struct {
	To    Var
	Value interface{}
}
type Assignment struct {
	To    Var
	Value interface{}
}

type Var string

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
	}
	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting expression, found: %q", tok.Value),
	}
}

type Assignable interface{}

type FnCall struct {
	Name   Var
	Params []Assignable
}

func ParseFunctionCall(p *TokenPeeker) (*FnCall, error) {
	tok := p.Read()
	if tok.Type != WORD {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Expected WORD, found: %q", tok.Value),
		}
	}

	if tok := p.Read(); tok.Type != LPAREN {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Expected (, found: %q", tok.Value),
		}
	} // read lparen

	params := []Assignable{}
	for p.PeekOne() != nil && p.PeekOne().Type != RPAREN {
		if len(params) > 0 {
			if  sep := p.PeekOne(); sep.Type == COMMA {
				p.Read()
			} else {
				return nil, &ParseError{
					Pos: sep.Position,
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
			Pos: t.Position,
			error: fmt.Sprintf("Expected ) , found: %q", t.Value),
		}
	}
	return &FnCall{
		Name: Var(tok.Value),
		Params: params,
	}, nil
}

type String string
func ParseAssignable(p *TokenPeeker) (Assignable, error) {
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
		return String(tok.Value[1:len(tok.Value)-1]), nil
	} else if tok.Type == WORD {
		tok := p.Read()
		if p.PeekOne() != nil && p.PeekOne().Type == LPAREN {
			p.Unread()
			fn, err := ParseFunctionCall(p)
			return fn, err
		}
		return Var(tok.Value), nil
	}
	return nil, &ParseError{
		Pos:   tok.Position,
		error: fmt.Sprintf("Expecting assignable, found: %q", tok.Value),
	}
}
