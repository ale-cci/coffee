package compiler

type ParseError struct {
	error string
	Pos int64
}
func(p *ParseError) Error() string {
	return p.error
}

type Parsable interface {
	Parse([]Token) *ParseError
}

type Function struct {
	Name Token
	Args []Argument
	ReturnType Type

	Body []Statement
}
func (f *Function) Parse(t []Token) error {
	f.Body = []Statement{}
	return nil
}

type Argument struct {
	Name Token
	Type Type
}

type Type struct {
	Tokens []Token
}

// type StatementType int
// const (
// 	STMT_FN_CALL StatementType = iota
// 	STMT_ASSIGN
// 	STMT_DECLARATION
// 	STMT_IF_ELSE
// 	STMT_RETURN
// 	STMT_LOOP
// )


type ConstValue struct {
	Type Type
	Value string
}

type Statement interface {
	Parsable
	DeclaresVariables() map[string]Type
	RequiresVariables() map[string]Type

	ConstValues() map[string]ConstValue
}
