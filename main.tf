provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "random" {}

resource "random_pet" "user_name" {
  prefix = "bucket"
}

resource "random_pet" "bucket_name" {
  prefix = "laravel"
}

resource "aws_s3_bucket" "bucket" {
  bucket = random_pet.bucket_name.id
}

resource "aws_iam_user" "user" {
  name = random_pet.user_name.id
}

resource "aws_iam_user_policy" "user_policy" {
  name = "allow-s3-uploads"
  user = aws_iam_user.user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetObject"
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.bucket.arn}/*",
          aws_s3_bucket.bucket.arn
        ]
      }
    ]
  })
}

resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.user.name
}
