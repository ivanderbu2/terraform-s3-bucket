# Terraform configuration for creating S3 bucket with the related IAM user

For every new web application I need a dedicated S3 bucket for storing backup files.

This S3 bucket is without public access and only a dedicated IAM user with write access to that bucket can access it.

So far I always manually created this and this involves a couple of steps:

- create new bucket
- create IAM user
- attach inline policy to the IAM user
- create access credentials

Doing this manually is boring, so I created this Terraform configuration.

## Script variables

It's required to have AWS Admin account credentials inside `terraform.tfvars` file as:

```
access_key = ""
secret_key = ""
```

## Script output

This Terraform configuration will among other details have `iam_access_key` and `iam_secret_key` of the new IAM user which can write to the new bucket.

## Using this bucket in a Laravel project

After running `terraform apply` Terraform will create new bucket with a random name, and it'll output the name. 
With that name, region and credentials Laravel .env file can be populated.

```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-2
AWS_BUCKET=
```

With this setup Laravel will be able to store files inside the bucket.