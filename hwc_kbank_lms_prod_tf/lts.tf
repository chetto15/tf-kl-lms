# ============================================================================
# LTS Log Groups
# ============================================================================
resource "huaweicloud_lts_group" "this" {
  for_each = var.log_groups

  group_name  = each.value.name
  ttl_in_days = each.value.ttl_in_days

  tags = {
    #Name       = each.value.name
    ManagedBy  = "terraform"
  }
}

# ============================================================================
# LTS Log Streams
# ============================================================================
resource "huaweicloud_lts_stream" "this" {
  for_each = var.log_streams

  group_id    = huaweicloud_lts_group.this[each.value.log_group_key].id
  stream_name = each.value.name

  tags = {
    #Name       = each.value.name
    #LogGroup   = each.value.log_group_key
    ManagedBy  = "terraform"
  }
}

# ============================================================================
# LTS Log Streams Structure Template
# ============================================================================
resource "huaweicloud_lts_structing_template" "this" {
  for_each = var.lts_structing_template

  log_group_id  = huaweicloud_lts_group.this[each.value.log_group_key].id
  log_stream_id = huaweicloud_lts_stream.this[each.value.log_stream_key].id
  template_name = "VPC"
  template_type = "built_in"
}