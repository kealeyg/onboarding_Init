resource "azurerm_storage_account" "storage" {
  name = local.storageName
  provider = azurerm.sub
  resource_group_name = azurerm_resource_group.storage-rg.name
  location = "canadaCentral"
  account_tier = "Standard"
  account_replication_type = "LRS"
  tags = var.globals.tags
}

resource "azurerm_storage_container" "container" {
  name = "tfstate"
  provider = azurerm.sub
  storage_account_name = azurerm_storage_account.storage.name
  container_access_type = "private"
  provisioner "local-exec" {
    command = "setx ARM_ACCESS_KEY ${azurerm_storage_account.storage.primary_access_key}"
  }
}
