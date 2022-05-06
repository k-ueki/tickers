package bitflyer

import (
	"fmt"
	"github.com/k-ueki/tickers/config"
)

func makeRealTimeExecutionChannel() string {
	return fmt.Sprintf("lightning_executions_%s", config.AppConfig.ProductCode)
}
