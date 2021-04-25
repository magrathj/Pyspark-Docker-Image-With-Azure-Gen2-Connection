from pyspark.sql import SparkSession

spark = (SparkSession
        .builder
        .appName("Ingest Data")
        .master("local[3]")
        .config("spark.streaming.stopGracefullyOnShutdown", "true")
        .config("spark.sql.streaming.schemaInference", "true")
        .getOrCreate())

df = spark.createDataFrame(
    [
        (1, "foo"),  # Add your data here
        (2, "bar"),
    ],  
    "id int, label string",  # add column names and types here
)

df.show()
