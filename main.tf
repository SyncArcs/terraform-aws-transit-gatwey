

module "labels" {
  source      = "git::https://github.com/SyncArcs/terraform-aws-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}





# Create a Transit Gateway
resource "aws_ec2_transit_gateway" "example" {
  amazon_side_asn                 = var.amazon_side_asn
  auto_accept_shared_attachments  = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  dns_support                     = var.dns_support
  multicast_support               = var.multicast_support

  tags = merge(module.labels.tags, {
    Name = "VPC1-TGW-Attachment"
  })
}

# Attach VPC 1 to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1" {
  subnet_ids         = var.vpc1_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.vpc-1

  tags = merge(module.labels.tags, {
    Name = "VPC1-TGW-Attachment"
  })
}
# Attach VPC 2 to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2" {
  subnet_ids         = var.vpc2_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.vpc-2

  tags = merge(module.labels.tags, {
    Name = "VPC2-TGW-Attachment"
  })
}

# Attach VPC 3 to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc3" {
  subnet_ids         = var.vpc3_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.vpc-3
  tags = merge(module.labels.tags, {
    Name = "VPC3-TGW-Attachment"
  })
}

