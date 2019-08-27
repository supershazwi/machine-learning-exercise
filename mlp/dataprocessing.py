import requests
import io
import pandas as pd

print("Reading csv from url https://aisgaiap.blob.core.windows.net/aiap4-assessment/real_estate.csv...")

content = requests.get('https://aisgaiap.blob.core.windows.net/aiap4-assessment/real_estate.csv').content
data = pd.read_csv(io.StringIO(content.decode('utf-8')), index_col=0)

print("Dropping appropriate columns...")
y = data['Y house price of unit area']
X = data.drop(['X1 transaction date', 'X2 house age', 'Y house price of unit area'], axis=1)

print("Handling missing data...")
print(" ")
mrt_distance_mean = X['X3 distance to the nearest MRT station'].mean()
X['X3 distance to the nearest MRT station'] = X['X3 distance to the nearest MRT station'].fillna(mrt_distance_mean)

no_of_convenience_stores_median = X['X4 number of convenience stores'].median()
X['X4 number of convenience stores'] = X['X4 number of convenience stores'].fillna(no_of_convenience_stores_median)

latitude_mean = X['X5 latitude'].mean()
X['X5 latitude'] = X['X5 latitude'].fillna(latitude_mean)

longitude_mean = X['X6 longitude'].mean()
X['X6 longitude'] = X['X6 longitude'].fillna(longitude_mean)