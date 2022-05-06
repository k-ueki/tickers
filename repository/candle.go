package repository

import (
	"github.com/k-ueki/tickers/domain/entity"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"time"
)

type CandleRepository interface {
	FindByTime(table string, datetime time.Time) (*entity.Candle, error)
	InsertOrUpdate(table string, ticker *entity.Candle) error
}

type candleRepository struct {
	DB *gorm.DB
}

func NewCandleRepository(db *gorm.DB) CandleRepository {
	return &candleRepository{db}
}

func (r *candleRepository) FindByTime(table string, datetime time.Time) (*entity.Candle, error) {
	var candle entity.Candle
	if err := r.DB.Table(table).Where("datetime = ?", datetime).First(&candle).Error; err != nil {
		return nil, err
	}
	return &candle, nil
}

func (r *candleRepository) InsertOrUpdate(table string, candle *entity.Candle) error {
	if err := r.DB.Table(table).Clauses(clause.OnConflict{
		UpdateAll: true,
	}).Create(candle).Error; err != nil {
		return err
	}
	return nil
}
