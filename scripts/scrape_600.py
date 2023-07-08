import pandas as pd

link = (
    "https://en.wikipedia.org/wiki/List_of_S%26P_600_companies#S&P_600_Component_Stocks"
)
df = pd.read_html(link, header=0)[0]

# Write to CSV
df.to_csv("data/600.csv", index=False)
