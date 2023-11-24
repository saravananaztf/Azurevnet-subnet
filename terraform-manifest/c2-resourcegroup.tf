resource "azurerm_resource_group" "myrg1" {
  name = "${local.resourcename-prefix}-myrg-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags = local.common_tags
}