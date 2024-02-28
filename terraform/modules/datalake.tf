resource "azurerm_storage_account" "example" {
  name                     = "strelprdusea01"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "example" {
  name               = "dlsnavigatorprod"
  storage_account_id = azurerm_storage_account.example.id

  properties = {
    hello = "aGVsbG8="
  }
}