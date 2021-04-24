# Docker Pyspark With Azure Gen2 
Building a docker image with Pyspark and with an Azure Gen2 storage connector, so as to enable local testing your data lake with spark


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