package bitflyer

import (
	"github.com/k-ueki/tickers/domain"
)

const bfWebsocketUrl = "wss://ws.lightstream.bitflyer.com/json-rpc"

type BitflyerService struct {
	Client domain.Client
}

func NewBitflyerExchangeService(client domain.Client) *BitflyerService {
	return &BitflyerService{Client: client}
}
