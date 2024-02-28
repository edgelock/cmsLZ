#------------------------------------------------------------------------------------------- 
# Shared
#------------------------------------------------------------------------------------------- 
location = "eastus"

# resource_group_name = "dev-ese-vmi-main-rg"
resource_group_name = "jcharlestf-rg"

#------------------------------------------------------------------------------------------- 
# VNET
#------------------------------------------------------------------------------------------- 
vnet_address_space = ["10.100.8.0/21"]

vnet_name =  "inv-prod-uan-vnet"

# dns_servers = []

subnets = {  
  "inv-prod-uan-snet001" = {
    subnet_range                                  = ["10.100.8.0/24"]
    service_endpoints                             = null
    delegation_name                               = null
    delegation_actions                            = null
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoint_policy_ids                   = null
    has_nsg                                       = true
    has_route_table                               = true
    rt_name                                       = null
  },
"inv-prod-uan-snet002" = {
    subnet_range                                  = ["10.100.9.0/24"]
    service_endpoints                             = null
    delegation_name                               = null
    delegation_actions                            = null
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoint_policy_ids                   = null
    has_nsg                                       = true
    has_route_table                               = true
    rt_name                                       = null
  },
  "inv-prod-uan-snet003" = {
    subnet_range                                  = ["10.100.10.0/24"]
    service_endpoints                             = null
    delegation_name                               = null
    delegation_actions                            = null
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoint_policy_ids                   = null
    has_nsg                                       = true
    has_route_table                               = true
    rt_name                                       = null
  },
    "inv-prod-uan-snet004" = {
    subnet_range                                  = ["10.100.11.0/24"]
    service_endpoints                             = null
    delegation_name                               = null
    delegation_actions                            = null
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoint_policy_ids                   = null
    has_nsg                                       = true
    has_route_table                               = true
    rt_name                                       = null
  }
}