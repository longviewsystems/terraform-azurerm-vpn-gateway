/*****************************************
/*   Naming conventions
/*****************************************/
# https://github.com/Azure/terraform-azurerm-naming
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.1.1"
  suffix  = ["networking"]
  prefix  = ["lic"]

  unique-include-numbers = false
  unique-length          = 4
}

/*****************************************
/*   Resource Group
/*****************************************/

resource "azurerm_resource_group" "resource_group" {
  name     = module.naming.resource_group.name_unique
  location = var.location
  tags     = var.tags
}

/*****************************************
/*   vNet
/*****************************************/

resource "azurerm_virtual_network" "vnet" {
  name                = module.naming.virtual_network.name_unique
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags
}

# subnet
resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}