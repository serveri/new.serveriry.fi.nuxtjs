#!/bin/sh
# Set env var
export PLAYBOOK=$1
# Run playbook
vagrant provision
# Unset env var
export PLAYBOOK=""