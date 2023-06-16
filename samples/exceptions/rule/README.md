# Rule-based exceptions

```
$ trivy conf --severity HIGH,CRITICAL ./configs

2023-06-16T11:58:02.228+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T11:58:02.736+0100	INFO	Detected config files: 2

deployment-allow.yaml (kubernetes)

Tests: 67 (SUCCESSES: 66, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (HIGH: 1, CRITICAL: 0)

HIGH: Deployment 'test-allow' should not specify '/var/run/docker.socker' in 'spec.template.volumes.hostPath.path'
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Mounting docker.sock from the host can give the container full root access to the host.

See https://avd.aquasec.com/misconfig/ksv006
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 deployment-allow.yaml:8-31
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   8 ┌   replicas: 3
   9 │   selector:
  10 │     matchLabels:
  11 │       app: hello-kubernetes
  12 │   template:
  13 │     metadata:
  14 │       labels:
  15 │         app: hello-kubernetes
  16 └     spec:
  ..   
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



deployment-deny.yaml (kubernetes)

Tests: 67 (SUCCESSES: 66, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (HIGH: 1, CRITICAL: 0)

HIGH: Deployment 'test-deny' should not specify '/var/run/docker.socker' in 'spec.template.volumes.hostPath.path'
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
Mounting docker.sock from the host can give the container full root access to the host.

See https://avd.aquasec.com/misconfig/ksv006
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 deployment-deny.yaml:6-29
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   6 ┌   replicas: 3
   7 │   selector:
   8 │     matchLabels:
   9 │       app: hello-kubernetes
  10 │   template:
  11 │     metadata:
  12 │       labels:
  13 │         app: hello-kubernetes
  14 └     spec:
  ..   
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```