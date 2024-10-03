
output "transit_gateway_id" {
  value       = module.transit_gatwey.transit_gateway_id
  description = "Transit Gateway ID"
}


output "transit_gateway_vpc_attachment_ids" {
  value       = module.transit_gatwey.vpc1_attachment_id
  description = "Transit Gateway VPC attachment IDs"
}
