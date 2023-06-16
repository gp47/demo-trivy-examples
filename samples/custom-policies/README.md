# Custom Policies

You can write custom policies in [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/). 
Once you finish writing custom policies, 
you can pass the directory where those policies are stored with --policy option.
[More Info](https://aquasecurity.github.io/trivy/v0.27.1/docs/misconfiguration/custom/)

```
trivy conf --policy ./policy --namespaces user ./configs

2023-06-16T09:51:09.019+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T09:51:09.457+0100	INFO	Detected config files: 1

deployment.yaml (kubernetes)

Tests: 142 (SUCCESSES: 128, FAILURES: 14, EXCEPTIONS: 0)
Failures: 14 (UNKNOWN: 0, LOW: 10, MEDIUM: 3, HIGH: 1, CRITICAL: 0)

HIGH: Found deployment 'nginx-deployment' but deployments are not allowed
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Deployments are not allowed because of some reasons.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


MEDIUM: Container 'nginx' of Deployment 'nginx-deployment' should set 'securityContext.allowPrivilegeEscalation' to false
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
A program inside the container can elevate its own privileges and run as root, which might give the program control over the container and node.

See https://avd.aquasec.com/misconfig/ksv001
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 deployment.yaml:18-21
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  18 ┌       - name: nginx
  19 │         image: nginx
  20 │         ports:
  21 └         - containerPort: 80ß
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
...
```
or
```
trivy conf --severity HIGH,CRITICAL --policy ./policy --namespaces user ./configs

2023-06-16T09:52:02.760+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T09:52:03.185+0100	INFO	Detected config files: 1

deployment.yaml (kubernetes)

Tests: 68 (SUCCESSES: 67, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (HIGH: 1, CRITICAL: 0)

HIGH: Found deployment 'nginx-deployment' but deployments are not allowed
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Deployments are not allowed because of some reasons.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```