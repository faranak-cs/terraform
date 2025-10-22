# Terraform templates
Have you ever wanted to know exactly what was deployed to the cloud? Have developed a whole environment in the console and then promptly forgot everything you did to get it setup in the first place and could never recreate it exactly as you did before? Enter Terraform. Using a tool like terraform you get to declare and build your infrastructure against a well documented api in a fast feedback loop environment.
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


