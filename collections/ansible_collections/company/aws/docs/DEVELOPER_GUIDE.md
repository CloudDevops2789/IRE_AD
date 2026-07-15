# Developer Guide

Version: 1.0
Status: Draft
Owner: Yoganand
Last Updated: 2026-07-15

## Purpose

This document provides development guidelines for the Identity Recovery Automation Framework.

The framework is implemented as an Ansible Collection and follows enterprise software engineering practices inspired by Red Hat Ansible Automation Platform collections.

---

# Development Environment

Current Development Environment

- Ubuntu (WSL)
- Ansible Core 2.16+
- Local Active Directory Lab
- Git
- Visual Studio Code

Target Runtime

- Red Hat Ansible Automation Platform (AAP)
- AWS
- AWS Managed Microsoft AD
- Delinea
- ServiceNow

---

# Collection Structure

```
company/aws/

├── docs/
├── playbooks/
├── plugins/
├── roles/
├── README.md
└── galaxy.yml
```

---

# Development Principles

- One role = One responsibility
- Roles must be reusable
- Roles should be idempotent
- Playbooks orchestrate roles
- Never hardcode environment-specific values
- Use variables and defaults
- Protect secrets using `no_log: true`

---

# Coding Standards

- Use Fully Qualified Collection Names (FQCN) where applicable.
- Keep tasks modular.
- Keep `main.yml` as an orchestrator.
- Split large roles into task files.

Example

```
tasks/

main.yml

validate.yml

execute.yml

report.yml
```

---

# Testing

Every role must have an associated test playbook.

No role should be merged without successful validation.

---

# Git Strategy

One commit = One working feature.

Examples

- credential_manager
- directory_connection
- ad_identity_export