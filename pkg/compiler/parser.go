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
		// parse function import
		var stmt Statement

		switch tok.Type {
		case NL:
			peeker.Read()
			continue
		case KW_EXTERN:
			ext, err := ParseExtern(peeker)
			if err != nil {
				return nil, err
			}
			stmt = ext

		default:
			fn, err := ParseFunction(peeker)
			if err != nil {
				return nil, err
			}
			stmt = fn
		}

		body = append(body, stmt)
	}
	return &body, nil
}

func ParseExtern(p *TokenPeeker) (*ExternFunc, error) {
	tok := p.Read()
	if tok.Type != KW_EXTERN {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Expected extern keyword, found: %q", tok.Value),
		}
	}
	typ, err := ParseType(p)
	if err != nil {
		return nil, err
	}
	fnName := p.Read()
	if fnName.Type != WORD {
		return nil, &ParseError{
			Pos: fnName.Position,
			error: fmt.Sprintf("Expected function or variable name, found reserved word: %q", fnName.Value),
		}
	}

	args, err := ParseFunctionArgs(p)
	if err != nil {
		return nil, err
	}

	return &ExternFunc{
		ReturnType: typ,
		Name: fnName.Value,
		Args: args,
	}, nil
}


func ParseFunctionArgs(p *TokenPeeker) ([]Argument, error) {
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
	return args, nil
}

func ParseFunction(p *TokenPeeker) (*Function, error) {
	returnType, err := ParseType(p)
	if err != nil {
		return nil, err
	}
	name := p.Read()
	args, err := ParseFunctionArgs(p)
	if err != nil {
		return nil, err
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
