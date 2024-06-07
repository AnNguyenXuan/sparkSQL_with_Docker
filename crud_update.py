from pyspark.sql import SparkSession
import sqlite3
from get_session_data import *

spark = get_session()
SQL_Queries(spark,"sample.db","example_table")
result = spark.sql("select * from example_table")
result.show()

con = sqlite3.connect("sample.db")
cur = con.cursor()

cur.execute("""UPDATE example_table SET `MA DINH DANH` = 'abc123a' WHERE ID = 1""")
con.commit()
con.close()
SQL_Queries(spark,"sample.db","example_table")
result = spark.sql("select * from example_table")
result.show()

