# AWS Transit Gateway with VPC Attachments

This Terraform module creates an AWS Transit Gateway and attaches multiple VPCs to it. It allows for centralized routing between the attached VPCs.

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Usage](#usage)
- [License](#license)

## Overview

The module provisions an AWS Transit Gateway and attaches four VPCs, enabling seamless communication between them. The configuration supports the automatic acceptance of shared attachments and allows for tagging the resources for better management.

## Requirements

- Terraform 1.x
- AWS Provider for Terraform

## Inputs

| Variable                          | Description                                        | Type            | Default   |
|-----------------------------------|----------------------------------------------------|-----------------|-----------|
| `name`                            | Name of the Transit Gateway                        | `string`        | `""`      |
| `environment`                     | Environment (e.g., dev, prod)                      | `string`        | `""`      |
| `managedby`                       | The entity managing the resource                   | `string`        | `""`      |
| `label_order`                     | Order of the labels                                | `list(string)`  | `[]`      |
| `repository`                      | Git repository URL                                 | `string`        | `""`      |
| `amazon_side_asn`                 | Amazon side ASN for the Transit Gateway            | `number`        | `64512`   |
| `auto_accept_shared_attachments`  | Whether to automatically accept shared attachments | `bool`          | `false`   |
| `default_route_table_association` | Default association for the route table            | `bool`          | `true`    |
| `default_route_table_propagation` | Default propagation for the route table            | `bool`          | `true`    |
| `dns_support`                     | Enable DNS support for the Transit Gateway         | `bool`          | `true`    |
| `multicast_support`               | Enable multicast support for the Transit Gateway   | `bool`          | `false`   |
| `vpc1_subnet_ids`                 | List of subnet IDs for VPC 1                       | `list(string)`  | `[]`      |
| `vpc2_subnet_ids`                 | List of subnet IDs for VPC 2                       | `list(string)`  | `[]`      |
| `vpc3_subnet_ids`                 | List of subnet IDs for VPC 3                       | `list(string)`  | `[]`      |
| `vpc4_subnet_ids`                 | List of subnet IDs for VPC 4                       | `list(string)`  | `[]`      |
| `vpc-1`                           | VPC ID for VPC 1                                   | `string`        | `""`      |
| `vpc-2`                           | VPC ID for VPC 2                                   | `string`        | `""`      |
| `vpc-3`                           | VPC ID for VPC 3                                   | `string`        | `""`      |

## Outputs

| Output               | Description                                 |
|----------------------|---------------------------------------------|
| `transit_gateway_id` | The ID of the created Transit Gateway       |
| `vpc1_attachment_id` | The ID of the attachment for VPC 1          |
| `vpc2_attachment_id` | The ID of the attachment for VPC 2          |
| `vpc3_attachment_id` | The ID of the attachment for VPC 3          |
| `vpc4_attachment_id` | The ID of the attachment for VPC 4          |

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "transit_gateway" {
  source      = "./path/to/your/module"  # Update with the correct path to the module
  name        = "MyTransitGateway"
  environment = "dev"
  managedby   = "your-name"
  label_order = ["env", "name"]
  repository  = "your-repo-url"

  amazon_side_asn                 = 64512
  auto_accept_shared_attachments  = true
  default_route_table_association = true
  default_route_table_propagation = true
  dns_support                     = true
  multicast_support               = false

  vpc1_id         = "vpc-xxxxxx1"
  vpc1_subnet_ids = ["subnet-xxxxxx1", "subnet-xxxxxx2"]

  vpc2_id         = "vpc-xxxxxx2"
  vpc2_subnet_ids = ["subnet-xxxxxx3", "subnet-xxxxxx4"]

  vpc3_id         = "vpc-xxxxxx3"
  vpc3_subnet_ids = ["subnet-02b61a3e93cdf9dde"]

  vpc4_id         = "vpc-xxxxxx4"
  vpc4_subnet_ids = ["subnet-xxxxxx7", "subnet-xxxxxx8"]
}



### Explanation of the README Structure:
1. **Overview**: Provides a brief description of what the module does.
2. **Requirements**: Lists the Terraform version and provider needed.
3. **Inputs**: Details all input variables, their descriptions, types, and default values.
4. **Outputs**: Lists the outputs from the module.
5. **Usage**: Provides an example of how to use the module in a Terraform configuration.
6. **License**: Mentions the license under which the module is distributed.

Feel free to modify any sections to better fit your specific use case or add additional details as needed!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/SyncArcs/terraform-aws-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.vpc1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.vpc2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.vpc3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amazon_side_asn"></a> [amazon\_side\_asn](#input\_amazon\_side\_asn) | Amazon side ASN for the Transit Gateway | `number` | `64512` | no |
| <a name="input_auto_accept_shared_attachments"></a> [auto\_accept\_shared\_attachments](#input\_auto\_accept\_shared\_attachments) | Whether to auto accept shared attachments | `string` | `"enable"` | no |
| <a name="input_default_route_table_association"></a> [default\_route\_table\_association](#input\_default\_route\_table\_association) | Whether to associate with default route tables | `string` | `"enable"` | no |
| <a name="input_default_route_table_propagation"></a> [default\_route\_table\_propagation](#input\_default\_route\_table\_propagation) | Whether to propagate to default route tables | `string` | `"enable"` | no |
| <a name="input_dns_support"></a> [dns\_support](#input\_dns\_support) | Whether to enable DNS support | `string` | `"enable"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the resources | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Order of the labels | `list(string)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | Managed by label | `string` | `""` | no |
| <a name="input_multicast_support"></a> [multicast\_support](#input\_multicast\_support) | Whether to enable multicast support | `string` | `"disable"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the resources | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository for the labels module | `string` | `null` | no |
| <a name="input_vpc-1"></a> [vpc-1](#input\_vpc-1) | VPC ID for VPC 1 | `string` | `""` | no |
| <a name="input_vpc-2"></a> [vpc-2](#input\_vpc-2) | n/a | `string` | `"VPC ID for VPC 2       "` | no |
| <a name="input_vpc-3"></a> [vpc-3](#input\_vpc-3) | n/a | `string` | `"VPC ID for VPC 3       "` | no |
| <a name="input_vpc1_subnet_ids"></a> [vpc1\_subnet\_ids](#input\_vpc1\_subnet\_ids) | List of subnet IDs for VPC 1 | `list(string)` | <pre>[<br>  "subnet-xxxxxx7",<br>  "subnet-xxxxxx8"<br>]</pre> | no |
| <a name="input_vpc2_subnet_ids"></a> [vpc2\_subnet\_ids](#input\_vpc2\_subnet\_ids) | List of subnet IDs for VPC 2 | `list(string)` | <pre>[<br>  "subnet-xxxxxx7",<br>  "subnet-xxxxxx8"<br>]</pre> | no |
| <a name="input_vpc3_subnet_ids"></a> [vpc3\_subnet\_ids](#input\_vpc3\_subnet\_ids) | List of subnet IDs for VPC 3 | `list(string)` | <pre>[<br>  "subnet-xxxxxx7",<br>  "subnet-xxxxxx8"<br>]</pre> | no |
| <a name="input_vpn_ecmp_support"></a> [vpn\_ecmp\_support](#input\_vpn\_ecmp\_support) | Whether to enable VPN ECMP support | `string` | `"enable"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_transit_gateway_id"></a> [transit\_gateway\_id](#output\_transit\_gateway\_id) | The ID of the Transit Gateway |
| <a name="output_vpc1_attachment_id"></a> [vpc1\_attachment\_id](#output\_vpc1\_attachment\_id) | The ID of the VPC 1 Transit Gateway attachment |
| <a name="output_vpc1_subnet_ids"></a> [vpc1\_subnet\_ids](#output\_vpc1\_subnet\_ids) | The subnet IDs used for VPC 1 attachment |
| <a name="output_vpc2_attachment_id"></a> [vpc2\_attachment\_id](#output\_vpc2\_attachment\_id) | The ID of the VPC 2 Transit Gateway attachment |
| <a name="output_vpc2_subnet_ids"></a> [vpc2\_subnet\_ids](#output\_vpc2\_subnet\_ids) | The subnet IDs used for VPC 2 attachment |
| <a name="output_vpc3_attachment_id"></a> [vpc3\_attachment\_id](#output\_vpc3\_attachment\_id) | The ID of the VPC 3 Transit Gateway attachment |
| <a name="output_vpc3_subnet_ids"></a> [vpc3\_subnet\_ids](#output\_vpc3\_subnet\_ids) | The subnet IDs used for VPC 3 attachment |
<!-- END_TF_DOCS -->