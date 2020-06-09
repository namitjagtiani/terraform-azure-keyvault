# Azure Keyvault

## Overview

This code deploys a Keyvault and associated parameters that can then be consumed by the Cisco CSR 1000v GETVPN Landing Zone Deployment.

------------
## The Code has the following dependencies

  - Requies a valid Azure Subscription
  - Requires a Service Principal to be created and used 
  > The code does not create a service principal`
  - Requires a local installation of Terraform
  - Requires certain input variables. Refer to the `Using the code` section for details.

------------
## The Code deploys the following

   - A Resource Group for the Keyvault
   - A Keyvault
   - A Keyvault Access Policy with `get`, `list` and `set` permissions for `secrets`
   - A bunch of user defined Keyvault Secrets

------------
## Using the code

- Copy the files to a local folder on your computer. Don't clone the repo
- Run `git init` on your local computer
- Create a new repository in your github account
- Run `git remote add origin https://github.com/<name of your account>/<name of your git repo>.git`
- Create a local feature branch
- Create a `temp.tfvars` file to feed the required variables.
- Define the below variables and replace the values with your tenancy variables and relevant secrets.
  + > subscription details
  + `client_id       = "00000000-0000-0000-0000-000000000000"`
  + `client_secret   = "00000000-0000-0000-0000-000000000000"`
  + `subscription_id = "00000000-0000-0000-0000-000000000000"`
  + `tenant_id       = "00000000-0000-0000-0000-000000000000"`
  + > secrets
  + `rtr-username       = "abcdefgh"`
  + `aus-gm-rtr1-secret = "abcdefgh"`
  + `aus-gm-rtr2-secret = "abcdefgh"`
  + `aus-ks-rtr-secret  = "abcdefgh"`
  + `aue-gm-rtr1-secret = "abcdefgh"`
  + `aue-gm-rtr2-secret = "abcdefgh"`
  + `aue-ks-rtr-secret  = "abcdefgh"`
  + `auc-gm-rtr-secret  = "abcdefgh"`
- Run the following commands
  + Add the files for tracking `git add .`
  + Commit the files `git commit -m "commit message"`
  + Push the files to your remote repo `git push`