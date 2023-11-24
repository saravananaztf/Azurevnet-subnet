variable "vnetname" {
   type = string
  
  default = "mynet-defaul"
}


variable "vnetaddresspace" {
    type = list(string)

 default = [ "10.0.0.0/16" ] 
}



variable "web-subnet_name" {
   type = string
   default = "websubnet"
}



variable "websubnetddresspace" {
    type = list(string)

 default = [ "10.0.1.0/24" ] 
}


variable "db-subnet_name" {
   type = string
   default = "dbsubnet"
}



variable "dbsubnetddresspace" {
    type = list(string)

 default = [ "10.0.2.0/24" ] 

}



variable "appsubnet_name" {
   type = string
   default = "appsubnet"
}



variable "appsubnetddresspace" {
    type = list(string)

 default = [ "10.0.4.0/24" ] 

}


variable "basiton-subnet_name" {
   type = string
   default = "dbsubnet"
}



variable "basitonddresspace" {
    type = list(string)

 default = [ "10.0.3.0/24" ] 

}