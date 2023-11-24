resource "azurerm_virtual_network" "myvnet" {
    name = "${local.resourcename-prefix}-${var.vnetname}"
    location = var.resource_group_location
    address_space = var.vnetaddresspace
    resource_group_name = azurerm_resource_group.myrg1.name
    tags = local.common_tags
    depends_on = [ azurerm_resource_group.myrg1 ]
}