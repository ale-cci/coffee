package compiler

// top level statement, could be a function, import or other top level stuff
type Statement interface{}
type AST = []Statement

// type representation, for variable tyeps, function rv types...
type Type interface {
}

type TypeAlias struct {
	Name string
	Type Type
	Uid  string
}

// expression with value, includes:
// - function calls
// - operations ?
// - variables
type Expression interface {
}

type Import struct {
	Path string
	As   string
}

type Pointer struct {
	Of Type
}
type Addr struct {
	Of *Var
	Uid string
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

type Constant struct {
	To *Var
	Value interface{}
}

type ForLoop struct {
	Init      Expression
	Condition Assignable
	Incr      Expression
	Body      []Expression
}
type Assignment struct {
	To    SSAValue
	Value interface{}
	Uid   string
}

// array type defintion, always contains a size, es. int[32] or int[] for any
// array, in that case size is -1
type ArrayType struct {
	Base Type
	Size int
}

type StructType struct {
	Fields []Argument
}
type ArrayCell struct {
	Var SSAValue
	Pos Assignable
	Uid string
}

type StaticArray struct {
	Elements []Assignable
}


type Var struct {
	Name    string
	Type    Type
	Uid     string
	Trailer []string
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
	Uid    string
}

type ImportType struct {
	From string
	Type string
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
