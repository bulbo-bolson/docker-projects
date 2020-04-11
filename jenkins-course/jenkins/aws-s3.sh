#!/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST="${1}"
DB_PASSWORD="${2}"
DB_NAME="${3}"
AWS_SECRET="${4}"
BUCKET_NAME="${5}"

export LD_LIBRARY_PATH=/opt/rh/rh-python35/root/usr/lib64:/opt/rh/rh-nodejs10/root/usr/lib64:/opt/rh/httpd24/root/usr/lib64
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db-${DATE}.sql && \
export AWS_ACCESS_KEY_ID=AKIAYHTMKUREVICISDPL && \
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET} && \
/opt/app-root/bin/aws s3 cp /tmp/db-${DATE}.sql s3://${BUCKET_NAME}

