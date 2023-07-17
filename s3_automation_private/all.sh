#!/bin/bash

# # List of script names in the desired order
# script_names=("1.bucket.sh" "2.iam.sh" "3.policy.sh" "4.key.sh")

# # Disable output for the entire script
# exec > /dev/null

# # Execute scripts one by one
# for script_name in "${script_names[@]}"
# do
#     # Run the script
#     sh "$script_name"
# done


# Execute 1.bucket.sh
./1.bucket.sh

# Execute 2.key.sh
./2.iam.sh

# Execute 3.Policy.sh
./3.policy.sh

# Execute 4.key.sh
./4.key.sh
