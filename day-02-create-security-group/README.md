# Day 2 — Create Security Group

## Lab Task

The Nautilus DevOps team is migrating a portion of its infrastructure to AWS incrementally. For this task, create a security group under the default VPC with the following requirements:

- **Security group name:** `nautilus-sg`
- **Description:** `Security group for Nautilus App Servers`
- **Inbound rule 1:** HTTP / TCP / Port `80` / Source `0.0.0.0/0`
- **Inbound rule 2:** SSH / TCP / Port `22` / Source `0.0.0.0/0`

## Solution — AWS Management Console

1. Open the AWS Management Console.
2. Navigate to **VPC** or **EC2** and open **Security Groups**.
3. Click **Create security group**.
4. Enter the security group name: `nautilus-sg`.
5. Enter the description: `Security group for Nautilus App Servers`.
6. Select the **default VPC**.
7. Under **Inbound rules**, add an **HTTP** rule:
   - Protocol: TCP
   - Port: 80
   - Source: `0.0.0.0/0`
8. Add an **SSH** rule:
   - Protocol: TCP
   - Port: 22
   - Source: `0.0.0.0/0`
9. Click **Create security group**.
10. Verify that the security group was created successfully and that both inbound rules are present.

## Verification

The AWS console confirms successful creation of the security group:

- Name: `nautilus-sg`
- Description: `Security group for Nautilus App Servers`
- Inbound rules:
  - HTTP / TCP / 80 / `0.0.0.0/0`
  - SSH / TCP / 22 / `0.0.0.0/0`

## AWS CLI Alternative

```bash
# Get the default VPC ID
VPC_ID=$(aws ec2 describe-vpcs   --filters "Name=is-default,Values=true"   --query "Vpcs[0].VpcId"   --output text)

# Create the security group
SG_ID=$(aws ec2 create-security-group   --group-name nautilus-sg   --description "Security group for Nautilus App Servers"   --vpc-id "$VPC_ID"   --query "GroupId"   --output text)

# Allow HTTP
aws ec2 authorize-security-group-ingress   --group-id "$SG_ID"   --protocol tcp   --port 80   --cidr 0.0.0.0/0

# Allow SSH
aws ec2 authorize-security-group-ingress   --group-id "$SG_ID"   --protocol tcp   --port 22   --cidr 0.0.0.0/0
```

## Security Note

Opening SSH (`22`) to `0.0.0.0/0` allows connections from any IPv4 address. This was required for the lab, but in production SSH access should normally be restricted to trusted IP addresses or accessed through safer mechanisms such as AWS Systems Manager.
