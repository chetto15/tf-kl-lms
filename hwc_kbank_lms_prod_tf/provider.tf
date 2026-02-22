######################################################################
# Get the terrform version and Huawei provider
######################################################################
terraform {
  required_version = ">1.3.0"
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">1.60.0"
    }
  }
}

######################################################################
# Access key, Secret key and Agency role
######################################################################
provider "huaweicloud" {
  #alias      = "bkk"
  region     = "ap-southeast-2" # The region of Bangkok
  access_key = var.access_key
  secret_key = var.secret_key
/*
  assume_role {
    agency_name = "terraformRole"
    domain_name = "Nobita-POC"
  }*/
}