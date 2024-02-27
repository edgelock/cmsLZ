resource "azurerm_log_analytics_workspace" "law01" {
  name                = "${var.env}-ese-vmi-mainws-log"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}