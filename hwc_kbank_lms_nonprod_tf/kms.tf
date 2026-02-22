######################################################################
# KMS
######################################################################
/*resource "huaweicloud_kms_key" "kms_encryption" {
  for_each          = var.kms_encryption

  key_alias         = each.value.keyAlias
  pending_days      = each.value.keyPendingDays
  is_enabled        = each.value.keyIsEnabled
  key_algorithm     = each.value.keyAlgorithm
  rotation_enabled  = each.value.keyRotationEnabled
  rotation_interval = each.value.keyRotationInterval
}*/