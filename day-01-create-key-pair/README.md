# Day 1 — Create an EC2 Key Pair

## Lab Task

The Nautilus DevOps team is migrating part of its infrastructure to AWS incrementally.

For this lab, create an EC2 key pair with the following requirements:

- Key pair name: `nautilus-kp`
- Key pair type: `RSA`

---

## Solution

### AWS Management Console

1. Open the AWS Management Console.
2. Navigate to the EC2 service.
3. Under **Network & Security**, select **Key Pairs**.
4. Click **Create key pair**.
5. Enter the name:

   `nautilus-kp`

6. Select **RSA** as the key pair type.
7. Select `.pem` as the private key file format.
8. Click **Create key pair**.
9. Verify that the key pair was successfully created.

---

## Verification

The AWS Key Pairs page shows:

- Name: `nautilus-kp`
- Type: `rsa`

The key pair was successfully created.

---

## Security Note

Private key files such as `.pem` files should never be uploaded to GitHub.

Keep your private key secure.
