## S3_Automation

[![Amazon S3](https://img.shields.io/badge/Amazon%20S3-Cloud%20Storage-569A31?logo=amazon%20s3&logoColor=white)](https://aws.amazon.com/s3/)
[![AWS IAM](https://img.shields.io/badge/AWS%20IAM-Access%20Management-FF9900?logo=amazon%20aws&logoColor=white)](https://aws.amazon.com/iam/)

-- Automate your Amazon S3 operations and manage access controls effortlessly with this S3 Automation repository. Utilizing the AWS and IAM, this project enables seamless interaction with S3 buckets while enforcing secure permissions.

#### S3_Automation_for Dev and Staging Enviroment

![Development](https://img.shields.io/badge/Environment-Development-brightgreen?style=flat-square) ![Staging](https://img.shields.io/badge/Environment-Staging-yellow?style=flat-square)

-- Using this repo you can automate your s3 and iam daily task.

#### Status
-- Currently, the project is prepared for development and staging only.

## --------------------------- Steps to run this project in local------------------------ ##

#### 1. Clone this repo

[![GitHub](https://img.shields.io/badge/GitHub-Profile-blue?style=flat-square&logo=github)](https://github.com/YourGitHubUsername)


-- git clone https://github.com/pxit-jae/s3_automation.git

-- select s3_automation_private or s3_automation_public depends on your requirment.

#### 2. Install aws cli and configure



-- For Debian : sudo apt update && sudo apt install awscli -y

-- For Linux : sudo yum update && sudo yum install awscli -y

for more information follow the doc 
### https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

-- Once install the aws cli configure it.

-- <b>cmd</b></span> : aws confiure

![AWS Configure](https://img.shields.io/badge/AWS-Configure-FF9900?style=flat-square&logo=amazon-aws)


<b>AWS Access Key ID</b></span> [****************YXFA]: 

<b>AWS Secret Access Key</b></span> [****************a7BW]: 

<b>Default region name [ap-northeast-1]</b></span>: 

<b>Default output format [None]</b></span>: 

-- As it suits you, enter the aforementioned information.

#### 3. Run the script

#### for Private Bucket

-- <b>cd s3_automation_private</b></span>, Update your bucket, user and group name in  <b></b>input.txt</span>, as well change the bucket and folder name in policy.json which is defined by with <b>$BUCKET_NAME</b></span> and <b>$FOLDER_NAME</b></span> variable.

-- <b>cmd</b></span> make run_private

once this task will run, your data will store in <b>output.txt</b></span>

#### for Public Bucket

-- <b>cd s3_automation_public</b></span>, Update your bucket, user and group name in  <b></b>input.txt</span>, as well change the bucket and folder name in policy.json which is defined by with <b>$BUCKET_NAME</b></span> and <b>$FOLDER_NAME</b></span> variable.

-- <b>cmd</b></span> make run_public

once this task will run, your data will store in <b>output.txt</b></span>


-------------------------------------------------------------------------------------------------------

👋 Thank you for checking out this repository! If you have any questions or need assistance, feel free to reach out. Let's make technology better together! Happy coding! 😊

 
