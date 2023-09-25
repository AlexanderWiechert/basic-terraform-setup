# Basic Terraform Setup

## multi account Setup

### backend Konfiguration
Im Ordner Backends liegen die Dateien, die für die Konfiguration der AWS Accounts (stages) zuständig sind. 
Am besten gibt man diesen "sprechende" Namen, die auch tatsächlich verwendet werden. 

https://www.terraform.io/language/settings/backends/s3

### Workspace
Terraform Workspaces können perfekt dazu genutzt werden um die Stages zu separieren. Näheres dazu in der Doku. 
Wir können den Workspace u.a. dazu nutzen um die passende Konfiguration auszuwählen.

https://www.terraform.io/language/state/workspaces

Typischerweise erfolg ein start von terraform dann so
```
terraform init --backend-config=backends/dev.tfbackend
terraform workspace new dev
if [ $? -ne 0 ]; then
    terraform workspace select dev
fi
terraform apply -var-file=vars/$(terraform workspace show).tfvars
```

## Einstieg ins Projekt
Typischer Einstieg in eine "Terraform only" Projekt ist die **main.tf** Datei. 
Dort können die Provider, Backends und Module konfiguriert werden.