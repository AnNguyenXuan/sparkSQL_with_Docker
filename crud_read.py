from pyspark.sql import SparkSession
import sqlite3
from get_session_data import *

spark = get_session()
SQL_Queries(spark,"sample.db","example_table")

result = spark.sql("select * from example_table")

result.show()

