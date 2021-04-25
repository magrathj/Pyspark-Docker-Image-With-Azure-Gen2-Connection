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


### Test Pypsark locally 
```
    pyspark 
```

![Pyspark locally](/images/Spark_locally.PNG)


### Run Docker image in Visual Studio Code

Install docker 
![Install docker](/images/install_docker.PNG) 

Install extension to run container in another window
![Install extension](/images/extension.PNG) 

Type pyspark into the terminal and you should be promoted with the Spark UI at localhost:4040
![Install extension](/images/spark_ui.PNG) 



### Run python script with spark dataframe


![read from the lake](/images/spark_dataframe.PNG)

### Connect to Azure Data Lake Storage (ADLS) Gen2


![read from the lake](/images/json_from_lake.PNG)
