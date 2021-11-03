FROM conda/miniconda3

LABEL maintainer="Jared Magrath <magrathj@tcd.ie>"

# Set variables
ARG SPARK_VERSION=3.1.2
ARG HADOOP_VERSION=3.2
ARG HADOOP_ZIP_VERSION=3.2.2

# Set work directory
WORKDIR /

# Install additional libraries
RUN apt-get update \
    && apt-get install -y \
        wget \
        apt-transport-https \
        openjdk-8-jdk 

# Install git
RUN apt-get -y install git

# Install make
RUN apt-get update && apt-get install make 

# Install Spark runtime
RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -zxf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Set Spark Env variable
ENV SPARK_HOME /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}

# Install hadoop zip to get additional jar files
RUN wget -c https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_ZIP_VERSION}/hadoop-${HADOOP_ZIP_VERSION}.tar.gz \
    && tar -zxf hadoop-${HADOOP_ZIP_VERSION}.tar.gz \
    && rm hadoop-${HADOOP_ZIP_VERSION}.tar.gz \
    && cp /hadoop-${HADOOP_ZIP_VERSION}/share/hadoop/tools/lib/* /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/jars

CMD ["python"]
