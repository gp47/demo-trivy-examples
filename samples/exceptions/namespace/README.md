# Namespace-based exceptions

```
$ trivy conf --severity HIGH,CRITICAL --policy ./policy ./configs

2023-06-16T11:51:33.954+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T11:51:34.661+0100	INFO	Detected config files: 2

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
```