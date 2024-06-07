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
RUN wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz
RUN tar xvf spark-3.5.1-bin-hadoop3.tgz
RUN mv spark-3.5.1-bin-hadoop3 /opt/spark
RUN rm spark-3.5.1-bin-hadoop3.tgz
RUN wget https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.34.0/sqlite-jdbc-3.34.0.jar
RUN mv sqlite-jdbc-3.34.0.jar /opt/spark/jars
RUN pip install pyspark

ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#ENV PATH=$JAVA_HOME/bin:$PATH

COPY customers-1000000.csv /home/data.csv




