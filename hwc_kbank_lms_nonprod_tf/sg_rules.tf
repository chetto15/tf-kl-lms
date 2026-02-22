/*resource "huaweicloud_networking_secgroup_rule" "this" {
  for_each = var.secgroup_rule

  security_group_id       = huaweicloud_networking_secgroup.this[each.value.secgroup_key].id
  direction               = each.value.direction
  action                  = each.value.action
  ethertype               = each.value.ethertype
  ports                   = each.value.ports
  protocol                = each.value.protocol
  priority                = each.value.priority
  remote_ip_prefix        = each.value.remoteIpPrefix
  remote_address_group_id = each.value.ipGroupID
  remote_group_id         = each.value.remoteGroupID
  description             = each.value.description
}*/