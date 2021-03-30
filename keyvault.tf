
resource "azurerm_key_vault" "kv" {
    name = join("", [var.globals.env,"CSV","-",var.globals.group,"-",var.globals.project,"-","kv"])
    location = "canadaCentral"
    resource_group_name = azurerm_resource_group.rg.name
    enabled_for_disk_encryption = true
    provider = azurerm.sub
    tenant_id = data.azurerm_client_config.current.tenant_id
    purge_protection_enabled = false
    sku_name = "standard"
    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id
        key_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
        ]
        secret_permissions = [
            "Get",
            "List",
            "Set",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "Purge",
        ]
        certificate_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "ManageContacts",
            "ManageIssuers",
            "GetIssuers",
            "ListIssuers",
            "SetIssuers",
            "DeleteIssuers",
        ]
    }
    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = "160a7c45-5bbd-419d-adf5-55babc142021"
        key_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
        ]
        secret_permissions = [
            "Get",
            "List",
            "Set",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "Purge",
        ]
        certificate_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "ManageContacts",
            "ManageIssuers",
            "GetIssuers",
            "ListIssuers",
            "SetIssuers",
            "DeleteIssuers",
        ]
    }
    network_acls {
        default_action = "Allow"
        bypass         = "AzureServices"
    }
    tags = var.globals.tags
}

