package bitflyer

import (
	"encoding/json"
	"github.com/k-ueki/tickers/domain/entity"
	bitflyer "github.com/k-ueki/tickers/service/bitflyer/entity"
	"log"
)

func (s *BitflyerService) GetRealTimeExecutions(ch chan entity.Executions) {
	channel := makeRealTimeExecutionChannel()
	if err := s.Client.WebsocketClient.WriteJSON(makeSubscribeJson(channel)); err != nil {
		log.Fatalf("Failed subscribe executions error: %v", err)
	}
	for {
		msg := new(JsonRPC2)
		if err := s.Client.WebsocketClient.ReadJSON(msg); err != nil {
			log.Fatalf("Failed read json error: %v\n", err)
		}
		for key, val := range msg.Params.(map[string]interface{}) {
			if key == "message" {
				execs, err := getExecutions(val)
				if err != nil {
					log.Fatal(err)
				}
				ch <- execs.ToEntity()
			}
		}
	}
}

func getExecutions(i interface{}) (bitflyer.BfExecutions, error) {
	resp := bitflyer.BfExecutions{}
	bytes, err := json.Marshal(i)
	if err != nil {
		return nil, err
	}
	json.Unmarshal(bytes, &resp)
	return resp, nil
}
