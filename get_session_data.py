from pyspark.sql import SparkSession

def get_session():
    spark = SparkSession.builder.appName("PySpark basic").config("spark.some.config.option", "some-value").getOrCreate()
    return spark

def SQL_Queries(spark,database_path,table_name):
    df = spark.read.jdbc(url = f"jdbc:sqlite:{database_path}", table = table_name)
    df.createOrReplaceTempView(table_name)
    pass
