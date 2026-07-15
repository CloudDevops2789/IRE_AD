#!/bin/bash

set -e

NAMESPACE="company"
COLLECTION="aws"
ROOT="collections/ansible_collections/${NAMESPACE}/${COLLECTION}"

ROLES=(
ad_identity_export
ad_identity_filter
ad_identity_manifest
ad_identity_plan
ad_identity_import
ad_identity_password
ad_identity_validation
ad_identity_report
aws_managed_ad_connection
aws_s3_identity_archive
linux_domain_validation
windows_domain_validation
)

mkdir -p "$ROOT"
mkdir -p "$ROOT/playbooks"

cd "$ROOT"

for ROLE in "${ROLES[@]}"
do
    ansible-galaxy role init "roles/${ROLE}" --force
done