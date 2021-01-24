# Crypto Prices

Application for cryptocurrency price tracking.
Python based software used Yahoo Finance API.

Components used:
- PyCharm
- Yahoo Finance API (import yfinance as yf)

- SQL for Extract, Transform and load data from CSV to DB Tables

##From Yahoo Finance download Date Dimensions table 2020-1-1 ... 2020-31-12

In PyCharm in terminal window type: 
pip install yfinance
Run crypto.py
Generate CSV's for:
- ETH - Ethereum
- BCH - Bitcoin Cash
- BTC - Bitcoin
- LTC - Litecoin
- USDT - Tether

##Build figures for Crypto prices

import plotly
import plotly.graph_objs as go
import pandas as pd

Run fig.py
Open crypto.html with graphs in browser

## Create View with Microsoft SQl Server Management Studio
create VIEW based on crypto-tables, choose DATE, HIGH, LOW and VOLUME (amount) data
