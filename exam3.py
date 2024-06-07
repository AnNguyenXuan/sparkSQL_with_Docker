from get_session_data import *
import time

spark = get_session()

SQL_Queries(spark,"/home/sample.db","my_database")

time_start = time.time()

result = spark.sql("select Index, `Customer Id`, `First Name`, `Last Name` from my_database")

time_end = time.time()

result.show()

print("thoi gian chay:",time_end - time_start)
