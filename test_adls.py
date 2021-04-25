from pyspark.sql import SparkSession

spark = (SparkSession
        .builder
        .appName("Ingest Data")
        .master("local[3]")
        .config("spark.streaming.stopGracefullyOnShutdown", "true")
        .config("spark.sql.streaming.schemaInference", "true")
        .getOrCreate())

spark.conf.set("fs.azure.account.auth.type.<storage-account-name>.dfs.core.windows.net", "OAuth")
spark.conf.set("fs.azure.account.oauth.provider.type.<storage-account-name>.dfs.core.windows.net",  "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider")
spark.conf.set("fs.azure.account.oauth2.client.id.<storage-account-name>.dfs.core.windows.net", "<application-id>")
spark.conf.set("fs.azure.account.oauth2.client.secret.<storage-account-name>.dfs.core.windows.net","<password>")
spark.conf.set("fs.azure.account.oauth2.client.endpoint.<storage-account-name>.dfs.core.windows.net", "https://login.microsoftonline.com/<directory-id>/oauth2/token")


df = spark.read.json("abfss://<container>@<storage-account>.dfs.core.windows.net/<json-file>")
df.show()