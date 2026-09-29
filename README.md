# AWS Platform Foundation

Terraform-based AWS infrastructure foundation demonstrating practical platform engineering and DevOps practices.

## Overview

This project builds a foundational AWS environment using Infrastructure as Code (IaC) with Terraform.

The goal is to demonstrate how cloud infrastructure can be designed, provisioned, and managed in a repeatable and modular way.

## Architecture

The current foundation includes:

* AWS VPC
* DNS support and DNS hostnames
* Environment-specific Terraform configuration
* Reusable Terraform modules
* Terraform state management
* Resource tagging for environment and ownership

### Current Architecture

```text
AWS Account
└── us-east-1
    └── Development Environment
        └── VPC
            └── 10.0.0.0/16
```

## Repository Structure

```text
aws-platform-foundation/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── output.tf
│       └── .terraform.lock.hcl
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   │
│   ├── iam/
│   └── security/
│
├── .gitignore
└── README.md
```

## Platform Engineering Practices Demonstrated

### Infrastructure as Code

Terraform is used to define AWS infrastructure declaratively, allowing infrastructure changes to be reviewed, version-controlled, and reproduced.

### Modular Architecture

Infrastructure components are organized into reusable Terraform modules rather than placing all resources into a single configuration.

### Environment Separation

The repository uses an environment-based structure so additional environments such as staging or production can be introduced without restructuring the entire project.

### Security and Governance

The platform will progressively incorporate IAM controls, security groups, least-privilege access, and standardized resource tagging.

### Validation and Change Management

Infrastructure changes follow a Terraform workflow:

```text
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
```

## Current Status

| Component                 | Status   |
| ------------------------- | -------- |
| Terraform foundation      | Complete |
| AWS VPC                   | Complete |
| Environment structure     | Complete |
| VPC module                | Complete |
| IAM module                | Planned  |
| Security module           | Planned  |
| CI/CD automation          | Planned  |
| Automated security checks | Planned  |

## Cost Considerations

This project is intentionally designed to minimize AWS costs.

The initial foundation does not deploy continuously running compute resources, NAT gateways, databases, or load balancers.

Resources can also be removed after demonstrations using:

```bash
terraform destroy
```

## Roadmap

* [x] Create Terraform project structure
* [x] Configure AWS provider
* [x] Build reusable VPC module
* [x] Deploy development VPC
* [ ] Implement IAM module
* [ ] Implement security controls
* [ ] Add additional networking components
* [ ] Add Terraform CI/CD with GitHub Actions
* [ ] Add automated validation and security scanning
* [ ] Document architecture decisions

## Technologies

* AWS
* Terraform
* Git
* GitHub
* Infrastructure as Code
* Cloud Security
* Platform Engineering
* DevOps
