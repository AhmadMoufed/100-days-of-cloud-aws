#!/usr/bin/env bash
# Day 3: Create Subnet
# Replace placeholder values with values from your AWS account.

aws ec2 create-subnet \
  --vpc-id <default-vpc-id> \
  --cidr-block <subnet-cidr-block> \
  --availability-zone <availability-zone> \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=datacenter-subnet}]'
