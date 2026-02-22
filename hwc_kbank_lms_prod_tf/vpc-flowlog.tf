# ============================================================================
# VPC FlowLogs
# ============================================================================
resource "huaweicloud_vpc_flow_log" "this" {
  for_each = var.vpc_flowlogs

  name          = each.value.name
  resource_type = each.value.resource_type
  resource_id   = huaweicloud_vpc.this[each.value.vpc_key].id
  traffic_type  = each.value.traffic_type
  log_group_id  = huaweicloud_lts_group.this[each.value.log_group_key].id
  log_stream_id = huaweicloud_lts_stream.this[each.value.log_stream_key].id

  description = "FlowLog for ${each.value.vpc_key}"
}
