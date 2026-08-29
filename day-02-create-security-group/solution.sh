#!/usr/bin/env bash
# Day 2 — Create Security Group

set -euo pipefail

VPC_ID=$(aws ec2 describe-vpcs   --filters "Name=is-default,Values=true"   --query "Vpcs[0].VpcId"   --output text)

SG_ID=$(aws ec2 create-security-group   --group-name nautilus-sg   --description "Security group for Nautilus App Servers"   --vpc-id "$VPC_ID"   --query "GroupId"   --output text)

aws ec2 authorize-security-group-ingress   --group-id "$SG_ID"   --protocol tcp   --port 80   --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress   --group-id "$SG_ID"   --protocol tcp   --port 22   --cidr 0.0.0.0/0

echo "Security group created: $SG_ID"
