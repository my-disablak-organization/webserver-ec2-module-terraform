# Display dns information

output "http_ip" {
  value = {
    for instance in aws_instance.http :
    instance.id => instance.private_ip
  }
}

output "db_ip" {
  value = {
    for instance in aws_instance.db :
    instance.id => instance.private_ip
  }
}

// remove
output "instance_http_ids" {
  value = [for i in aws_instance.http : i.id]
}
// remove
output "instance_db_ids" {
  value = [for i in aws_instance.db : i.id]
}

output "vpc_cidr" {
  value = aws_vpc.terraform.cidr_block
}

output "subnet_http_cidr" {
  value = aws_subnet.http.cidr_block
}

output "subnet_db_cidr" {
  value = aws_subnet.db.cidr_block
}