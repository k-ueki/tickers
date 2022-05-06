package controller

import "github.com/k-ueki/chocopi/service"

type Module struct {
}

func NewModule() (*Module, error) {
	_, err := service.NewModule()
	if err != nil {
		return nil, err
	}
	return &Module{}, nil
}
