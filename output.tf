output "website_url" {
  value = azurerm_storage_account.static_storage_account.primary_blob_endpoint
}