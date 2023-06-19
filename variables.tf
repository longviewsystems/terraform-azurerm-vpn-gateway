variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default = {
    environment = "test"
    managed_by  = "terratest"
  }
}
variable "location" {
  type        = string
  description = "The Location where RG is created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource group"
}

variable "vpn_gateway_pip_name" {
  description = "The name of the Virtual Network Gateway public IP"
  type        = string
  default     = ""
}

variable "gateway_subnet_id" {
  type        = string
  description = "The gateway subnet id"
}

variable "vpn_gateway_name" {
  description = "The name of the Virtual Network Gateway"
  type        = string
  default     = ""
}

variable "vpn_public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  type        = string
  default     = "Static"
}

variable "vpn_public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = "Standard"
}

variable "gateway_type" {
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute"
  type        = string
  default     = "Vpn"
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased"
  type        = string
  default     = "RouteBased"
}

variable "vpn_gw_sku" {
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments"
  type        = string
  default     = "VpnGw1"
}

variable "enable_active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  type        = bool
  default     = false
}

variable "vpn_gw_generation" {
  description = "The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None"
  type        = string
  default     = "Generation1"
}

variable "availability_zone" {
  description = "the Zones of the Public IP. Accepted values are 1,2,3. Defaults to 1,2,3"
  type        = string
  default     = "Zone-Redundant"
}

variable "aad_audience" {
  description = " The client id of the Azure VPN application"
  type        = string
  default     = null
}

variable "aad_issuer" {
  description = "The STS url for your tenant"
  type        = string
  default     = null
}

variable "aad_tenant" {
  description = "AzureAD Tenant URL"
  type        = string
  default     = null
}

variable "address_space" {
  description = "The address space out of which IP addresses for vpn clients will be taken"
  type        = list(string)
  default     = []
}

variable "vpn_auth_types" {
  description = "Vpn authentication types for the virtual network gateway."
  type        = list(string)
  default     = []
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client"
  type        = list(string)
  default     = []
}
