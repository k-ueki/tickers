package service

import "time"

var durations = []time.Duration{
	time.Second,
	time.Minute,
	time.Minute * 3,
	time.Minute * 5,
	time.Minute * 15,
	time.Minute * 30,
	time.Hour,
	time.Hour * 2,
	time.Hour * 4,
	time.Hour * 12,
	time.Hour * 24,
	time.Hour * 24 * 3,
}
