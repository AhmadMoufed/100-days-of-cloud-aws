#!/usr/bin/env bash

aws ec2 create-key-pair \
  --key-name nautilus-kp \
  --key-type rsa \
  --query 'KeyMaterial' \
  --output text > nautilus-kp.pem

chmod 400 nautilus-kp.pem
