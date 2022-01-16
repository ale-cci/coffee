package compiler

import "fmt"

func NewInt(val string) *Number {
	return &Number{
		Type: "int",
		Value: val,
	}
}
func (n *Number) ToLLVM(scopes *Scopes) (string, error) {
	typename, err := scopes.TypeRepr(n.Type)
	if err != nil {
		return "", err
	}
	id, err := scopes.ReserveLocal()
	if err != nil {
		return "", err
	}
	n.uid = fmt.Sprintf("%%.tmp%d", id)

	return fmt.Sprintf("%s = add %s 0, 5", n.uid, typename), nil
}

type LLVMImmediateValue struct {
	Type string
	Value string
}

type LLVMImmediate interface {
	ToImmediateLLVM(scopes *Scopes) (*LLVMImmediateValue, error)
}

func (n *Number) ToImmediateLLVM(scopes *Scopes) (*LLVMImmediateValue, error) {
	typename, err := scopes.TypeRepr(n.Type)
	if err != nil {
		return nil, err
	}
	return &LLVMImmediateValue{
		Type: typename,
		Value: n.Value,
	}, nil
}

func (n *Number) TypeRepr(scopes Scopes) (string, error) {
	name, err := scopes.TypeRepr(n.Type)
	if err != nil {
		return "", err
	}

	return name, nil
}


func (n *Number) Id() (string, error) {
	if n.uid == "" {
		return "", fmt.Errorf("Id retrieved before ToLLVM call")
	}
	return n.uid, nil
}
