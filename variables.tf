variable "name" {
  description = "Name for the resources"
  type        = string
  default     = ""
}
#
variable "environment" {
  description = "Environment for the resources"
  type        = string
  default     = ""
}

variable "managedby" {
  description = "Managed by label"
  type        = string
  default     = ""
}

variable "label_order" {
  description = "Order of the labels"
  type        = list(string)
  default     = []
}

variable "repository" {
  description = "Repository for the labels module"
  type        = string
  default     = null
}


variable "amazon_side_asn" {
  description = "Amazon side ASN for the Transit Gateway"
  type        = number
  default     = 64512
}

variable "auto_accept_shared_attachments" {
  description = "Whether to auto accept shared attachments"
  type        = string
  default     = "enable"
}

variable "default_route_table_association" {
  description = "Whether to associate with default route tables"
  type        = string
  default     = "enable"
}

variable "default_route_table_propagation" {
  description = "Whether to propagate to default route tables"
  type        = string
  default     = "enable"
}

variable "dns_support" {
  description = "Whether to enable DNS support"
  type        = string
  default     = "enable"
}

variable "multicast_support" {
  description = "Whether to enable multicast support"
  type        = string
  default     = "disable"
}

variable "vpc1_subnet_ids" {
  description = "List of subnet IDs for VPC 1"
  type        = list(string)
  default     = ["subnet-xxxxxx7", "subnet-xxxxxx8"]
}

variable "vpc2_subnet_ids" {
  description = "List of subnet IDs for VPC 2"
  type        = list(string)
  default     = ["subnet-xxxxxx7", "subnet-xxxxxx8"]
}

variable "vpc3_subnet_ids" {
  description = "List of subnet IDs for VPC 3"
  type        = list(string)
  default     = ["subnet-xxxxxx7", "subnet-xxxxxx8"]
}


variable "vpc-1" {
  description = "VPC ID for VPC 1"
  type        = string
  default     = ""
}

variable "vpc-2" {
  type    = string
  default = "VPC ID for VPC 2"
}

variable "vpc-3" {
  type    = string
  default = "VPC ID for VPC 3"
}
