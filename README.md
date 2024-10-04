# Terraform Cesar Richard EI

## Prérequis

- OVH API Key
- GitHub Token

## OVH DNS Zone

```bash
cd OVH
terraform init
terraform plan -var-file="../secrets.tfvars"
terraform apply -var-file="../secrets.tfvars"
```

## GitHub Repositories

```bash
cd GitHub
terraform init
terraform plan -var-file="../secrets.tfvars"
terraform apply -var-file="../secrets.tfvars"
```
