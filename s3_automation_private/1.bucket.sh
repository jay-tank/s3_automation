#!/bin/bash

echo -e "\n-------Showing Data of input.txt-------\n"
sleep 5s
cat input.txt

echo -e ""

# Read the folder name from input.txt
folder_name=$(grep -w "FolderName" input.txt | cut -d "=" -f 2)

# Check if the folder name is present
if [ -z "$folder_name" ]; then
    echo "Folder name not found in input.txt."
    exit 1
fi

# Remove the prefix "FolderName:" from the folder name
folder_name=${folder_name#FolderName:}

# Check if the folder already exists in the bucket
bucket_name="automationprivate"
existing_folder=$(aws s3 ls "s3://$bucket_name/$folder_name/" | wc -l)

echo -e ""

# Create the folder if it doesn't already exist
if [ "$existing_folder" -eq 0 ]; then
    aws s3api put-object --bucket "$bucket_name" --key "$folder_name/"
    echo "Folder '$folder_name' created successfully."
else
    echo "Folder '$folder_name' already exists in the bucket '$bucket_name'."
fi













