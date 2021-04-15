/* Config
------------------------------------------------------------------*/
variable "globals" {}
provider "azurerm" { alias = "sub" }
variable keyvault {}
data "azurerm_client_config" "current" {provider = azurerm.sub}

locals {
  prefix = "${var.globals.env}-${var.globals.group}"
  unique      = substr(sha1(azurerm_resource_group.storage-rg.id), 0, 3)
  storageName = lower(join("", [var.globals.env, var.globals.project, local.unique, "stg"]))
}

/* Output
------------------------------------------------------------------*/
output "moduleOutput" {
    value = {
      storageAccount = azurerm_storage_account.storage.name
      accessKey = azurerm_storage_account.storage.primary_access_key
      containerName = azurerm_storage_container.container.name
    }
}