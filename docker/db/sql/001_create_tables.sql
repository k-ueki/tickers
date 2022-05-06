CREATE DATABASE IF NOT EXISTS `tradings`;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_1s (
                                                     `datetime` TIMESTAMP NOT NULL,
                                                     `open` DOUBLE NOT NULL,
                                                     `close` DOUBLE NOT NULL,
                                                     `high` DOUBLE NOT NULL,
                                                     `low` DOUBLE NOT NULL,
                                                     `volume` DOUBLE DEFAULT 0,
                                                     PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_1m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_3m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_5m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_15m0s (
                                                        `datetime` TIMESTAMP NOT NULL,
                                                        `open` DOUBLE NOT NULL,
                                                        `close` DOUBLE NOT NULL,
                                                        `high` DOUBLE NOT NULL,
                                                        `low` DOUBLE NOT NULL,
                                                        `volume` DOUBLE DEFAULT 0,
                                                        PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_30m0s (
                                                        `datetime` TIMESTAMP NOT NULL,
                                                        `open` DOUBLE NOT NULL,
                                                        `close` DOUBLE NOT NULL,
                                                        `high` DOUBLE NOT NULL,
                                                        `low` DOUBLE NOT NULL,
                                                        `volume` DOUBLE DEFAULT 0,
                                                        PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_1h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_2h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_4h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_12h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_24h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tradings.FX_BTC_JPY_72h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

