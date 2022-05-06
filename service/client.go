package service

import (
	"github.com/k-ueki/tickers/domain"
	"github.com/k-ueki/tickers/service/bitflyer"
)

type Exchange string

const (
	Bitflyer Exchange = "bitflyer"
	//Coincheck Exchange = "coincheck"
)

func NewClient(exchange Exchange) domain.Client {
	switch exchange {
	case Bitflyer:
		return bitflyer.NewClient()
		//case Coincheck:
		//	return coincheck.NewClient()
	}
	return domain.Client{}
}
