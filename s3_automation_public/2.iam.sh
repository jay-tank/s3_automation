#!/bin/bash

# Stage i1: Data fetch from input.txt
while IFS=: read -r key value; do
  case $key in
    "UserName") UserName=$value ;;
    "GroupName") GroupName=$value ;;
    "FolderName") FolderName=$value ;;
    *) ;;
  esac
done < input.txt

# Stage i2: Creating and Check IAM UserName
echo -e "\n-------Create IAM UserName-------\n"
sleep 5s

if ! aws iam get-user --user-name "$UserName" >/dev/null 2>&1; then
  # Create IAM UserName
  aws iam create-user --user-name "$UserName"
else
  echo "UserName is $UserName"
fi

# Stage i3: Check if the group already exists
echo -e "\n-------Creating Usergroups-------\n"
sleep 5s

if ! aws iam get-group --group-name "$GroupName" >/dev/null 2>&1; then
  # Create IAM group
  aws iam create-group --group-name "$GroupName"
else
  echo "Groupname is $GroupName"
fi

# Stage i4: Attach UserName to group if not already attached
echo -e "\n-------Add IAM User to Usergroups------\n"
sleep 5s

# Check if UserName is already a member of the group
if aws iam get-group --group-name "$GroupName" | grep -q "$UserName"; then
  echo "UserName $UserName is already a member of group $GroupName"
else
  # Add UserName to the group
  aws iam add-user-to-group --user-name "$UserName" --group-name "$GroupName"
  echo "UserName $UserName has been added to group $GroupName"
fi