# DC/OS Apache Mysql Service

## Building the package

In order to build a stub-universe hosted on an S3 bucket run:
```bash
./frameworks/mysql/build.sh local
```

```bash
export S3_BUCKET=mbi-dcos
./frameworks/mysql/build.sh aws
```

```bash
export S3_BUCKET=mbi-dcos
./frameworks/mysql/build.sh .dcos
```
