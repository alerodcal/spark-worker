FROM ubuntu:16.04
MAINTAINER alejandro.rodriguez.calzado@alumnos.upm.es cayetano.rodriguez.medina@alumnos.upm.es

RUN apt-get update \
  && apt-get install -y openjdk-8-jdk \
  && apt-get install -y python2.7 \
  && apt-get install -y python-minimal \
  && apt-get install -y scala

# JAVA
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

WORKDIR /opt 

# Download Spark 2.1.0 pre-build for Hadoop 2.1 and later
ADD http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz ./

RUN tar -xvzf spark-2.1.0-bin-hadoop2.7.tgz \
  && rm spark-2.1.0-bin-hadoop2.7.tgz


WORKDIR /opt/spark-2.1.0-bin-hadoop2.7

CMD ./bin/spark-class org.apache.spark.deploy.worker.Worker spark://tfmsparkgeomesa.ddns.net:7077 
