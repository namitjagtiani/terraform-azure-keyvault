resource "azurerm_key_vault_secret" "test_secret" {
  for_each     = local.secret_map
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.network_kv.id
}