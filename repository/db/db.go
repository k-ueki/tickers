package db

import (
	"fmt"
	"github.com/k-ueki/tickers/config"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"log"
	"os"
)

func NewDB() (*gorm.DB, error) {
	dsn := makeDsn()
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.New(
			log.New(os.Stdout, "\r\n", log.LstdFlags),
			logger.Config{
				SlowThreshold:             0,
				Colorful:                  false,
				IgnoreRecordNotFoundError: false,
				LogLevel:                  0,
			},
		),
	})
	if err != nil {
		return nil, err
	}
	return db, nil
}

func makeDsn() string {
	c := config.AppConfig.DB
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=true", c.User, c.Pass, c.Host, c.Port, c.Table)
}
