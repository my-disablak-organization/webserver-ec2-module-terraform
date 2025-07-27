variable "prefix" {
  description = "Prefix used for resource naming."
  type        = string
  default = "my-"
}

variable "aws_region" {
  description = "AWS region to create the VPC, assuming zones `a` and `b` exists."
  type        = string
  default = "us-east-1"
}

variable "github_app" {
  description = "GitHub for API usages."

  type = object({
    id         = string
    key_base64 = string
  })

  default = {
    id         = "1664700"
    key_base64 = "default-base64-key"
  }
}
