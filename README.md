# burry-docker
🐳 Docker image for [burry.sh](https://github.com/mhausenblas/burry.sh)

## Usage

```
docker pull gpdocksthings/burry
```

For example, to backup ZK data to S3, use —

```
docker run gpdocksthings/burry -e <zk_host>:2181 -i zk -o backup -t s3 -c s3.amazonaws.com,ACCESS_KEY_ID=<aws_access_key>,SECRET_ACCESS_KEY=<aws_secret_key>,BUCKET=<s3_bucket>,PREFIX=<s3_directory>
```

To restore a ZK backup from S3, make sure you include the snapshot ID —

```
docker run gpdocksthings/burry -e <zk_host>:2181 -i zk -o restore -t s3 -c s3.amazonaws.com,ACCESS_KEY_ID=<aws_access_key>,SECRET_ACCESS_KEY=<aws_secret_key>,BUCKET=<s3_bucket>,PREFIX=<s3_directory> -s <snapshot_id>
```

Note that if `ACCESS_KEY_ID` and `SECRET_ACCESS_KEY` are left out, burry attempts to use the attached IAM profile.

### Debugging

You can use the `LOG_LEVEL` environment variable to change the logging level for burry.
