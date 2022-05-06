package entity

import "time"

type Candle struct {
	Datetime time.Time `gorm:"primaryKey,datetime"`
	Open     float64   `gorm:"open"`
	Close    float64   `gorm:"close"`
	High     float64   `gorm:"high"`
	Low      float64   `gorm:"low"`
	Volume   float64   `gorm:"volume"`
}
