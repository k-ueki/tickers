package controller

import (
	"github.com/k-ueki/tickers/service"
)

type Module struct {
	TickerController *TickerController
}

func NewModule() (*Module, error) {
	serviceModule, err := service.NewModule()
	if err != nil {
		return nil, err
	}
	return &Module{
		TickerController: NewTickerController(
			serviceModule.TickerService,
			serviceModule.ExchangeService,
		),
	}, nil
}
