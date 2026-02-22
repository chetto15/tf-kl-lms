# variables.tf - Variable definitions for Huawei Cloud Network Resources

variable "access_key" {
  description = "The access key variable"
  sensitive   = true
}

variable "secret_key" {
  description = "The secret key variable"
  sensitive   = true
}

# ============================================================================
# VPCs
# ============================================================================
variable "vpcs" {
  description = "Map of VPCs to create"
  type = map(object({
    name        = string
    cidr        = string
    description = optional(string, "")
  }))
  default = {}
}

# ============================================================================
# Subnets
# ============================================================================
variable "subnets" {
  description = "Map of Subnets to create"
  type = map(object({
    name        = string
    cidr        = string
    vpc_key     = string  # Reference to VPC key
    gateway_ip  = string
    description = optional(string, "")
  }))
  default = {}
}

# ============================================================================
# LTS Log Groups
# ============================================================================
variable "log_groups" {
  description = "Map of LTS Log Groups to create"
  type = map(object({
    name        = string
    ttl_in_days = optional(number, 90)
  }))
  default = {}
}

# ============================================================================
# LTS Log Streams
# ============================================================================
variable "log_streams" {
  description = "Map of LTS Log Streams to create"
  type = map(object({
    name          = string
    log_group_key = string  # Reference to Log Group key
  }))
  default = {}
}

# ============================================================================
# VPC FlowLogs
# ============================================================================
variable "vpc_flowlogs" {
  description = "Map of VPC FlowLogs to create"
  type = map(object({
    name           = string
    vpc_key        = string  # Reference to VPC key
    log_group_key  = string  # Reference to Log Group key
    log_stream_key = string  # Reference to Log Stream key
    traffic_type   = optional(string, "ALL")
    resource_type  = optional(string, "vpc")
  }))
  default = {}
}

# ============================================================================
# LTS Log Streams Structuring Template
# ============================================================================
variable "lts_structing_template" {
  description = "Map of LTS Log Streams Structuring Template create"
  type = map(object({
    log_group_key  = string  # Reference to Log Group key
    log_stream_key = string  # Reference to Log Stream key
  }))
  default = {}
}

# ============================================================================
# KMS Encrpytion Disk
# ============================================================================
variable "kms_encryption" {
  description = "Map of KMS Key Encryption disk create"
  type = map(object({

    keyRegion           = optional(string, "ap-southeast-2")
    keyAlias            = string
    keyPendingDays      = optional(string)
    keyIsEnabled        = optional(bool, false)
    keyAlgorithm        = optional(string, "AES_256")
    keyRotationEnabled  = optional(bool, false)
    keyRotationInterval = optional(string)
    keyDescription      = optional(string, "createdByTerraform")
  }))
  default = {}
}

# ============================================================================
# SG Security Groups Profile
# ============================================================================
variable "secgroup" {
  description = "Map of SG Security Groups Profile create"
  type = map(object({
    name  = string 
    description = optional(string, null)
  }))
  default = {}
}

# ============================================================================
# SG Security Group Rules
# ============================================================================
variable "secgroup_rule" {
  description = "Map of SG Security Group Rules create"
  type = map(object({
      secgroup_key   = string  # Reference to Security Group key
      direction      = string
      action         = optional(string, "allow")
      ethertype      = string
      ports          = optional(string, null)
      remoteIpPrefix = optional(string, null)
      priority       = optional(number, null)
      description    = optional(string, null)
      protocol       = optional(string, null)
      portRangeMin   = optional(string, null)
      portRangeMax   = optional(string, null)
      ipGroupID      = optional(string, null)
      addresses      = optional(list(string))
      remoteGroupID  = optional(string, null)
  }))
  default = {}
}