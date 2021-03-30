/* Config
------------------------------------------------------------------*/
variable "globals" {}
provider "azurerm" { alias = "sub" }
data "azurerm_client_config" "current" {provider = azurerm.sub}

locals {
  prefix = "${var.globals.env}-${var.globals.group}"
  unique      = substr(sha1(azurerm_resource_group.rg.id), 0, 3)
  storageName = lower(join("", [var.globals.env, "asccm", local.unique, "stg"]))
}

/* Output
------------------------------------------------------------------*/
output "moduleOutput" {
    value = local.storageName
}