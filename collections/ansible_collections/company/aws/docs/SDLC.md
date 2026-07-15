# Software Development Lifecycle (SDLC)

Version: 1.0

Status: Active

Owner: Platform Engineering

---

# Purpose

This document defines the Software Development Lifecycle followed for the Identity Recovery Automation Framework.

The framework is developed as an enterprise-grade Ansible Collection following modular engineering principles inspired by Red Hat Ansible Automation Platform.

---

# Development Methodology

The project follows an incremental sprint-based approach.

Each sprint delivers one fully functional role.

The lifecycle for every sprint is:

```
Design

↓

Implement

↓

Unit Test

↓

Integration Test

↓

Peer Review

↓

Git Commit

↓

Next Sprint
```

No new role development begins until the current sprint successfully passes testing.

---

# Engineering Principles

- One role = One responsibility
- Roles are reusable
- Roles are idempotent
- Playbooks orchestrate roles
- Secrets are never hardcoded
- Variables drive implementation
- Enterprise security first
- Test before integration

---

# Sprint Lifecycle

Every sprint must include:

- Design
- Implementation
- Local testing
- Documentation update
- Git commit

---

# Testing Strategy

Every role must provide:

- Local test playbook
- Failure validation
- Success validation
- Idempotency validation

---

# Development Environment

Current

- Ubuntu WSL
- Local Active Directory
- Ansible Core 2.16+

Target

- Red Hat Ansible Automation Platform
- AWS
- AWS Managed Microsoft AD
- Delinea
- ServiceNow

---

# Git Strategy

One commit represents one completed feature.

Example

Sprint 1

credential_manager

Sprint 2

directory_connection

Sprint 3

ad_identity_export

---

# Architecture Freeze

The overall framework architecture is frozen.

Future development focuses on implementation.

Structural changes are only introduced for:

- Security improvements
- Enterprise scalability
- Critical design defects

# Sprint History

## Sprint 1
Status: Completed

Objective:
Establish the Identity Recovery Framework foundation.

Completed:

- Enterprise collection structure
- Role scaffolding
- Credential Manager role
- Enterprise Active Directory lab
- Documentation
- Inventory design
- Test playbooks

Artifacts Produced:

roles/
inventory/
playbooks/
docs/

Exit Criteria:

- Collection builds successfully
- Credential Manager tested
- Enterprise AD lab available
- Ready for Directory Connection development