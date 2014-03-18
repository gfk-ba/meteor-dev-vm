#!/bin/sh

DEV_DIR=meteor-dev-vm
REPO_DIR=/vagrant/${DEV_DIR}

vagrant ssh-config >vagrant_ssh_config; ssh -F vagrant_ssh_config default -L 3000:localhost:3000 ${REPO_DIR}/tools/vm-meteor-run.sh

