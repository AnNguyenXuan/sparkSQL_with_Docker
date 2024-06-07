from pyspark.sql import SparkSession
import sqlite3
from get_session_data import *

spark = get_session()

#create dataframe
data = [(1,"Nguyen Xuan An","21002183"),(2,"Nguyen Bao Ngoc","@123dc5"),(3,"Le Viet Hung","$1578@2")]
columes = ["ID","Name","Ma Dinh Danh"]
df = spark.createDataFrame(data,columes)
df.show()

con = sqlite3.connect("sample.db")

cur = con.cursor()

create_table = """
CREATE TABLE IF NOT EXISTS example_table(
    ID INTEGER,
    NAME VARCHAR(10) NOT NULL,
    `MA DINH DANH` VARCHAR(10) NOT NULL,
    PRIMARY KEY(ID)
);
"""

cur.execute(create_table)

for Row in df.collect():
    insert_data = f"INSERT INTO example_table (ID,NAME,`MA DINH DANH`) VALUES ({Row['ID']},'{Row['Name']}','{Row['Ma Dinh Danh']}')"
    cur.execute(insert_data)

con.commit()
con.close()
