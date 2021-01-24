USE AdventureWorks2019
GO

-- Bitcoin
CREATE TABLE BTC_USD (
  crypDate DATE,
  crypOpen float(24),
  crypHigh float(24),
  crypLow float(24),
  crypClose float(24),
  crypAdjClose float(24),
  crypVolume float(24),
  PRIMARY KEY (crypDate)
)

-- Create new tables based on Bitcoin table structure
SELECT * INTO BCH_USD  FROM BTC_USD WHERE 1 = 0; -- BitcoinCash
SELECT * INTO ETH_USD  FROM BTC_USD WHERE 1 = 0; -- Ethereum
SELECT * INTO LTC_USD  FROM BTC_USD WHERE 1 = 0; -- Litecoin
SELECT * INTO USDT_USD FROM BTC_USD WHERE 1 = 0; -- Tether

-- drop table BCH_USD
-- select * from BCH_USD

-- Extract data from CSVs to crypto-tables
BULK INSERT BTC_USD
FROM 'C:\Users\Dmytro\PycharmProjects\dateDimensions\BTC-USD.csv'
WITH (FORMAT = 'CSV', firstrow = 2, fieldterminator = ',', rowterminator = '\n');

BULK INSERT BCH_USD
FROM 'C:\Users\Dmytro\PycharmProjects\dateDimensions\BCH-USD.csv'
WITH (FORMAT = 'CSV', firstrow = 2, fieldterminator = ',', rowterminator = '\n');

BULK INSERT ETH_USD
FROM 'C:\Users\Dmytro\PycharmProjects\dateDimensions\BCH-USD.csv'
WITH (FORMAT = 'CSV', firstrow = 2, fieldterminator = ',', rowterminator = '\n');

BULK INSERT LTC_USD
FROM 'C:\Users\Dmytro\PycharmProjects\dateDimensions\BCH-USD.csv'
WITH (FORMAT = 'CSV', firstrow = 2, fieldterminator = ',', rowterminator = '\n');

BULK INSERT USDT_USD
FROM 'C:\Users\Dmytro\PycharmProjects\dateDimensions\BCH-USD.csv'
WITH (FORMAT = 'CSV', firstrow = 2, fieldterminator = ',', rowterminator = '\n');

GO

-- create VIEW based on crypto-tables, choose DATE, HIGH, LOW and VOLUME (amount) data
CREATE VIEW crypto_view
AS
SELECT BTC_USD.crypDate  AS YearDate,
       BTC_USD.crypHigh  AS BTC_hi,  BTC_USD.crypLow  AS BTC_lo,  BTC_USD.crypVolume  AS BTC_vol,
       BCH_USD.crypHigh  AS BCH_hi,  BCH_USD.crypLow  AS BCH_lo,  BCH_USD.crypVolume  AS BCH_vol,
	   ETH_USD.crypHigh  AS ETH_hi,  ETH_USD.crypLow  AS ETH_lo,  ETH_USD.crypVolume  AS ETH_vol,
	   LTC_USD.crypHigh  AS LTC_hi,  LTC_USD.crypLow  AS LTC_lo,  LTC_USD.crypVolume  AS LTC_vol,
	   USDT_USD.crypHigh AS USDT_hi, USDT_USD.crypLow AS USDT_lo, USDT_USD.crypVolume AS USDT_vol
FROM BCH_USD INNER JOIN
     BTC_USD  ON dbo.BCH_USD.crypDate = BTC_USD.crypDate INNER JOIN
     ETH_USD  ON dbo.BTC_USD.crypDate = ETH_USD.crypDate INNER JOIN
     LTC_USD  ON dbo.BTC_USD.crypDate = LTC_USD.crypDate INNER JOIN
     USDT_USD ON dbo.BTC_USD.crypDate = USDT_USD.crypDate

-- drop VIEW crypto_view
-- select  * from crypto_view


-- Plot some graphs ))

