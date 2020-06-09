#----------------------------------------------------------------------------#
#                            Provider Information                            #
#----------------------------------------------------------------------------#

# Create New Resource Group
resource "azurerm_resource_group" "kv_rg" {
  name     = "network-kv-rg"
  location = "australiasoutheast"
}

# Create New KeyVault
resource "azurerm_key_vault" "network_kv" {
  name                        = "network-kv"
  location                    = azurerm_resource_group.kv_rg.location
  resource_group_name         = azurerm_resource_group.kv_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

# Create New Keyvault Access Policy
resource "azurerm_key_vault_access_policy" "network-kv-access-pol" {
  key_vault_id = azurerm_key_vault.network_kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "get", "list", "set",
  ]
}

# Create New Keyvault Secrets
resource "azurerm_key_vault_secret" "test_secret" {
  for_each     = local.secret_map
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.network_kv.id
}