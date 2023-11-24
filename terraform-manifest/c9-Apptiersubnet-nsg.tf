resource "azurerm_subnet" "appsubnet" {
    name = "${azurerm_virtual_network.myvnet.name}-${var.appsubnet_name}"
    address_prefixes = var.appsubnetddresspace
    virtual_network_name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.myrg1.name
    depends_on = [ azurerm_virtual_network.myvnet ]
  
}


resource "azurerm_network_security_group" "app-mynsg" {
    name = "${azurerm_subnet.appsubnet.name}-nsg"
    resource_group_name = azurerm_resource_group.myrg1.name
    location = azurerm_resource_group.myrg1.location
    tags = local.common_tags
}


resource "azurerm_subnet_network_security_group_association" "app-subnet-nsg-assoc" {
    subnet_id = azurerm_subnet.appsubnet.id
    network_security_group_id = azurerm_network_security_group.app-mynsg.id
}


locals {
  appinboundportsmap = {
 "100" : "80"
 "110" : "443"
  "120" : "22"

  }
}

resource "azurerm_network_security_rule" "app-mynsg" {
    for_each = local.appinboundportsmap
  name                        = "Rule-port-${each.key}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myrg1.name
  network_security_group_name = azurerm_network_security_group.app-mynsg.name
  depends_on = [ azurerm_subnet.websubnet,azurerm_network_security_group.mynsg ,azurerm_subnet_network_security_group_association.subnet-nsg-assoc]
   
}