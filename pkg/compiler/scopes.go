package compiler

import (
	"fmt"
	"strings"
)

// runtime name
type RtName struct {
	Type string // could be function or variable or could be cons
}

type SSA interface {
	ToLLVM(*Scopes) (string, error)
}
type SSAValue interface {
	SSA
	Type(Scopes) (string, error)
	Id() (string, error)
}

type NameInfo struct {
	HasType   Type
	Arguments []Argument
}

// should be mutable
type RtScope struct {
	// available types
	TypeAliases map[string]string

	// global variables
	// function
	Names map[string]NameInfo

	// defined functions
	externs []string
}

func (rs *RtScope) DefineVar(name string, typeval Type, args []Argument, extern bool) error {
	if _, ok := rs.Names[name]; ok {
		return fmt.Errorf("Function or variable %q is already defined in the scope.", name)
	}
	rs.Names[name] = NameInfo{
		HasType:   typeval,
		Arguments: args,
	}

	if extern {
		rs.externs = append(rs.externs, name)
	}
	return nil
}

func DefineExtern(scopes *Scopes, name string, i NameInfo) (string, error) {
	strReturnType, err := scopes.TypeRepr(i.HasType)
	if err != nil {
		return "", err
	}
	argNames := []string{}
	fmt.Printf("Args: %#v %d\n", i.Arguments, len(i.Arguments))
	for _, arg := range i.Arguments {
		strType, err := scopes.TypeRepr(arg.Type)
		if err != nil {
			return "", err
		}
		argNames = append(argNames, strType)
	}

	argsStr := strings.Join(argNames, ",")
	return fmt.Sprintf("declare %s @%s(%s)", strReturnType, name, argsStr), nil
}

func (s *Scopes) DefineGlobals() ([]string, error) {
	// globals are defined only on the global scopes
	topLevel := s.scopes[1]
	globals := []string{}
	for _, static := range s.statics {
		repr, err := static.ToLLVM(s)
		if err != nil {
			return nil, err
		}
		globals = append(globals, repr)
	}

	for _, e := range topLevel.externs {
		g, err := DefineExtern(s, e, topLevel.Names[e])
		if err != nil {
			return nil, err
		}
		globals = append(globals, g)
	}
	return globals, nil
}

func (s *Scopes) GetDefined(name string) (*NameInfo, error) {
	for i := len(s.scopes) - 1; i >= 0; i -= 1 {
		currScope := s.scopes[i]
		if info, ok := currScope.Names[name]; ok {
			return &info, nil
		}
	}
	return nil, fmt.Errorf("Error: %q is not defined", name)

}

// func (rs *RtScope) DefineVariable()
// func (rs *RtScope) DefineType()

type ConstantValue struct {
	Value    string
	Uid      string
	TypeRepr string
}

func (c ConstantValue) ToLLVM(scopes *Scopes) (string, error) {
	return fmt.Sprintf(
		"%s = constant %s c\"%s\"",
		c.Uid,
		c.TypeRepr,
		c.Value,
	), nil
}

type Scopes struct {
	scopes  []RtScope
	statics []ConstantValue
	counter int
}

func (s *Scopes) Push() *RtScope {
	s.scopes = append(s.scopes, RtScope{
		TypeAliases: make(map[string]string),
		Names:       make(map[string]NameInfo),
	})
	return &s.scopes[len(s.scopes)-1]
}
func (s *Scopes) Pop() {
	s.scopes = s.scopes[:len(s.scopes)-1]
}

func ScopesFrom(startScope []RtScope) Scopes {
	return Scopes{
		scopes:  startScope,
		statics: []ConstantValue{},
		counter: 0,
	}
}
func (s Scopes) ReserveLocal() (int, error) {
	val := s.counter
	s.counter += 1
	return val, nil
}

func (s *Scopes) DefineConstantString(value string) (ConstantValue, error) {
	length := len([]byte(value)) + 1 // add terminator character
	constants := len(s.statics)

	constant := ConstantValue{
		Value: value + "\\00",
		Uid: fmt.Sprintf("@.str%d", constants),
		TypeRepr: fmt.Sprintf("[%d x i8]", length),
	}
	s.statics = append(s.statics, constant)
	return constant, nil
}

// find the declaration of a type in the "scope tree"
func (s Scopes) TypeRepr(typename Type) (string, error) {
	// parse typename to string. Typename could be of type OP if it is a
	// primitive otherwise it's a container containing an OP
	var name string
	if op, ok := typename.(string); ok {
		name = op
	} else {
		return "", fmt.Errorf("Bad Parsing: unable to interpret %#v as a type", typename)
	}

	// reverse iterate through the scopes to find the name value
	for i := len(s.scopes) - 1; i >= 0; i -= 1 {
		// find type in this scope
		alias, ok := s.scopes[i].TypeAliases[name]
		if !ok {
			continue
		}
		return alias, nil
	}

	return "", fmt.Errorf("Type %s is not defined", typename)
}

// TODO: find the declaration of a name/variable on the scope tree
