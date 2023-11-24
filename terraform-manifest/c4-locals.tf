locals {
  owners = var.buisness_division
  environment = var.environment
  resourcename-prefix = "${var.buisness_division}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }

}