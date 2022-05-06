package entity

import (
	"github.com/k-ueki/tickers/domain/entity"
	"time"
)

type (
	BfExecution struct {
		ID                         int64     `json:"id"`
		Side                       string    `json:"side"`
		Price                      float64   `json:"price"`
		Size                       float64   `json:"size"`
		ExecDate                   time.Time `json:"exec_date"`
		BuyChildOrderAcceptanceID  string    `json:"buy_child_order_acceptance_id"`
		SellChildOrderAcceptanceID string    `json:"sell_child_order_acceptance_id"`
	}

	BfExecutions []BfExecution
)

func (es *BfExecutions) ToEntity() entity.Executions {
	resp := entity.Executions{}
	for _, e := range *es {
		resp = append(resp, e.ToEntity())
	}
	return resp
}

func (e *BfExecution) ToEntity() entity.Execution {
	return entity.Execution{
		ID:                         e.ID,
		Side:                       e.Side,
		Price:                      e.Price,
		Size:                       e.Size,
		ExecDate:                   e.ExecDate,
		BuyChildOrderAcceptanceID:  e.BuyChildOrderAcceptanceID,
		SellChildOrderAcceptanceID: e.SellChildOrderAcceptanceID,
	}
}
