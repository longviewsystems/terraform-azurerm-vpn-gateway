terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.88.1, < 3.0.0"
    }
  }
}


# provider "azurerm" {
# features {}
# subscription_id = ""
# }