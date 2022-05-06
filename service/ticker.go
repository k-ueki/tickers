package service

import (
	"fmt"
	"github.com/k-ueki/tickers/config"
	"github.com/k-ueki/tickers/domain/entity"
	"github.com/k-ueki/tickers/repository"
	"gorm.io/gorm"
	"time"
)

type TickerService interface {
	Store(entity.Executions) error
}

type TickerServiceImpl struct {
	CandleRepository repository.CandleRepository
}

func NewTickerService(candleRepository repository.CandleRepository) TickerService {
	return &TickerServiceImpl{
		CandleRepository: candleRepository,
	}
}

func (t *TickerServiceImpl) Store(executions entity.Executions) error {
	for _, duration := range durations {
		tableName := makeTableName(duration)

		for _, exec := range executions {
			datetime := exec.ExecDate.Truncate(duration)
			candle := &entity.Candle{Datetime: datetime}

			candle, err := t.CandleRepository.FindByTime(tableName, datetime)
			if err != nil && err != gorm.ErrRecordNotFound {
				return err
			} else if err == gorm.ErrRecordNotFound {
				candle = makeCandle(datetime, exec.Price)
			}

			updateCandlePrices(candle, exec.Price)
			candle.Volume += exec.Size
			if err := t.CandleRepository.InsertOrUpdate(tableName, candle); err != nil {
				return err
			}
		}

	}
	return nil
}

func makeTableName(duration time.Duration) string {
	return fmt.Sprintf("%s_%s", config.AppConfig.ProductCode, duration.String())
}

func makeCandle(datetime time.Time, price float64) *entity.Candle {
	return &entity.Candle{
		Datetime: datetime,
		Open:     price,
		Close:    price,
		High:     price,
		Low:      price,
		Volume:   0.0,
	}
}

func updateCandlePrices(candle *entity.Candle, price float64) {
	candle.High = max(candle.High, price)
	candle.Low = min(candle.Low, price)
	candle.Close = price
}
