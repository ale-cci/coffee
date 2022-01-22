package compiler

// top level statement, could be a function, import or other top level stuff
type Statement interface{}
type AST = []Statement

// type representation, for variable tyeps, function rv types...
type Type interface {
}
// expression with value, includes:
// - function calls
// - operations ?
// - variables
type Expression interface {
}

// Argument of a function definition
type Argument struct {
	Type Type
	Name string
}
type Return struct{ Value Assignable }

type ExternFunc struct {
	Name       string
	ReturnType Type
	Args       []Argument
}
type Function struct {
	Name       string
	ReturnType Type
	Args       []Argument
	Body       []Expression
}

type Number struct {
	Value string
	Type  Type
	uid   string
}

type Declaration struct {
	To    *Var
	Value interface{}
}
type Assignment struct {
	To    *Var
	Value interface{}
}

type Var struct {
	Name string
	Type Type
	Uid  string
}

type String struct {
	Value string
	Uid   string
}

type Boolean struct {
	Value string
	Uid   string
}

// things that could be assigned, like a variable, a function call, etc
type Assignable interface{}

type FnCall struct {
	Name   *Var
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
	Left  Assignable
	Right Assignable
}

type OpLess struct {
	Left  Assignable
	Right Assignable
}
