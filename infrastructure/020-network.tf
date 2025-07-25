# Network configuration

# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-http"
    Environment = var.env
  }
}

# http subnet configuration
resource "aws_subnet" "http" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = var.network_http["cidr"]
  availability_zone = var.network_http["az"]
  tags = {
    Name        = "subnet-http"
    Environment = var.env
  }
  depends_on = [aws_internet_gateway.gw]
}

# db subnet configuration
resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = var.network_db["cidr"]
  availability_zone = var.network_http["az"]
  tags = {
    Name        = "subnet-db"
    Environment = var.env
  }
  depends_on = [aws_internet_gateway.gw]
}

# External gateway configuration
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name        = "internet-gateway"
    Environment = var.env
  }
}

