package service

import (
	"github.com/k-ueki/tickers/config"
	"github.com/k-ueki/tickers/repository"
)

type Module struct {
	TickerService   TickerService
	ExchangeService ExchangeService
}

func NewModule() (*Module, error) {
	client := NewClient(Exchange(config.AppConfig.Exchange))
	repositoryModule, err := repository.NewModule()
	if err != nil {
		return nil, err
	}
	return &Module{
		TickerService:   NewTickerService(repositoryModule.CandleRepository),
		ExchangeService: NewExchangeService(client),
	}, nil
}
