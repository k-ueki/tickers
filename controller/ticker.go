package controller

import (
	"github.com/k-ueki/tickers/domain/entity"
	"github.com/k-ueki/tickers/service"
	"log"
)

type TickerController struct {
	TickerService   service.TickerService
	ExchangeService service.ExchangeService
}

func NewTickerController(tickerService service.TickerService, exchangeService service.ExchangeService) *TickerController {
	return &TickerController{
		TickerService:   tickerService,
		ExchangeService: exchangeService,
	}
}

func (t *TickerController) RealTimeIngesting() error {
	ch := make(chan entity.Executions)
	go t.ExchangeService.GetRealTimeExecutions(ch)
	for excs := range ch {
		log.Println(excs)
		go t.TickerService.Store(excs)
	}
	return nil
}
