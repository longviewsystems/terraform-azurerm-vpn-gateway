output "vpn_gateway_id" {
  description = "The resource ID of the virtual network gateway"
  value       = azurerm_virtual_network_gateway.vpngw.id
}