#!/bin/sh

BUCKET="de.sebastianneb.schibbler.samTemplates"
REGION="eu-central-1"

echo "Erstelle S3 bucket ${BUCKET}"

aws s3 ls s3://$BUCKET > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Bucket missing. Creating Bucket..."
    aws s3 mb s3://$BUCKET

    echo "Adding tag..."
    aws s3api put-bucket-tagging \
        --bucket $BUCKET \
        --tagging 'TagSet=[{Key=CostCenter,Value=Tecco}]' \
        --region=$REGION

    echo "Give AWS time to finalize bucket setup..."
    sleep 3

    echo "Setting up website..."
    aws s3 website s3://$BUCKET \
        --index-document index.html \
        --region=$REGION

    echo "Done."
else
    echo "Bucket existiert bereits."
fi