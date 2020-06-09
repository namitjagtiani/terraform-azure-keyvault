#----------------------------------------------------------------------------#
#                            Variable Definitions                            #
#----------------------------------------------------------------------------#

variable "client_secret" {} # Client Secret for Prod Service Principal
variable "client_id" {} # Client ID for Prod Service Principal
variable "subscription_id" {} # Subscription ID for Prod Service Principal
variable "tenant_id" {} # Tenant ID for Prod Service Principal

variable "rtr-username" {} # Cisco CSR Router Username
variable "aus-gm-rtr1-secret" {} # Cisco CSR AUS Group Member 1 Router Password
variable "aus-gm-rtr2-secret" {} # Cisco CSR AUS Group Member 2 Router Password
variable "aus-ks-rtr-secret" {} # Cisco CSR AUS Key Server Router Password
variable "aue-gm-rtr1-secret" {} # Cisco CSR AUE Group Member 1 Router Password
variable "aue-gm-rtr2-secret" {} # Cisco CSR AUE Group Member 2 Router Password
variable "aue-ks-rtr-secret" {} # Cisco CSR AUE Key Server Router Password
variable "auc-gm-rtr-secret" {} # Cisco CSR AUC Group Member Router Password