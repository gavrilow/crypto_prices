import plotly
import plotly.graph_objs as go
import pandas as pd

# Create traces
df0 = pd.read_csv("LTC-USD.csv")
trace0 = go.Scatter(
    x=df0.Date,
    y=df0['Close'],
    mode = 'markers',
    name = 'LTC'
)

df1 = pd.read_csv("ETH-USD.csv")
trace1 = go.Scatter(
    x = df1.Date,
    y=df1['Close'],
    mode = 'lines+markers',
    name = 'ETH'
)

df2 = pd.read_csv("BCH-USD.csv")
trace2 = go.Scatter(
    x = df2.Date,
    y=df2['Close'],
    mode = 'lines',
    name = 'BCH'
)


data = [trace0, trace1, trace2]
plotly.offline.plot(data, filename='crypto.html')
