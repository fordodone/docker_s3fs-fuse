# docker_s3fs-fuse
----
>build a simple docker container to mount AWS S3 bucket

## usage
1) add S3 credentials and configuration to file 'credentials'

2) docker build -t fordodone/s3fs-fuse .

3) docker run --rm -it --privileged -e "BUCKET=\<bucketname\>" fordodone/s3fs-fuse:latest

4) test by listing the fuse mount

     cd /mnt/s3fs/<bucketname> && ls

5) mount additional buckets

     s3mount <bucketname2>

## TODO
* figure out how to run without --privileged flag
* may need to set memory limits on container for large fuse operations

----
## reference
* [GitHub s3fs-fuse/s3fs-fuse] (https://github.com/s3fs-fuse/s3fs-fuse)

