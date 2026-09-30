# AWS Platform Foundation

A modular Terraform-based AWS platform foundation designed to demonstrate core Platform Engineering and AWS DevOps practices, including infrastructure as code, environment separation, least-privilege IAM, secure object storage, and reusable Terraform modules.

The project is intentionally designed as a low-cost development platform that can serve as a foundation for future Kubernetes, CI/CD, observability, and developer-experience capabilities.

---

## Architecture

The current platform establishes four foundational capabilities:

* **Networking** — AWS VPC with DNS support and hostnames enabled
* **Identity & Access Management** — IAM role and least-privilege S3 access policy
* **Storage** — Versioned and server-side encrypted S3 bucket
* **Security** — S3 public access protection

### High-Level Architecture

```text
                         AWS Account
                              |
                              v
                    +-------------------+
                    |  Dev Environment  |
                    |     Terraform     |
                    +---------+---------+
                              |
             +----------------+----------------+
             |                |                |
             v                v                v
      +-------------+   +-----------+   +-------------+
      |     VPC     |   |    IAM    |   |     S3      |
      | 10.0.0.0/16 |   | Platform  |   |   Storage   |
      +-------------+   |    Role   |   +------+------+
                         +-----+-----+          |
                               |                |
                               |          +-----+------+
                               |          |  Security  |
                               |          |   Public   |
                               |          |   Access   |
                               |          |    Block   |
                               |          +------------+
                               |
                         Least-Privilege
                           S3 Access
```

---

## Repository Structure

The repository separates environment configuration from reusable Terraform modules.

```text
aws-platform-foundation/
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   │
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   │
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   │
│   └── storage/
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
│
├── .gitignore
└── README.md
```

The `environments/dev` directory is responsible for composing the infrastructure modules, while the `modules` directory contains reusable infrastructure components.

This structure provides a foundation for introducing additional environments such as staging or production without duplicating the underlying infrastructure logic.

---

## Platform Engineering Practices Demonstrated
### Environment Separation

The current project uses a dedicated development environment:

```text
environments/
└── dev/
```

---

### Least-Privilege Access

IAM permissions are intentionally scoped to the platform's intended S3 workload.

The platform role receives:

- `s3:ListBucket` on the S3 bucket
- `s3:GetObject` on objects within the bucket

The policy does not grant:

- S3 write access
- S3 delete access
- Broad S3 administrative permissions

This demonstrates a least-privilege approach to workload permissions.

---

## Security Design

Security controls are incorporated directly into the infrastructure definition rather than being treated as a separate implementation step.

### S3 Encryption

The S3 bucket uses server-side encryption with:

```text
AES256

---

## Environment Design

The project currently contains a dedicated development environment:

```text
environments/
└── dev/

---

## Cost-Conscious Architecture

A primary design consideration for this project is demonstrating AWS Platform Engineering practices without creating unnecessary ongoing cloud costs.

The current foundation intentionally avoids always-running or higher-cost services such as:

- EC2 instances
- NAT Gateways
- RDS databases
- Load Balancers
- EKS clusters

The current architecture primarily uses:

- Amazon VPC
- AWS IAM
- Amazon S3

These services provide the foundational capabilities needed for the current platform while keeping the development environment lightweight.

Future projects will introduce additional AWS services selectively, with explicit consideration for resource lifecycle, usage, and cost.

---

## Deployment

From the development environment:

```bash
cd environments/dev

---

## Validation

The infrastructure was validated through Terraform's standard workflow:

```text
terraform init
        |
        v
terraform validate
        |
        v
terraform plan
        |
        v
terraform apply
        |
        v
terraform state list
        |
        v
terraform output
The resulting Terraform state tracks the AWS resources managed by the project and provides Terraform with the resource information required to evaluate future infrastructure changes.
---

## Current Platform Capabilities

| Capability | Implementation |
|---|---|
| Infrastructure as Code | Terraform |
| Environment Separation | `environments/dev` |
| Networking | Amazon VPC |
| Identity | AWS IAM |
| Least-Privilege Access | Scoped S3 IAM policy |
| Object Storage | Amazon S3 |
| Encryption at Rest | S3 SSE-S3 / AES256 |
| Data Protection | S3 Versioning |
| Public Access Protection | S3 Public Access Block |
| Source Control | Git / GitHub |

---

## Roadmap

This repository represents the foundation of a broader Platform Engineering portfolio.

### Phase 1 — Platform Foundation

- [x] Terraform project structure
- [x] AWS VPC
- [x] IAM role
- [x] Least-privilege IAM policy
- [x] S3 storage
- [x] S3 versioning
- [x] S3 encryption
- [x] S3 public access protection

### Phase 2 — Kubernetes Platform

- [ ] Amazon EKS
- [ ] Terraform-based cluster provisioning
- [ ] Kubernetes namespaces
- [ ] Helm
- [ ] Ingress
- [ ] ConfigMaps and Secrets
- [ ] Autoscaling

### Phase 3 — CI/CD Platform

- [ ] GitHub Actions
- [ ] Container image builds
- [ ] Automated testing
- [ ] Terraform validation
- [ ] Infrastructure deployment automation
- [ ] Security scanning
- [ ] Deployment smoke tests

### Phase 4 — Observability & Reliability

- [ ] CloudWatch
- [ ] Application metrics
- [ ] Prometheus
- [ ] Grafana
- [ ] Logging
- [ ] Alerting
- [ ] Reliability-focused dashboards

### Phase 5 — Developer Experience

- [ ] Golden-path deployment workflow
- [ ] Reusable GitHub Actions
- [ ] Standardized service templates
- [ ] Developer onboarding documentation
- [ ] Self-service deployment patterns

---

## Technologies

- AWS
- Terraform
- Git
- GitHub
- IAM
- Amazon VPC
- Amazon S3
- Infrastructure as Code
- Platform Engineering
- DevOps
