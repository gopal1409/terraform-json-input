locals {
  owners              = var.business_devision #sap
  environment         = var.environment       #dev
  resurce_name_prefix = "${var.business_devision}-${var.environment}"
  #sap-dev
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}