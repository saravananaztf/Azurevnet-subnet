output "vnetname" {
  value = azurerm_virtual_network.myvnet.name
}

output "vnetid" {
  value = azurerm_virtual_network.myvnet.id
}


output "websubnetname" {
  value = azurerm_subnet.websubnet.name
    
}


output "websubnetid" {
  value = azurerm_subnet.websubnet.id
    
}


output "appname" {
  value = azurerm_subnet.appsubnet.name
    
}


output "appsubnetid" {
 value = azurerm_subnet.appsubnet.id
    
}


output "dbname" {
  value = azurerm_subnet.dbsubnet.name
    
}


output "dbsubnetid" {
 value = azurerm_subnet.dbsubnet.id
}
