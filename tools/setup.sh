#!/bin/sh

# Note: Vagrant version used: 1.3.5

BOX_NAME=MeteorF19a
DEV_DIR=meteor-dev-vm

set -e

## Prerequisites for the host:
which vagrant # Vagrant needs to be installed
while ! ls -d ${DEV_DIR}/.git 2>/dev/null && [ $(pwd) != '/' ] ; do cd ..; done
ls -d ${DEV_DIR}/.git # The current directory needs to contain the dev-vm git repo.

## Setup commands:
vagrant box list | grep '^'${BOX_NAME}'\b' || vagrant box add ${BOX_NAME} https://dl.dropboxusercontent.com/u/1251103/fedora-19-vagrant.box --provider virtualbox
vagrant status 2>/dev/null || vagrant init ${BOX_NAME}

REPO_DIR=/vagrant/${DEV_DIR}

vagrant up
vagrant ssh -c ${REPO_DIR}/tools/vm-prerequisites.sh
vagrant ssh -c "${REPO_DIR}/tools/vm-init.sh /home/vagrant/meteor-dev ${REPO_DIR}"

