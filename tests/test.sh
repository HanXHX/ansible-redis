#!/bin/sh

# Thanks to https://servercheck.in/blog/testing-ansible-roles-travis-ci-github

DIR=$( dirname $0 )
INVENTORY_FILE="$DIR/inventory"
PLAYBOOK="$DIR/test.yml"

set -ev

# Check syntax
ansible-playbook -i $INVENTORY_FILE -c local --syntax-check -vv $PLAYBOOK

# Check role
ansible-playbook -i $INVENTORY_FILE -c local --sudo -vv $PLAYBOOK

# Check Redis accepts connections
nc -vz localhost 6379 2>&1 \
| grep -q 'succeeded' \
&& (echo 'Redis UP' && exit 0) \
|| (echo 'Redis DOWN' && exit 1)

# Check indempotence
ansible-playbook -i $INVENTORY_FILE -c local --sudo -vv $PLAYBOOK \
| grep -q 'changed=0.*failed=0' \
&& (echo 'Idempotence test: pass' && exit 0) \
|| (echo 'Idempotence test: fail' && exit 1)
