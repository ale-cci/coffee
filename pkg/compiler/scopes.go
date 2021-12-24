package compiler

import "fmt"

// runtime name
type RtName struct {
	Type string // could be function or variable or could be cons
}

type SSA interface {
	ToLLVM(Scopes) (string, error)
}
type SSAValue interface {
	SSA
	Type(Scopes) string
}

// should be mutable
type RtScope struct {
	// available types
	TypeAliases map[string]string

	// defined variables, uniquely identified by its name
	Names map[string]string

	// defined functions
}
// func (rs *RtScope) DefineVariable()
// func (rs *RtScope) DefineType()


type Scopes struct {
	scopes []RtScope
}
func (s* Scopes) Push() {
	s.scopes = append(s.scopes, RtScope{
		TypeAliases: make(map[string]string),
		Names: make(map[string]string),
	})
}
func (s* Scopes) Pop() {
	s.scopes = s.scopes[:len(s.scopes) -1]
}

func ScopesFrom(startScope []RtScope) Scopes {
	return Scopes{
		scopes: startScope,
	}
}

// find the declaration of a type in the "scope tree"
func (s Scopes) TypeRepr(typename Type) (string, error) {
	// parse typename to string. Typename could be of type OP if it is a
	// primitive otherwise it's a container containing an OP
	var name string
	if op, ok := typename.(string); ok {
		name = op
	} else {
		return "", fmt.Errorf("Bad Parsing: unable to interpret %q as a type", typename)
	}

	// reverse iterate through the scopes to find the name value
	for i := len(s.scopes) -1; i >= 0; i -= 1 {
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

