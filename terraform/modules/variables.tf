#------------------------------------------------------------------------------------------- 
# Shared variables
#------------------------------------------------------------------------------------------- 
variable "location" {
  description = "Region in which to deploy these resources"
  type        = string
}

variable "resource_group_name" {
  type = string
  description = "Name of the Resource Group"
}

#------------------------------------------------------------------------------------------- 
# VNET variables
#------------------------------------------------------------------------------------------- 
variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
 type = list(any)
}

variable "subnets" {
  type = map(object({
    subnet_range                                  = list(string)
    service_endpoints                             = list(string)
    service_endpoint_policy_ids                   = list(string)
    delegation_name                               = string
    delegation_actions                            = list(string)
    has_route_table                               = bool
    has_nsg                                       = bool
    rt_name                                       = string
  }))
  description = "Complex String of Subnet Properties to create"

  validation {
    #Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
    condition     = can([for subnet in var.subnets : [for range in subnet["subnet_range"] : cidrnetmask(range)]])
    error_message = "This needs to be a valid ipv4."
  }
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    Environment     = "dev",
    CreatedBy = "jcharles@3cloudsolutions.com"
    Project = "vmi"
    Owner = "integrations"
    Team = "vmi"
  }
}


variable "env" {
  description = "The prefix used for all resources in this plan"
  default     = "dev"
}
