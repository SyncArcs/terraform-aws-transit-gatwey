# Output the Transit Gateway ID
output "transit_gateway_id" {
  description = "The ID of the Transit Gateway"
  value       = aws_ec2_transit_gateway.example.id
}

# Output the VPC 1 attachment ID
output "vpc1_attachment_id" {
  description = "The ID of the VPC 1 Transit Gateway attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc1.id
}

# Output the VPC 2 attachment ID
output "vpc2_attachment_id" {
  description = "The ID of the VPC 2 Transit Gateway attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc2.id
}

# Output the VPC 3 attachment ID
output "vpc3_attachment_id" {
  description = "The ID of the VPC 3 Transit Gateway attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc3.id
}


# Output the subnet IDs for each VPC
output "vpc1_subnet_ids" {
  description = "The subnet IDs used for VPC 1 attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc1.subnet_ids
}

output "vpc2_subnet_ids" {
  description = "The subnet IDs used for VPC 2 attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc2.subnet_ids
}

output "vpc3_subnet_ids" {
  description = "The subnet IDs used for VPC 3 attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc3.subnet_ids
}

