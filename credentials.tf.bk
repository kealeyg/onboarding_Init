variable keyvault {}

resource "azurerm_key_vault_secret" "tfstate" {
    name = "tfstate-access-key"
    value = var.keyvault.tfstate
    key_vault_id = azurerm_key_vault.kv.id
    provider = azurerm.sub
}

resource "azurerm_key_vault_secret" "user" {
    name = join("", [var.globals.env,"-",var.globals.project,"-","deploy","-","admin"])
    value = var.keyvault.user
    key_vault_id = azurerm_key_vault.kv.id
    provider = azurerm.sub
}

resource "azurerm_key_vault_secret" "pwd" {
    name = join("", [var.globals.env,"-",var.globals.project,"-","deploy","-","admin","-","pwd"])
    value = var.keyvault.pwd
    key_vault_id = azurerm_key_vault.kv.id
    provider = azurerm.sub
}