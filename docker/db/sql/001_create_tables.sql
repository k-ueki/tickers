CREATE DATABASE IF NOT EXISTS `chocopi`;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_1s (
                                                     `datetime` TIMESTAMP NOT NULL,
                                                     `open` DOUBLE NOT NULL,
                                                     `close` DOUBLE NOT NULL,
                                                     `high` DOUBLE NOT NULL,
                                                     `low` DOUBLE NOT NULL,
                                                     `volume` DOUBLE DEFAULT 0,
                                                     PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_1m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_3m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_5m0s (
                                                       `datetime` TIMESTAMP NOT NULL,
                                                       `open` DOUBLE NOT NULL,
                                                       `close` DOUBLE NOT NULL,
                                                       `high` DOUBLE NOT NULL,
                                                       `low` DOUBLE NOT NULL,
                                                       `volume` DOUBLE DEFAULT 0,
                                                       PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_15m0s (
                                                        `datetime` TIMESTAMP NOT NULL,
                                                        `open` DOUBLE NOT NULL,
                                                        `close` DOUBLE NOT NULL,
                                                        `high` DOUBLE NOT NULL,
                                                        `low` DOUBLE NOT NULL,
                                                        `volume` DOUBLE DEFAULT 0,
                                                        PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_30m0s (
                                                        `datetime` TIMESTAMP NOT NULL,
                                                        `open` DOUBLE NOT NULL,
                                                        `close` DOUBLE NOT NULL,
                                                        `high` DOUBLE NOT NULL,
                                                        `low` DOUBLE NOT NULL,
                                                        `volume` DOUBLE DEFAULT 0,
                                                        PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_1h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_2h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_4h0m0s (
                                                         `datetime` TIMESTAMP NOT NULL,
                                                         `open` DOUBLE NOT NULL,
                                                         `close` DOUBLE NOT NULL,
                                                         `high` DOUBLE NOT NULL,
                                                         `low` DOUBLE NOT NULL,
                                                         `volume` DOUBLE DEFAULT 0,
                                                         PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_12h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_24h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.FX_BTC_JPY_72h0m0s (
                                                          `datetime` TIMESTAMP NOT NULL,
                                                          `open` DOUBLE NOT NULL,
                                                          `close` DOUBLE NOT NULL,
                                                          `high` DOUBLE NOT NULL,
                                                          `low` DOUBLE NOT NULL,
                                                          `volume` DOUBLE DEFAULT 0,
                                                          PRIMARY KEY(`datetime`),
    INDEX datetime_index(`datetime`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.positions (
    `id` varchar(64) NOT NULL,
    `is_active` tinyint(1) NOT NULL DEFAULT 1,
    `ordered_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `executed_at` timestamp NULL DEFAULT NULL,
    `canceled_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `id_index` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.orders (
    `id` varchar(255) NOT NULL,
    `side` tinyint(1) NOT NULL,
    `price` double DEFAULT NULL,
    `size` double DEFAULT NULL,
    `order_type` tinyint(1) NOT NULL,
    PRIMARY KEY(`id`),
    KEY `id_index` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.executions (
    `id` varchar(255) NOT NULL,
    `side` tinyint(1) NOT NULL,
    `price` double DEFAULT NULL,
    `size` double DEFAULT NULL,
    PRIMARY KEY(`id`),
    KEY `id_index` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chocopi.position_size_balance (
    `id` varchar(255) NOT NULL,
    `size` double DEFAULT NULL,
    PRIMARY KEY(`id`),
    KEY `id_index` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
