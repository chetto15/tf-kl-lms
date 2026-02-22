# ============================================================================
# VPCs
# ============================================================================
resource "huaweicloud_vpc" "this" {
  for_each = var.vpcs

  name        = each.value.name
  cidr        = each.value.cidr
  description = each.value.description

  tags = {
    #Name       = each.value.name
    ManagedBy  = "terraform"
  }
}
