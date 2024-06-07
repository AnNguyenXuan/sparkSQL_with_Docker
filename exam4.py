from get_session_data import *
import time

spark = get_session()

SQL_Queries(spark,"/home/sample.db","my_database")

time_start = time.time()

result = spark.sql("select count(`Customer Id`), `Country` from my_database group by `Country`")

time_end = time.time()

result.show()


print("thoi gian chay:",time_end - time_start)
