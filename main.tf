resource "azurerm_public_ip" "pip_gw" {
  name                = var.vpn_gateway_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.vpn_public_ip_allocation_method
  sku                 = var.vpn_public_ip_sku
  zones               = var.vpn_public_ip_zones
  # availability_zone   = "No-Zone"
}


resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = var.vpn_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = var.gateway_type
  vpn_type            = var.vpn_type
  sku                 = var.vpn_gw_sku
  active_active       = var.enable_active_active
  generation          = var.vpn_gw_generation
  tags                = var.tags

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }
}
