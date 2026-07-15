# IRE_AD
Contains reusable roles for IRE

1.Every application team owns an identity manifest.and This becomes the source of truth.Your Ansible role reads this file and synchronizes only those identities.

application: DocumentIntake

identities:

  users:
    - recoveryadmin1
    - recoveryadmin2

  service_accounts:
    - svc_docintake
    - svc_mysql

  groups:
    - APP_DOCINTAKE_USERS
    - APP_DOCINTAKE_ADMINS
    - Linux_DocIntake


1. Keeping recovery identity data current . This is just an export of approved identities.

Production AD
      │
      │ Every 6 hours
      ▼
Identity Export
      │
      ▼
Immutable S3

2. Applying identities to AWS Managed AD / This should happen during a recovery event, or
after an approved synchronization workflow. This separation gives you an auditable checkpoint.

How do we know what identities each application actually needs?
Simply syncing all users and groups isn't scalable or secure.For organizations with hundreds of applications, there is typically an Application Recovery Catalog.Your recovery workflow uses that catalog to determine what to synchronize.

Recommendation:
build two reusable Ansible roles

Role 1 – Identity Export

Runs in production.

Responsibilities:

Connect to on-prem AD.
Export:
Users
Groups
Memberships
Service accounts
Filter according to the approved application catalog.
Produce versioned JSON.
Upload to immutable S3.

This role only needs read access.

Role 2 – Identity Import
Runs in the IRE.
Responsibilities:
	• Read JSON from S3. 
	• Compare with AWS Managed Microsoft AD. 
	• Create or update: 
		○ Users 
		○ Groups 
		○ Memberships 
		○ Service accounts 
	• Validate authentication. 
This role needs delegated write permissions in AWS Managed AD.


Note:
AWS Managed Microsoft AD works well for:
	• Windows authentication 
	• Domain join 
	• Kerberos 
	• LDAP 
	• Group Policy (within AWS Managed AD) 
	• SQL Server 
	• IIS 
	• File servers
However, if you rely on advanced Active Directory features such as custom schema extensions, complex trust relationships, or domain-wide administrative control, you should confirm that AWS Managed Microsoft AD supports those requirements. Some organizations running highly customized Windows environments choose self-managed AD on EC2 for that reason.

                    Production AD
                         │
        Approved Identity Export (Read-only)
                         │
                  Versioned JSON
                         │
                 Immutable S3 Bucket
                         │
──────────────── Recovery Approved ────────────────
                         │
                  Terraform
                         │
          AWS Managed Microsoft AD
                         │
             Identity Import (AAP)
                         │
         Create Users / Groups / Memberships
                         │
        ┌────────────────┴────────────────┐
        │                                 │
  Join Windows Servers             Join Linux Servers
        │                                 │
  Restore IIS / SQL               Configure SSSD / Apps
        └────────────────┬────────────────┘
                         │
              Application Recovery



