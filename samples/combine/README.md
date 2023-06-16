# Combined input

The ["combine": true flag](https://aquasecurity.github.io/trivy/v0.27.1/docs/misconfiguration/custom/combine/) combines files into one input data structure. It allows you to compare multiple values from different configurations simultaneously.

```
$ trivy conf --severity CRITICAL --policy ./policy --namespaces userß ./configs

2023-06-16T09:36:50.838+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T09:36:51.261+0100	INFO	Detected config files: 1
```
or
```
2023-06-16T09:36:50.838+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T09:36:51.261+0100	INFO	Detected config files: 1
gabor@gabors-MacBook-Pro combine % trivy conf --policy ./policy --namespaces default ./configs 
2023-06-16T09:37:42.075+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T09:37:42.499+0100	INFO	Detected config files: 1

deployment.yaml (kubernetes)

Tests: 141 (SUCCESSES: 128, FAILURES: 13, EXCEPTIONS: 0)
Failures: 13 (UNKNOWN: 0, LOW: 11, MEDIUM: 2, HIGH: 0, CRITICAL: 0)

LOW: Container 'nginx' of Deployment 'nginx-deployment' should add 'ALL' to 'securityContext.capabilities.drop'
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
The container should drop all default capabilities and add only those that are needed for its execution.

See https://avd.aquasec.com/misconfig/ksv003
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 deployment.yaml:18-24
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  18 ┌       - name: nginx
  19 │         image: nginx
  20 │         ports:
  21 │         - containerPort: 80ß
  22 │         securityContext:
  23 │           allowPrivilegeEscalation: false
  24 └           runAsUser: 0
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
...
```
