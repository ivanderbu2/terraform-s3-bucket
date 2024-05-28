output "bucket_arn" {
  description = "S3 bucket arn"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.bucket.bucket
}

output "iam_user_arn" {
  description = "AWS IAM user arn"
  value       = aws_iam_user.user.arn
}

output "iam_user_name" {
  description = "AWS IAM user name"
  value       = aws_iam_user.user.name
}

output "iam_access_key" {
  description = "AWS user access key"
  value       = aws_iam_access_key.user_key.id
  sensitive   = true
}

output "iam_secret_key" {
  description = "AWS user secret key"
  value       = aws_iam_access_key.user_key.secret
  sensitive   = true
}