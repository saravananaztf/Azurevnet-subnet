resource "azurerm_subnet" "dbsubnet" {
    name = "${azurerm_virtual_network.myvnet.name}-${var.db-subnet_name}"
    address_prefixes = var.dbsubnetddresspace
    virtual_network_name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.myrg1.name
    depends_on = [ azurerm_virtual_network.myvnet ]
  
}


resource "azurerm_network_security_group" "db-mynsg" {
    name = "${azurerm_subnet.dbsubnet.name}-nsg"
    resource_group_name = azurerm_resource_group.myrg1.name
    location = azurerm_resource_group.myrg1.location
    tags = local.common_tags
}


resource "azurerm_subnet_network_security_group_association" "subnet-nsg-assoc-db" {
    subnet_id = azurerm_subnet.dbsubnet.id
    network_security_group_id = azurerm_network_security_group.db-mynsg.id
}


locals {
  dbinboundportsmap = {
 "100" : "80"
 "110" : "443"
  "120" : "22"

  }
}

resource "azurerm_network_security_rule" "db-mynsg" {
    for_each = local.dbinboundportsmap
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
  network_security_group_name = azurerm_network_security_group.db-mynsg.name
  depends_on = [ azurerm_subnet.websubnet,azurerm_network_security_group.mynsg ,azurerm_subnet_network_security_group_association.subnet-nsg-assoc]
   
}