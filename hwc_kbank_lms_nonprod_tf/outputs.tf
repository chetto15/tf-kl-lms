# outputs.tf - Output values for reference

# ============================================================================
# VPC Outputs
# ============================================================================
output "vpc_ids" {
  description = "Map of VPC names to IDs"
  value       = { for k, v in huaweicloud_vpc.this : k => v.id }
}

output "vpc_details" {
  description = "Detailed VPC information"
  value = {
    for k, v in huaweicloud_vpc.this : k => {
      id   = v.id
      name = v.name
      cidr = v.cidr
    }
  }
}

# ============================================================================
# Subnet Outputs
# ============================================================================
output "subnet_ids" {
  description = "Map of Subnet names to IDs"
  value       = { for k, v in huaweicloud_vpc_subnet.this : k => v.id }
}

output "subnet_details" {
  description = "Detailed Subnet information"
  value = {
    for k, v in huaweicloud_vpc_subnet.this : k => {
      id         = v.id
      name       = v.name
      cidr       = v.cidr
      vpc_id     = v.vpc_id
      gateway_ip = v.gateway_ip
    }
  }
}

# ============================================================================
# LTS Log Group Outputs
# ============================================================================
output "log_group_ids" {
  description = "Map of Log Group names to IDs"
  value       = { for k, v in huaweicloud_lts_group.this : k => v.id }
}

# ============================================================================
# LTS Log Stream Outputs
# ============================================================================
output "log_stream_ids" {
  description = "Map of Log Stream names to IDs"
  value       = { for k, v in huaweicloud_lts_stream.this : k => v.id }
}

# ============================================================================
# VPC FlowLog Outputs
# ============================================================================
output "flowlog_ids" {
  description = "Map of FlowLog names to IDs"
  value       = { for k, v in huaweicloud_vpc_flow_log.this : k => v.id }
}

# ============================================================================
# KMS Outputs
# ============================================================================
/*output "kms_ids" {
  description = "Map of KMS names to IDs"
  value       = { for k, v in huaweicloud_kms_key.kms_encryption : k => v.id }
}*/

# ============================================================================
# Security Group Outputs
# ============================================================================
/*output "secgroup_ids" {
  description = "Map of SG names to IDs"
  value       = { for k, v in huaweicloud_networking_secgroup.this : k => v.id }
}*/