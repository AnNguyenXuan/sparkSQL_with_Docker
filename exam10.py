from get_session_data import *
import time

spark = get_session()

SQL_Queries(spark,"/home/sample.db","my_database")

time_start = time.time()

result = spark.sql(
        """select sum(Index) as result,`Country` 
        from my_database 
        where `First Name` like '%A' and `Last Name` like 'B%' and Index % 2 = 0 
        group by `Country`
        having count(`Customer Id`) > 50
        order by result desc
        """)

time_end = time.time()

result.show()

print("thoi gian chay:",time_end - time_start)
