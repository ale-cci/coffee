package compiler

import "fmt"

func NewInt(val string) *Number {
	return &Number{
		Type: "int",
		Value: val,
	}
}

func (n *Number) RealType(scopes Scopes) (string, error) {
	return n.Type.(string), nil
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

	return fmt.Sprintf("%s = add %s 0, %s", n.uid, typename, n.Value), nil
}

func (n *Number) ToImmediateLLVM(scopes *Scopes) (*LLVMImmediateValue, error) {
	return &LLVMImmediateValue{
		Type: n.Type,
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
