package service

type Module struct {
}

func NewModule() (*Module, error) {
	return &Module{}, nil
}
