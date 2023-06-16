# Infrastructure as Code (IaC) - Mixed Scanning

Simply specify a directory containing IaC files such as Terraform and Dockerfile.

```
$ trivy config ./iac
```
or
```
$ trivy conf --severity HIGH,CRITICAL ./iac
2023-06-16T10:58:07.767+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T10:58:08.671+0100	INFO	Detected config files: 3

Dockerfile (dockerfile)

Tests: 19 (SUCCESSES: 17, FAILURES: 2, EXCEPTIONS: 0)
Failures: 2 (HIGH: 2, CRITICAL: 0)

HIGH: Specify at least 1 USER command in Dockerfile with non-root user as argument
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Running containers with 'root' user can lead to a container escape situation. It is a best practice to run containers as non-root users, which can be done by adding a 'USER' statement to the Dockerfile.

See https://avd.aquasec.com/misconfig/ds002
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


HIGH: '--no-cache' is missed: apk add bash
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
You should use 'apk add' with '--no-cache' to clean package cached data and reduce image size.

See https://avd.aquasec.com/misconfig/ds025
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Dockerfile:3
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   3 [ RUN apk add bash
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



main.tf (terraform)

Tests: 3 (SUCCESSES: 1, FAILURES: 2, EXCEPTIONS: 0)
Failures: 2 (HIGH: 2, CRITICAL: 0)

HIGH: Instance does not require IMDS access to require a token
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

IMDS v2 (Instance Metadata Service) introduced session authentication tokens which improve security when talking to IMDS.
By default <code>aws_instance</code> resource sets IMDS session auth tokens to be optional. 
To fully protect IMDS you need to enable session tokens by using <code>metadata_options</code> block and its <code>http_tokens</code> variable set to <code>required</code>.


See https://avd.aquasec.com/misconfig/avd-aws-0028
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 main.tf:10-13
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  10 ┌ resource "aws_instance" "base" {
  11 │   ami           = "ami-0a8b4cd432b1c3063"
  12 │   instance_type = "t2.micro"
  13 └ }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


HIGH: Root block device is not encrypted.
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Block devices should be encrypted to ensure sensitive data is held securely at rest.

See https://avd.aquasec.com/misconfig/avd-aws-0131
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 main.tf:10-13
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  10 ┌ resource "aws_instance" "base" {
  11 │   ami           = "ami-0a8b4cd432b1c3063"
  12 │   instance_type = "t2.micro"
  13 └ }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```