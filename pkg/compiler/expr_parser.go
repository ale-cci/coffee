package compiler

import (
	"fmt"
	"strings"
	// "strconv"
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

	var err error
	var init Expression = nil

	if p.PeekOne().Type != SEMICOLON {
		init, err = ParseExpression(p)
		if err != nil {
			return nil, err
		}
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

func ParseDeclaration(p *TokenPeeker) (Expression, error) {
	typename, err := ParseType(p)
	if err != nil {
		return nil, err
	}
	name := p.PeekOne()
	if name == nil || name.Type != WORD {
		return nil, &ParseError{
			Pos: name.Position,
			error: fmt.Sprintf("[Declaration]: Expecting WORD toke for declaration, found: %#v", name),
		}
	}
	p.Read()

	var initValue Assignable = nil
	if tok := p.PeekOne(); tok != nil && tok.Type == OP_EQ {
		p.Read()
		initValue, err = ParseAssignable(p)
		if err != nil {
			return nil, err
		}
	}

	return &Declaration{
		To: &Var{Name: name.Value, Type: typename},
		Value: initValue,
	}, nil
}

func ParseImplicitDeclaration(p *TokenPeeker) (Expression, error) {
	tok := p.PeekOne()
	if tok == nil || tok.Type != WORD {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("[ImplicitDecl]: expecting WORD, found %#v", tok),
		}
	}
	p.Read()
	if next := p.PeekOne(); next == nil || next.Type != OP_COLONEQ {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("[ImplicitDecl]: expecting :=, found %#v", next),
		}
	}
	p.Read()
	value, err := ParseAssignable(p)
	if err != nil {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Unable to parse implicit declaration: %v", err),
		}
	}
	return &Declaration{
		To: &Var{ Name: tok.Value },
		Value: value,
	}, nil
}

func ParseAssignment(p *TokenPeeker) (Expression, error) {
	dest, err := ParseAssignableDestination(p)
	if err != nil {
		return nil, err
	}
	if tok := p.PeekOne(); tok == nil || tok.Type != OP_EQ {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("[Assignment]: Unable to parse assignment, expecting =, found: %#v", tok),
		}
	}
	p.Read()

	value, err := ParseAssignable(p)
	if err != nil {
		return nil, err
	}
	return &Assignment{
		To: dest.(SSAValue),
		Value: value,
	}, nil
}

func ParseFnCall(p *TokenPeeker) (Expression, error) {
	dest, err := ParseAssignableDestination(p)
	if err != nil {
		return nil, err
	}
	if tok := p.PeekOne(); tok == nil || tok.Type != LPAREN {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("[FnCall]: Unable to parse assignment, expecting (, found: %#v", tok),
		}
	}
	params, err := ParseFunctionCallParens(p)
	if err != nil {
		return nil, err
	}
	return &FnCall{
		Name: dest.(*Var),
		Params: params,
	}, nil
}

func ParseExpression(p *TokenPeeker) (Expression, error) {
	tok := p.PeekOne()

	var expr Expression
	var err error

	errors := []string{}

	origIdx := p.index
	exprs := []func(*TokenPeeker)(Expression, error) {
		ParseDeclaration,
		ParseImplicitDeclaration,
		ParseAssignment,
		ParseFnCall,
	}
	for _, parser := range exprs {
		if expr, err = parser(p); err == nil {
			return expr, nil
		}
		p.index = origIdx
		errors = append(errors, err.Error())
	}

	return nil, &ParseError{
		Pos: tok.Position,
		error: fmt.Sprintf("Unable to interpret as expression for one of the following reasons: \n%s", strings.Join(errors, "\n")),
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
	dest, err := ParseAssignableDestination(p)
	if err != nil {
		return nil, err
	}

	params, err := ParseFunctionCallParens(p)
	if err != nil {
		return nil, err
	}
	return &FnCall{
		Name:   dest.(*Var),
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


func ParseAssignableDestination(p *TokenPeeker) (Assignable, error) {
	tok := p.PeekOne()
	if tok.Type == DOT {
		p.Read()
		ass, err := ParseAssignableDestination(p)
		if err != nil {
			return nil, err
		}
		return &Pointer{
			Of: ass,
		}, nil
	}
	if tok.Type != WORD {
		return nil, fmt.Errorf("!!!")
	}
	p.Read()

	next := p.PeekOne()
	if next == nil {
		return &Var{Name: tok.Value}, nil
	}

	if next.Type == DOT {
		p.Unread()
		attr, err := ParseAttrs(p)
		if err != nil {
			return nil, err
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
}

func ParseTypeCasting(p *TokenPeeker) (Assignable, error) {
	if tok := p.PeekOne(); tok == nil || tok.Type != LPAREN {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Type casting must start with (, found: %q", tok.Value),
		}
	}
	p.Read()

	toType, err := ParseType(p)
	if err != nil {
		return nil, err
	}

	if tok := p.PeekOne(); tok == nil || tok.Type != RPAREN {
		return nil, &ParseError{
			Pos: tok.Position,
			error: fmt.Sprintf("Type casting must end with ), found: %q", tok.Value),
		}
	}
	p.Read()

	ass, err := ParseSimpleAssignable(p)
	return &Casting{
		Of: ass,
		Type: toType,
	}, nil
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
	} else if tok.Type == NULL {
		p.Read()
		return &Null{}, nil
	} else if tok.Type == CHAR {
		p.Read()
		return &Number{
			Type: "chr",
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
		ass, err := ParseAssignableDestination(p)
		if err != nil {
			return nil, err
		}
		if next := p.PeekOne(); next != nil && next.Type == LPAREN {
			params, err := ParseFunctionCallParens(p)
			if err != nil {
				return nil, err
			}

			return &FnCall{
				Name: ass.(*Var),
				Params: params,
			}, nil
		}
		return ass, err
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
