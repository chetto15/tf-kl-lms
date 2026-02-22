# ============================================================================
# Subnets
# ============================================================================
resource "huaweicloud_vpc_subnet" "this" {
  for_each = var.subnets

  name        = each.value.name
  cidr        = each.value.cidr
  gateway_ip  = each.value.gateway_ip
  vpc_id      = huaweicloud_vpc.this[each.value.vpc_key].id
  description = each.value.description

  tags = {
    #Name       = each.value.name
    #VPC        = each.value.vpc_key
    ManagedBy  = "terraform"
  }
}