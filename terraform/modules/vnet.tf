

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_subnet" "subnets" {
  for_each                                      = var.subnets
  name                                          = each.key
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.virtual_network.name
  address_prefixes                              = each.value["subnet_range"]
  service_endpoints                             = each.value["service_endpoints"]
  service_endpoint_policy_ids                   = each.value["service_endpoint_policy_ids"]

  dynamic "delegation" {
    for_each = each.value["delegation_name"] != null ? [1] : []
    content {
      name = "delegation"
      service_delegation {
        name    = each.value["delegation_name"]
        actions = each.value["delegation_actions"]
      }
    }
  }
}

