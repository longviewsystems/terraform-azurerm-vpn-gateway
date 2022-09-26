module "resources" {
  source = "./resources"
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.1.1"
  suffix  = ["networking"]
  prefix  = ["lic"]

  unique-include-numbers = false
  unique-length          = 4
}


module "vpn_gateway" {
  source                          = "../../" # testing root module
  location                        = module.resources.virtual_network_resource_group_location
  resource_group_name             = module.resources.virtual_network_resource_group_name
  vpn_gateway_pip_name            = module.naming.public_ip.name_unique
  vpn_public_ip_sku               = "Standard"
  vpn_public_ip_allocation_method = "Static"
  vpn_gateway_name                = module.naming.virtual_network_gateway.name_unique
  gateway_type                    = "Vpn"
  vpn_type                        = "RouteBased"
  vpn_gw_sku                      = "VpnGw2"
  vpn_gw_generation               = "Generation2"
  enable_active_active            = "false"
  gateway_subnet_id               = module.resources.gateway_subnet_id
}
