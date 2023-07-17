#!/bin/bash

# Stage p1: Data fetch from input.txt
while IFS=: read -r key value; do
  case $key in
    "UserName") UserName=$value ;;
    "GroupName") GroupName=$value ;;
    "FolderName") FolderName=$value ;;
    *) ;;
  esac
done < input.txt

# Stage p2: Replace FolderName variable in policy.json
echo -e "\n-------Replace FolderName in policy.json-------\n"
sleep 5s

# Read the FolderName from input.txt
FolderName=$(grep -Po '(?<=FolderName:).*' input.txt)

# Replace the FolderName variable in the policy.json file
sed -i "s/FolderName/$FolderName/g" policy.json

# Create or retrieve the custom IAM policy
policyName="s3_${FolderName}_private"
policyArn=$(aws iam list-policies --query 'Policies[?PolicyName==`'$policyName'`].Arn' --output text)

if [[ -z "$policyArn" ]]; then
  # Create the policy if it doesn't exist
  policyArn=$(aws iam create-policy --policy-name "$policyName" --policy-document "file://policy.json" --query 'Policy.Arn' --output text)
  echo "Custom policy created: $policyName"
else
  echo "Custom policy already exists: $policyName"
fi

# Check if the policy is already attached to the group
attachedPolicies=$(aws iam list-attached-group-policies --group-name "$GroupName" --query 'AttachedPolicies[?PolicyArn==`'$policyArn'`]' --output text)

if [[ -z "$attachedPolicies" ]]; then
  # Attach the policy to the group
  aws iam attach-group-policy --group-name "$GroupName" --policy-arn "$policyArn"
  echo "Custom policy attached to the group: $GroupName"
fi

# Print the policy details
policyDetails=$(aws iam get-policy --policy-arn "$policyArn")
echo -e "\n-------Custom Policy Details------\n"
echo "$policyDetails"
