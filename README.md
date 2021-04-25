# Docker Pyspark With Azure Gen2 
Building a docker image with Pyspark and a Azure Gen2 storage connection, so as to enable testing of your data lake with pyspark locally.


### Build Docker image
```
    docker build -t sparklocal .
```


### Run docker image
```
    docker run -it sparklocal:latest /bin/bash
```



### Run docker image in Visual Studio Code

#### Install docker 
![Install docker](/images/install_docker.PNG) 

#### Install extension to run container in another window
![Install extension](/images/extension.PNG) 


#### Test pyspark locally 

Type pyspark into the terminal and you should be promoted with the Spark UI at localhost:4040

```
    pyspark 
```

![Pyspark locally](/images/Spark_locally.PNG)

![Install extension](/images/spark_ui.PNG) 


### Test docker image

#### Run python script to test pyspark connection

```
    python test_spark.py
```
![read from the lake](/images/spark_dataframe.PNG)

#### Run python script to test the connect to Azure Data Lake Storage (ADLS) Gen2


```
    python test_adls.py
```

![read from the lake](/images/json_from_lake.PNG)


### References 

[Databricks docker deployments](https://www.datamechanics.co/blog-post/spark-and-docker-your-spark-development-cycle-just-got-ten-times-faster)

[Apache Spark docker deployments](https://towardsdatascience.com/diy-apache-spark-docker-bb4f11c10d24)

[Delta connecting to ADLS Gen2](https://docs.delta.io/latest/delta-storage.html#azure-data-lake-storage-gen2)

[Connecting to ADLS Gen1 locally](https://medium.com/azure-data-lake/connecting-your-own-hadoop-or-spark-to-azure-data-lake-store-93d426d6a5f4)
