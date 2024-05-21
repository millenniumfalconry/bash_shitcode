#!/bin/bash

#Copy bucket names into excel and name the file results.csv
#Add results.csv file in the same directory as the script

for i in `cat results.csv |cut -d\, -f3 | cut -d\: -f6 | cut -d\" -f1`; do 
echo "Bucket: $i"
aws s3api get-bucket-policy --bucket "$i" --no-sign-request
aws s3api get-bucket-acl --bucket "$i" --no-sign-request
aws s3api list-objects --bucket "$i" --no-sign-request;
echo ""
done


#Manually test with the commands below
#aws s3api get-bucket-policy --bucket <name> --no-sign-request
#aws s3api get-bucket-acl --bucket <name> --no-sign-request
#aws s3api list-objects --bucket <name> --no-sign-request