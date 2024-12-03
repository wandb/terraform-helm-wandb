#!/bin/bash
set -e

echo "Starting Terraform state migration..."

# Function to check if a resource exists in terraform state
check_resource() {
    terraform state list | grep -q "$1" && return 0 || return 1
}

# Function to migrate a single resource
migrate_resource() {
    local OLD_RESOURCE="$1"
    local NEW_RESOURCE="$2"
    
    if check_resource "$OLD_RESOURCE"; then
        echo "Migrating ${OLD_RESOURCE} to ${NEW_RESOURCE}"
        terraform state mv -lock=false "$OLD_RESOURCE" "$NEW_RESOURCE" || {
            echo "Failed to migrate ${OLD_RESOURCE}"
            return 1
        }
    else
        echo "Resource ${OLD_RESOURCE} not found in state, skipping..."
    fi
}

# Backup the current state
echo "Creating state backup..."
terraform state pull > terraform.tfstate.backup.$(date +%Y%m%d-%H%M%S)

# Migrate each resource
echo "Migrating resources..."

# Find all helm_release resources and migrate them
terraform state list | grep "helm_release" | while read -r resource; do
    # Skip if resource already has count index
    if [[ "$resource" != *"[0]"* ]]; then
        migrate_resource "$resource" "${resource}[0]"
    fi
done

echo "Migration completed!"
echo "Please review the state and run 'terraform plan' to verify the migration" 