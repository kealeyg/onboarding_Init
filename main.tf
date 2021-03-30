/* Config
------------------------------------------------------------------*/
variable "globals" {}
provider "azurerm" { alias = "sub" }
data "azurerm_client_config" "current" {provider = azurerm.sub}