#!/bin/bash

# Stage k1: Data fetch from input.txt
while IFS=: read -r key value; do
  case $key in
    "UserName") UserName=$value ;;
    "GroupName") GroupName=$value ;;
    "FolderName") FolderName=$value ;;
    *) ;;
  esac
done < input.txt

# Stage k2: Check if the UserName, AccessKey, and SecretKey already exist in output.txt
echo -e "\n-------Creating  AccessKey and SecretKey------\n"
sleep 5s

userNamePresent=$(grep -c "^UserName:" output.txt)
accessKeyPresent=$(grep -c "^AccessKey:" output.txt)
secretKeyPresent=$(grep -c "^SecretKey:" output.txt)

if [[ $userNamePresent -gt 0 && $accessKeyPresent -gt 0 && $secretKeyPresent -gt 0 ]]; then
  echo "UserName, AccessKey, and SecretKey are already present in output.txt"
  exit 0
elif [[ $userNamePresent -gt 0 ]]; then
  echo "UserName is already present in output.txt"
  exit 0
elif [[ $accessKeyPresent -gt 0 && $secretKeyPresent -gt 0 ]]; then
  echo "AccessKey and SecretKey are already present in output.txt"
  exit 0
fi

# Stage k3: Create AccessKey and SecretKey
result=$(aws iam create-access-key --user-name "$UserName")

# Extract AccessKey and SecretKey from the result
accessKey=$(echo "$result" | jq -r '.AccessKey.AccessKeyId')
secretKey=$(echo "$result" | jq -r '.AccessKey.SecretAccessKey')

# Save the UserName, AccessKey, and SecretKey to output.txt
echo "UserName: $UserName" >> output.txt
echo "AccessKey: $accessKey" >> output.txt
echo "SecretKey: $secretKey" >> output.txt

echo "UserName, AccessKey, and SecretKey created and saved to output.txt"
