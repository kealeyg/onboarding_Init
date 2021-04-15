/* Create RG
------------------------------------------------------------------*/
resource "azurerm_resource_group" "keyvault-rg" {
    name = join("", [var.globals.env,"-",var.globals.group,"-",var.globals.project,"_","Keyvault","-","rg"])
    location = "canadaCentral"
    provider = azurerm.sub
    tags = var.globals.tags
}
resource "azurerm_resource_group" "storage-rg" {
    name = join("", [var.globals.env,"-",var.globals.group,"-",var.globals.project,"_","Storage","-","rg"])
    location = "canadaCentral"
    provider = azurerm.sub
    tags = var.globals.tags
}

