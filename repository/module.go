package repository

import db2 "github.com/k-ueki/tickers/repository/db"

type Module struct {
	CandleRepository CandleRepository
}

func NewModule() (*Module, error) {
	db, err := db2.NewDB()
	if err != nil {
		return nil, err
	}
	return &Module{
		CandleRepository: NewCandleRepository(db),
	}, nil
}
