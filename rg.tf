/* Create RG
------------------------------------------------------------------*/
resource "azurerm_resource_group" "rg" {
    name     = join("", [var.globals.env,"-",var.globals.group,"-",var.globals.project,"_test","-","rg"])
    location = "canadaCentral"
    provider = azurerm.sub
    tags = var.globals.tags
}