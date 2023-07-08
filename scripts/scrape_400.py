import pandas as pd

link = (
    "https://en.wikipedia.org/wiki/List_of_S%26P_400_companies#S&P_400_MidCap_Index_Component_Stocks"
)
df = pd.read_html(link, header=0)[0]

# Write to CSV
df.to_csv("data/constituents_400.csv", index=False)
