#------------------------------------------------------------------------------------------- 
# Shared
#------------------------------------------------------------------------------------------- 
location = "eastus"

# resource_group_name = "dev-ese-vmi-main-rg"
foundation_resource_group_name = "dev-ese-vmi-main-rg"

#------------------------------------------------------------------------------------------- 
# VNET
#------------------------------------------------------------------------------------------- 
vnet_address_space = ["10.10.0.0/16"]

vnet_name =  "dev-ese-vmi-apim-vnet"

dns_servers = []

subnets = {  
  "dev-ese-vmi-apim-sn" = {
    subnet_range                                  = ["10.10.1.0/24"]
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
"dev-ese-vmi-appgw-snt" = {
    subnet_range                                  = ["10.10.2.0/24"]
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