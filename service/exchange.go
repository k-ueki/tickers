package service

import (
	"github.com/k-ueki/tickers/config"
	"github.com/k-ueki/tickers/domain"
	"github.com/k-ueki/tickers/domain/entity"
	"github.com/k-ueki/tickers/service/bitflyer"
)

type ExchangeService interface {
	GetRealTimeExecutions(chan entity.Executions)
}

func NewExchangeService(client domain.Client) ExchangeService {
	switch Exchange(config.AppConfig.Exchange) {
	case Bitflyer:
		return bitflyer.NewBitflyerExchangeService(client)
		//case Coincheck:
		//	return coincheck.NewTradeService(client, tradeRepo)
	}
	return nil
}
