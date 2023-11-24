terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.78.0"
    }
   random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
     
  }
}

provider "azurerm" {
  features {}
 
  }



 /*
  subscription_id   = "1bfdf34a-41f3-4fa7-ad05-7efc7006b72a"
  tenant_id         = "2dfadf55-f359-4486-8329-1fe23551c48d"
  client_id         = "fc1a932b-465d-40b4-b2dc-f33377d1dd12"
  client_secret     = "msv8Q~OwqU-J5a~4VAYzdeP466CUSG8XcgL9DcTE"
  skip_provider_registration = true
  */




