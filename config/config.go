package config

import (
	"fmt"
	"os"
	"strings"

	"github.com/joho/godotenv"
)

type DBConfig struct {
	Host  string
	Table string
	User  string
	Pass  string
	Port  string
}

type AWSConfig struct {
	Region string
	SqsUrl string
}

type Config struct {
	Exchange    string
	ProductCode string
	ApiKey      string
	SecretKey   string
	DB          DBConfig
	AWS         AWSConfig
}

var AppConfig Config

func init() {
	var envFile string
	if os.Getenv("SYSTEM_ENV") != "production" {
		envFile = ".env/dev.env"
		if err := godotenv.Load(envFile); err != nil {
			panic(err)
		}
	}
	AppConfig = NewConfig()
}

func NewConfig() Config {
	exchange := os.Getenv("EXCHANGE")
	return Config{
		Exchange:    strings.ToLower(exchange),
		ProductCode: os.Getenv("PRODUCT_CODE"),
		ApiKey:      os.Getenv(fmt.Sprintf("%s_API_KEY", exchange)),
		SecretKey:   os.Getenv(fmt.Sprintf("%s_SECRET_KEY", exchange)),
		DB: DBConfig{
			Host:  os.Getenv("DB_HOST"),
			Table: os.Getenv("DB_TABLE"),
			User:  os.Getenv("DB_USER"),
			Pass:  os.Getenv("DB_PASS"),
			Port:  os.Getenv("DB_PORT"),
		},
		AWS: AWSConfig{
			Region: os.Getenv("AWS_REGION"),
			SqsUrl: os.Getenv("AWS_SQS_URL"),
		},
	}
}
