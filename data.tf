#----------------------------------------------------------------------------#
#                               Data Resources                               #
#----------------------------------------------------------------------------#

# Data definition for obtaining current session details
data "azurerm_client_config" "current" {}

data "http" "my_external_ip" {
  url = "http://ifconfig.co"
}