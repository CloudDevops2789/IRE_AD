# Architecture

Version: 1.0

Status: Active

---

# Overview

The Identity Recovery Automation Framework is implemented as a modular Ansible Collection.

Each role has a single responsibility.

Roles communicate through variables and facts.

---

# Collection Structure

```
company/aws/

docs/

playbooks/

roles/

plugins/

galaxy.yml
```

---

# Role Architecture

```
credential_manager

↓

directory_connection

↓

identity_catalog

↓

ad_identity_export

↓

aws_s3_identity_archive

──────── Recovery ────────

↓

ad_identity_filter

↓

ad_identity_plan

↓

ad_identity_import

↓

identity_validation

↓

identity_secrets

↓

windows_domain_validation

↓

linux_domain_validation

↓

ad_identity_report
```

---

# Role Responsibilities

credential_manager

Obtains credentials.

directory_connection

Validates connectivity.

identity_catalog

Defines recovery scope.

ad_identity_export

Exports directory objects.

aws_s3_identity_archive

Archives exports.

ad_identity_filter

Filters required identities.

ad_identity_plan

Compares desired state.

ad_identity_import

Creates and updates identities.

identity_validation

Validates imported identities.

identity_secrets

Handles passwords and secrets.

windows_domain_validation

Validates Windows workloads.

linux_domain_validation

Validates Linux workloads.

ad_identity_report

Produces recovery reports.

---

# Design Principles

- Modular
- Idempotent
- Reusable
- Inventory driven
- Cloud agnostic
- Security first

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Current Architecture

credential_manager
        │
        ▼
directory_connection (Sprint 2)
        │
        ▼
identity_catalog
        │
        ▼
ad_identity_export
        │
        ▼
ad_identity_filter
        │
        ▼
aws_s3_identity_archive
        │
        ▼
ad_identity_plan
        │
        ▼
ad_identity_import
        │
        ▼
identity_validation
        │
        ▼
ad_identity_report

# Current State

Sprint 1 Completed

Implemented

credential_manager

Planned

directory_connection
identity_catalog
ad_identity_export
...