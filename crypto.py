import yfinance as yf

# day before
startTime = "2020-1-2"
endTime = "2021-1-1"
# ETH - Ethereum
# BCH - Bitcoin Cash
# BTC - Bitcoin
# LTC - Litecoin
# USDT - Tether
crypto = ["ETH-USD", "BCH-USD", "BTC-USD", "LTC-USD", "USDT-USD"]

for i in crypto:
    stock = yf.download(i, startTime, endTime)
    stock.to_csv(i+".csv")
    
    
    
    
