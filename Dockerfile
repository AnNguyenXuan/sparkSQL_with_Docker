# Lựa chọn images gốc
FROM ubuntu:20.04

# Cài đặt các công cụ cần thiết
RUN apt-get update
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install python3
RUN apt-get -y install wget
RUN apt-get -y install tar
RUN apt-get -y install curl
RUN apt-get -y install python3-pip
RUN apt-get -y install net-tools
RUN apt-get -y install sqlite3
RUN apt-get -y install vim
RUN apt-get -y install unzip
RUN wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz
RUN tar xvf spark-3.5.1-bin-hadoop3.tgz
RUN mv spark-3.5.1-bin-hadoop3 /opt/spark
RUN rm spark-3.5.1-bin-hadoop3.tgz
RUN wget https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.34.0/sqlite-jdbc-3.34.0.jar
RUN mv sqlite-jdbc-3.34.0.jar /opt/spark/jars
RUN pip install pyspark

ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

WORKDIR /home/

COPY customers-1000000.zip /home/
COPY crud_create.py /home/
COPY crud_delete.py /home/
COPY crud_read.py /home/
COPY crud_update.py /home/
COPY exam1.py /home/
COPY exam2.py /home/
COPY exam3.py /home/
COPY exam4.py /home/
COPY exam5.py /home/
COPY exam6.py /home/
COPY exam7.py /home/
COPY exam8.py /home/
COPY exam9.py /home/
COPY exam10.py /home/
COPY exam11.py /home/
COPY exam12.py /home/
COPY get_session_data.py /home/
RUN unzip customers-1000000
RUN rm customers-1000000.zip

# Tạo và chạy cơ sở dữ liệu SQLite
RUN sqlite3 /home/sample.db ".mode csv" ".import /home/customers-1000000.csv my_database"



