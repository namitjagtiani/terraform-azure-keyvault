# Azure Keyvault

## Overview

This code deploys a Keyvault and associated parameters that can then be consumed by the Cisco CSR 1000v GETVPN Landing Zone Deployment.

------------
## The Code has the following dependencies

  - Requies a valid Azure Subscription
  - Requires a Service Principal to be created and used 
  > The code does not create a service principal`
  - Requires a local installation of Terraform
  - Requires an optional local installation of Git should you want to commit your code to a version control repo
  - Requires certain input variables. Refer to the `Using the code` section for details.

------------
## The Code deploys the following

   - A Resource Group for the Keyvault
   - A Keyvault
   - A Keyvault Access Policy with `get`, `list` and `set` permissions for `secrets`
   - A bunch of user defined Keyvault Secrets

------------
## Using the code

### Using the code with a Version Control System like Github

- Copy the files to a local folder on your computer. Don't clone the repo
- Create a new repository in your github account. Note the name of the repo.
- Open the Git CLI and change your path to the local folder where you copied the code files on your computer
- Run `git init` from within the folder on your local computer
- Run `git remote -v` to see the remote repository that Git will fetch from and push to
- Run `git remote add origin https://github.com/<name of your account>/<name of your git repo>.git`
- Run `git remote -v` to see the remote repository that Git will fetch from and push to
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
- Raise a `Pull Request`
- After the PR is approved, merge your code to master
- Ideally after a merge to `master` your CICD tool should kick off a pipeline to build your infrastructure

### Using the code without a Version Control System like Github

- Copy the files to a local folder on your computer. You can clone the repo if you want to.
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
- Run `terraform fmt` to ensure the code is linted properly and any interpolation references are correct
- Run `terraform init` so it can initialize the providers and required plugins
- Run `terraform validate` to ensure that the code dependencies are working correctly
- Run `terraform plan --var-file="temp.tfvars"` to do a dry run of the code and see the infrastructure that will be built
- Run `terraform apply --var-file="temp.tfvars` to deploy your infrastructure
  > The apply stage has an approval step where you need to enter `yes` to accept the deployment. 
  > If you want to skip the approval step use `terraform apply --var-file="temp.tfvars" --auto-approve1` instead