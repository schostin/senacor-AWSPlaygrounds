#!/bin/sh

BUCKET="de.sebastianneb.schibbler.s3bucket"
REGION="eu-central-1"

echo "Erstelle S3 bucket"

aws s3 ls s3://$BUCKET > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Bucket noch nicht vorhanden. Erstelle bucket."
    aws s3 mb s3://$BUCKET

    echo "Bucket erfolgreich erstellt."
else
    echo "Bucket existiert bereits."
fi