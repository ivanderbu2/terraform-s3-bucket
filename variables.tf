variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"
}

variable "access_key" {
  type        = string
  description = "AWS access key for an Admin account"
}
variable "secret_key" {
  type        = string
  description = "AWS secret key for an Admin account"
}