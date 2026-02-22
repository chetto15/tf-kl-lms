######################################################################
# Security Group and Security Group rules
######################################################################

/*resource "huaweicloud_networking_secgroup" "this" {
  for_each    = var.secgroup
  name        = each.value.name
  description = each.value.description
}
*/