package bitflyer

import (
	"github.com/gorilla/websocket"
	"github.com/k-ueki/tickers/config"
	"github.com/k-ueki/tickers/domain"
	"log"
)

type (
	JsonRPC2 struct {
		Version string      `json:"jsonrpc"`
		Method  string      `json:"method"`
		Params  interface{} `json:"params"`
		Result  interface{} `json:"result"`
		Error   interface{} `json:"error"`
		ID      int64       `json:"id,omitempty"`
	}

	subScribeParam struct {
		Channel string `json:"channel"`
	}
)

func newWebsocketClient() *websocket.Conn {
	ws, _, err := websocket.DefaultDialer.Dial(bfWebsocketUrl, nil)
	if err != nil {
		log.Fatal(err)
		return nil
	}
	return ws
}

func NewClient() domain.Client {
	return domain.Client{
		Key:             config.AppConfig.ApiKey,
		Secret:          config.AppConfig.SecretKey,
		WebsocketClient: newWebsocketClient(),
	}
}

func makeSubscribeJson(channel string) *JsonRPC2 {
	return &JsonRPC2{
		Version: "2.0",
		Method:  "subscribe",
		Params: &subScribeParam{
			Channel: channel,
		},
	}
}
