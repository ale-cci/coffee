package compiler

import (
	"fmt"
	"strconv"
)

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
			break

		case KW_ALIAS:
			typealias, err := ParseTypeAlias(peeker)
			if err != nil {
				return nil, err
			}
			stmt = typealias
			break

		case KW_IMPORT:
			importStmt, err := ParseImport(peeker)
			if err != nil {
				return nil, err
			}
			stmt = importStmt
			break

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
			Pos:   tok.Position,
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
			Pos:   fnName.Position,
			error: fmt.Sprintf("Expected function or variable name, found reserved word: %q", fnName.Value),
		}
	}

	args, err := ParseFunctionArgs(p)
	if err != nil {
		return nil, err
	}

	return &ExternFunc{
		ReturnType: typ,
		Name:       fnName.Value,
		Args:       args,
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

		if t := p.Read(); t.Type == RPAREN {
			p.Unread()
		}
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

	return &Function{
		Name:       name.Value,
		Args:       args,
		ReturnType: returnType,
		Body:       expressions,
	}, nil
}

func ParseType(p *TokenPeeker) (Type, error) {
	t := p.Read()
	if t.Type == VARARG {
		return t.Type, nil
	}

	var returnType Type
	if t.Type == KW_STRUCT {
		fields := []Argument{}
		if tok := p.Read(); tok.Type != LBRACKET {
			return nil, &ParseError{
				Pos:   t.Position,
				error: fmt.Sprintf("Required { after 'struct' keyword, found: %q", t.Value),
			}
		}
		// ignore trailing newlines
		for p.PeekOne().Type == NL {
			p.Read()
		}

		// read struct fields
		for p.PeekOne().Type != RBRACKET {
			typeval, err := ParseType(p)
			if err != nil {
				return nil, err
			}
			name := p.Read()

			if name.Type != WORD {
				return nil, &ParseError{
					Pos:   name.Position,
					error: fmt.Sprintf("Expect struct field name, found: %q", name.Value),
				}
			}

			fields = append(fields, Argument{
				Type: typeval,
				Name: name.Value,
			})

			if tok := p.Read(); tok.Type != COMMA {
				return nil, &ParseError{
					Pos:   tok.Position,
					error: fmt.Sprintf("Required comma after struct arg, got %q", tok.Value),
				}
			}

			// ignore trailing newlines
			for p.PeekOne().Type == NL {
				p.Read()
			}
		}

		if tok := p.Read(); tok.Type != RBRACKET {
			return nil, &ParseError{
				Pos:   tok.Position,
				error: fmt.Sprintf("Struct type must end with }, got: %q", tok.Value),
			}
		}

		returnType = &StructType{
			Fields: fields,
		}
	} else {
		if !(t.Type == T_VOID || t.Type == T_INT || t.Type == WORD || t.Type == T_CHAR) {
			return nil, &ParseError{
				Pos:   t.Position,
				error: fmt.Sprintf("Expected type, found: %q", t.Value),
			}
		}

		var baseType Type
		baseType = t.Value
		for p.PeekOne() != nil && p.PeekOne().Type == LSBRACKET {
			p.Read()
			var size int

			// read number
			var err error
			tokSize := p.Read()
			if tokSize.Type != INT {
				return nil, &ParseError{
					Pos:   t.Position,
					error: fmt.Sprintf("Expected ] or array size, found: %q", t.Value),
				}
			}
			size, err = strconv.Atoi(tokSize.Value)
			if err != nil {
				return nil, &ParseError{
					Pos:   t.Position,
					error: fmt.Sprintf("Unable to convert %q as an integer", tokSize.Value),
				}
			}

			baseType = &ArrayType{
				Base: baseType,
				Size: size,
			}
			if tok := p.Read(); tok.Type != RSBRACKET {
				return nil, &ParseError{
					Pos:   t.Position,
					error: fmt.Sprintf("Expectd closed ], found: %q", t.Value),
				}
			}
		}
		returnType = baseType
	}

	for true {
		if tok := p.PeekOne(); tok != nil && tok.Type == OP_STAR {
			p.Read()
			returnType = &Pointer{
				Of: returnType,
			}
		} else {
			break
		}
	}
	return returnType, nil
}

func ParseTypeAlias(p *TokenPeeker) (*TypeAlias, error) {
	if tok := p.PeekOne(); tok.Type != KW_ALIAS {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("Type alias requires 'alias' keyword"),
		}
	}
	p.Read()

	to := p.Read()
	if to.Type != WORD {
		return nil, &ParseError{
			Pos:   to.Position,
			error: fmt.Sprintf("Unable to assign type to reserved token: %q", to.Value),
		}
	}
	if tok := p.Read(); tok.Type != OP_EQ {
		return nil, &ParseError{
			Pos:   to.Position,
			error: fmt.Sprintf("Expecting = for type alias, got: %q", to.Value),
		}
	}
	typeval, err := ParseType(p)
	if err != nil {
		return nil, err
	}
	return &TypeAlias{
		Name: to.Value,
		Type: typeval,
	}, nil
}

func ParseImport(p *TokenPeeker) (*Import, error) {
	if tok := p.PeekOne(); tok.Type != KW_IMPORT {
		return nil, &ParseError{
			Pos:   tok.Position,
			error: fmt.Sprintf("import requires 'import' keyword"),
		}
	}
	p.Read()

	// could be comma
	path := p.Read()
	p.Read() // as
	name := p.Read()

	return &Import{
		Path: path.Value[1 : len(path.Value)-1],
		As:   name.Value,
	}, nil
}
