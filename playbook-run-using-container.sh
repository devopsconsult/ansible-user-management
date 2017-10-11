#!/bin/bash

DOCKER_CONTAINER_NAME="ansible-role-test"
SSH_PUBLIC_KEY_FILE=ssh/id_rsa.pub
SSH_PUBLIC_KEY=$(cat "$SSH_PUBLIC_KEY_FILE")

sudo docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 -e AUTHORIZED_KEYS="$SSH_PUBLIC_KEY" local/centos7-systemd

ansible-playbook -i hosts play.yml  --vault-password-file ~/.vault_pass.txt --private-key ssh/id_rsa
