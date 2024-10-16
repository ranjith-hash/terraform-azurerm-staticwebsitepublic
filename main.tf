resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "static_storage_account" {
  name                     = "${var.project_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }

  tags = {
    environment = var.project_name
  }
}

