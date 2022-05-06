package main

import (
	_ "github.com/k-ueki/tickers/config"
	"github.com/k-ueki/tickers/controller"
	"log"
)

func main() {
	ctl, err := controller.NewModule()
	if err != nil {
		log.Fatal(err)
	}
	if err := ctl.TickerController.RealTimeIngesting(); err != nil {
		log.Fatal(err)
	}
}
