package compiler

// top level statement, could be a function, import or other top level stuff
type Statement interface{}
type AST = []Statement

// type representation, for variable tyeps, function rv types...
type Type interface{}

// expression with value, includes:
// - function calls
// - operations ?
// - variables
type Expression interface{
}

// Argument of a function definition
type Argument struct {
	Type Type
	Name string
}
type Return struct {Value Assignable }

type Function struct {
	Name       string
	ReturnType Type
	Args       []Argument
	Body       []Expression
}

type Number struct {
	Value string
	Type  Type
}

type Declaration struct {
	To    Var
	Value interface{}
}
type Assignment struct {
	To    Var
	Value interface{}
}

type Var string
type String string
type Boolean string

// things that could be assigned, like a variable, a function call, etc
type Assignable interface{}

type FnCall struct {
	Name   Var
	Params []Assignable
}

type IfElseBlock struct {
	Body      []Expression
	Else      []Expression
	Condition Assignable
}

type Sum struct {
	Left  Assignable
	Right Assignable
}

// multiplication between assignables
type OpTimes struct {
	Left  Assignable
	Right Assignable
}

// multiplication between assignables
type OpMinus struct {
	Left  Assignable
	Right Assignable
}

type OpOver struct {
	Left Assignable
	Right Assignable
}
