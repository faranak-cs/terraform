# Terraform templates
.tf files
## Steps
- Scope
- Author
- Providers
- Plan (testing)
- Apply
## Commands
### Initiate
```
terraform init
```
### Plan
```
terraform plan
```
### Apply
```
terraform apply
```
### Destroy
```
terraform destroy
```
## Useful links
- Create a cloud storage bucket that would serve as the backend storage for Terraform state files
  - Follow the guide: [Terraform GCS Backend](https://developer.hashicorp.com/terraform/language/backend/gcs)
  - Ensure the following configurations:
    - Enable object versioning
    - Enable bucket encryption


