package compiler

import "fmt"

type ParseError struct {
	error string
	Pos   int64
}

func (p *ParseError) Error() string {
	return fmt.Sprintf("[%d] ERROR: %v", p.Pos, p.error)
}

type Parsable interface {
	Parse([]Token) *ParseError
}


func Parse(tokens []Token) (*AST, error) {
	peeker := NewTokenPeeker(tokens)
	body := []Statement{}

	for peeker.HasTokens() {
		tok := peeker.PeekOne()
		if tok.Type == NL {
			// ignore empty newlines
			peeker.Read()
			continue
		}
		// parse function import
		fn, err := ParseFunction(peeker)
		if err != nil {
			return nil, err
		}

		body = append(body, fn)
	}
	return &body, nil
}

func ParseFunction(p *TokenPeeker) (*Function, error) {
	returnType, err := ParseType(p)
	if err != nil {
		return nil, err
	}
	name := p.Read()
	if tok := p.Read(); tok.Type != LPAREN {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected ( found %s", tok.Value),
		}
	}

	// parse function arguments
	args := []Argument{}
	var prevType Type
	for p.PeekOne().Type != RPAREN {
		// read tokens until comma or rparen
		toks := len(p.PeekUntil(func(t *Token) bool {
			return !(t.Type == RPAREN || t.Type == COMMA)
		}))
		if toks > 1 {
			// definition has a type in it
			t, err := ParseType(p)
			prevType = t
			if err != nil {
				return nil, err
			}
		}
		name := p.Read()
		if name.Type != WORD {
			return nil, &ParseError{
				Pos:   name.Position,
				error: fmt.Sprintf("Expected argument name, found %s", name.Value),
			}
		}
		args = append(args, Argument{
			Name: name.Value,
			Type: prevType,
		})
	}

	// ensure last token is closed )
	if tok := p.Read(); tok.Type != RPAREN {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected ) found %q", tok.Value),
		}
	}
	if tok := p.Read(); tok.Type != LBRACKET {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected { found %q", tok.Value),
		}
	}
	expressions, err := ParseBlock(p)
	if err != nil {
		return nil, err
	}

	if tok := p.Read(); tok.Type != RBRACKET {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Expected } found %q", tok.Value),
		}
	}

	return &Function{
		Name:       name.Value,
		Args:       args,
		ReturnType: returnType,
		Body:       expressions,
	}, nil
}

func ParseType(p *TokenPeeker) (Type, error) {
	t := p.Read()
	if !(t.Type == T_VOID || t.Type == T_INT || t.Type == WORD) {
		return nil, &ParseError{
			Pos:   t.Position,
			error: fmt.Sprintf("Expected type, found: %q", t.Value),
		}
	}
	return t.Value, nil
}
