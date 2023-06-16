# Debugging

When working on more complex queries (or when learning Rego), it's useful to see exactly how the policy is applied. 
For this purpose you can use the --trace flag. 
This will output a large trace from Open Policy Agent like the following:

```
$ trivy conf --trace configs/

2023-06-16T12:03:40.652+0100	INFO	Misconfiguration scanning is enabled
2023-06-16T12:03:40.947+0100	INFO	Detected config files: 1

Dockerfile (dockerfile)

Tests: 26 (SUCCESSES: 23, FAILURES: 3, EXCEPTIONS: 0)
Failures: 3 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 2, CRITICAL: 0)

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


LOW: Add HEALTHCHECK instruction in your Dockerfile
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
You should add HEALTHCHECK instruction in your docker container images to perform the health check on running containers.

See https://avd.aquasec.com/misconfig/ds026
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



ID: DS002
File: Dockerfile
Namespace: builtin.dockerfile.DS002
Query: data.builtin.dockerfile.DS002.deny
Message: Specify at least 1 USER command in Dockerfile with non-root user as argument
TRACE Enter data.builtin.dockerfile.DS002.deny = _
TRACE | Eval data.builtin.dockerfile.DS002.deny = _
TRACE | Index data.builtin.dockerfile.DS002.deny (matched 2 rules)
TRACE | Enter data.builtin.dockerfile.DS002.deny
TRACE | | Eval data.builtin.dockerfile.DS002.fail_user_count
TRACE | | Index data.builtin.dockerfile.DS002.fail_user_count (matched 1 rule, early exit)
TRACE | | Enter data.builtin.dockerfile.DS002.fail_user_count
TRACE | | | Eval __local1706__ = data.builtin.dockerfile.DS002.get_user
TRACE | | | Index data.builtin.dockerfile.DS002.get_user (matched 1 rule)
TRACE | | | Enter data.builtin.dockerfile.DS002.get_user
TRACE | | | | Eval user = data.lib.docker.user[_]
TRACE | | | | Index data.lib.docker.user (matched 1 rule)
TRACE | | | | Enter data.lib.docker.user
TRACE | | | | | Eval instruction = input.Stages[_].Commands[_]
TRACE | | | | | Eval instruction.Cmd = "user"
TRACE | | | | | Fail instruction.Cmd = "user"
TRACE | | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | | | Eval instruction.Cmd = "user"
TRACE | | | | | Fail instruction.Cmd = "user"
TRACE | | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | | | Eval instruction.Cmd = "user"
TRACE | | | | | Fail instruction.Cmd = "user"
TRACE | | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | | Fail user = data.lib.docker.user[_]
TRACE | | | Eval count(__local1706__, __local1177__)
TRACE | | | Eval lt(__local1177__, 1)
TRACE | | | Exit data.builtin.dockerfile.DS002.fail_user_count early
TRACE | | Eval msg = "Specify at least 1 USER command in Dockerfile with non-root user as argument"
TRACE | | Eval result.new(msg, {}, __local1182__)
TRACE | | Eval res = __local1182__
TRACE | | Exit data.builtin.dockerfile.DS002.deny
TRACE | Redo data.builtin.dockerfile.DS002.deny
TRACE | | Redo res = __local1182__
TRACE | | Redo result.new(msg, {}, __local1182__)
TRACE | | Redo msg = "Specify at least 1 USER command in Dockerfile with non-root user as argument"
TRACE | | Redo data.builtin.dockerfile.DS002.fail_user_count
TRACE | | Redo data.builtin.dockerfile.DS002.fail_user_count
TRACE | | | Redo lt(__local1177__, 1)
TRACE | | | Redo count(__local1706__, __local1177__)
TRACE | | | Redo __local1706__ = data.builtin.dockerfile.DS002.get_user
TRACE | Enter data.builtin.dockerfile.DS002.deny
TRACE | | Eval cmd = data.builtin.dockerfile.DS002.fail_last_user_root[_]
TRACE | | Index data.builtin.dockerfile.DS002.fail_last_user_root (matched 2 rules)
TRACE | | Enter data.builtin.dockerfile.DS002.fail_last_user_root
TRACE | | | Eval users = [user | user = data.lib.docker.user[_]; true]
TRACE | | | Enter user = data.lib.docker.user[_]; true
TRACE | | | | Eval user = data.lib.docker.user[_]
TRACE | | | | Index data.lib.docker.user (matched 1 rule)
TRACE | | | | Fail user = data.lib.docker.user[_]
TRACE | | | Eval count(users, __local1178__)
TRACE | | | Eval minus(__local1178__, 1, __local1179__)
TRACE | | | Eval lastUser = users[__local1179__]
TRACE | | | Fail lastUser = users[__local1179__]
TRACE | | | Redo minus(__local1178__, 1, __local1179__)
TRACE | | | Redo count(users, __local1178__)
TRACE | | | Redo users = [user | user = data.lib.docker.user[_]; true]
TRACE | | Enter data.builtin.dockerfile.DS002.fail_last_user_root
TRACE | | | Eval users = [user | user = data.lib.docker.user[_]; true]
TRACE | | | Enter user = data.lib.docker.user[_]; true
TRACE | | | | Eval user = data.lib.docker.user[_]
TRACE | | | | Index data.lib.docker.user (matched 1 rule)
TRACE | | | | Fail user = data.lib.docker.user[_]
TRACE | | | Eval count(users, __local1180__)
TRACE | | | Eval minus(__local1180__, 1, __local1181__)
TRACE | | | Eval lastUser = users[__local1181__]
TRACE | | | Fail lastUser = users[__local1181__]
TRACE | | | Redo minus(__local1180__, 1, __local1181__)
TRACE | | | Redo count(users, __local1180__)
TRACE | | | Redo users = [user | user = data.lib.docker.user[_]; true]
TRACE | | Fail cmd = data.builtin.dockerfile.DS002.fail_last_user_root[_]
TRACE | Exit data.builtin.dockerfile.DS002.deny = _
TRACE Redo data.builtin.dockerfile.DS002.deny = _
TRACE | Redo data.builtin.dockerfile.DS002.deny = _
TRACE 


ID: DS025
File: Dockerfile
Namespace: builtin.dockerfile.DS025
Query: data.builtin.dockerfile.DS025.deny
Message: '--no-cache' is missed: apk add bash
TRACE Enter data.builtin.dockerfile.DS025.deny = _
TRACE | Eval data.builtin.dockerfile.DS025.deny = _
TRACE | Index data.builtin.dockerfile.DS025.deny (matched 1 rule)
TRACE | Enter data.builtin.dockerfile.DS025.deny
TRACE | | Eval output = data.builtin.dockerfile.DS025.get_apk[_]
TRACE | | Index data.builtin.dockerfile.DS025.get_apk (matched 1 rule)
TRACE | | Enter data.builtin.dockerfile.DS025.get_apk
TRACE | | | Eval run = data.lib.docker.run[_]
TRACE | | | Index data.lib.docker.run (matched 1 rule)
TRACE | | | Enter data.lib.docker.run
TRACE | | | | Eval instruction = input.Stages[_].Commands[_]
TRACE | | | | Eval instruction.Cmd = "run"
TRACE | | | | Fail instruction.Cmd = "run"
TRACE | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | | Eval instruction.Cmd = "run"
TRACE | | | | Exit data.lib.docker.run
TRACE | | | Redo data.lib.docker.run
TRACE | | | | Redo instruction.Cmd = "run"
TRACE | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | | Eval instruction.Cmd = "run"
TRACE | | | | Fail instruction.Cmd = "run"
TRACE | | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | Eval arg = run.Value[0]
TRACE | | | Eval regex.match("apk (-[a-zA-Z]+\\s*)*add", arg)
TRACE | | | Eval not data.builtin.dockerfile.DS025.contains_no_cache(arg)
TRACE | | | Enter data.builtin.dockerfile.DS025.contains_no_cache(arg)
TRACE | | | | Eval data.builtin.dockerfile.DS025.contains_no_cache(arg)
TRACE | | | | Index data.builtin.dockerfile.DS025.contains_no_cache (matched 1 rule, early exit)
TRACE | | | | Enter data.builtin.dockerfile.DS025.contains_no_cache
TRACE | | | | | Eval split(cmd, " ", __local1145__)
TRACE | | | | | Eval __local1145__[_] = "--no-cache"
TRACE | | | | | Fail __local1145__[_] = "--no-cache"
TRACE | | | | | Redo split(cmd, " ", __local1145__)
TRACE | | | | Fail data.builtin.dockerfile.DS025.contains_no_cache(arg)
TRACE | | | Eval output = {"arg": arg, "cmd": run}
TRACE | | | Exit data.builtin.dockerfile.DS025.get_apk
TRACE | | Redo data.builtin.dockerfile.DS025.get_apk
TRACE | | | Redo output = {"arg": arg, "cmd": run}
TRACE | | | Redo regex.match("apk (-[a-zA-Z]+\\s*)*add", arg)
TRACE | | | Redo arg = run.Value[0]
TRACE | | | Redo run = data.lib.docker.run[_]
TRACE | | Eval __local1684__ = output.arg
TRACE | | Eval sprintf("'--no-cache' is missed: %s", [__local1684__], __local1143__)
TRACE | | Eval msg = __local1143__
TRACE | | Eval __local1685__ = output.cmd
TRACE | | Eval result.new(msg, __local1685__, __local1144__)
TRACE | | Eval res = __local1144__
TRACE | | Exit data.builtin.dockerfile.DS025.deny
TRACE | Redo data.builtin.dockerfile.DS025.deny
TRACE | | Redo res = __local1144__
TRACE | | Redo result.new(msg, __local1685__, __local1144__)
TRACE | | Redo __local1685__ = output.cmd
TRACE | | Redo msg = __local1143__
TRACE | | Redo sprintf("'--no-cache' is missed: %s", [__local1684__], __local1143__)
TRACE | | Redo __local1684__ = output.arg
TRACE | | Redo output = data.builtin.dockerfile.DS025.get_apk[_]
TRACE | Exit data.builtin.dockerfile.DS025.deny = _
TRACE Redo data.builtin.dockerfile.DS025.deny = _
TRACE | Redo data.builtin.dockerfile.DS025.deny = _
TRACE 


ID: DS026
File: Dockerfile
Namespace: builtin.dockerfile.DS026
Query: data.builtin.dockerfile.DS026.deny
Message: Add HEALTHCHECK instruction in your Dockerfile
TRACE Enter data.builtin.dockerfile.DS026.deny = _
TRACE | Eval data.builtin.dockerfile.DS026.deny = _
TRACE | Index data.builtin.dockerfile.DS026.deny (matched 1 rule)
TRACE | Enter data.builtin.dockerfile.DS026.deny
TRACE | | Eval __local1705__ = data.lib.docker.healthcheck
TRACE | | Index data.lib.docker.healthcheck (matched 1 rule)
TRACE | | Enter data.lib.docker.healthcheck
TRACE | | | Eval instruction = input.Stages[_].Commands[_]
TRACE | | | Eval instruction.Cmd = "healthcheck"
TRACE | | | Fail instruction.Cmd = "healthcheck"
TRACE | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | Eval instruction.Cmd = "healthcheck"
TRACE | | | Fail instruction.Cmd = "healthcheck"
TRACE | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | | Eval instruction.Cmd = "healthcheck"
TRACE | | | Fail instruction.Cmd = "healthcheck"
TRACE | | | Redo instruction = input.Stages[_].Commands[_]
TRACE | | Eval count(__local1705__, __local1174__)
TRACE | | Eval __local1174__ = 0
TRACE | | Eval msg = "Add HEALTHCHECK instruction in your Dockerfile"
TRACE | | Eval result.new(msg, {}, __local1175__)
TRACE | | Eval res = __local1175__
TRACE | | Exit data.builtin.dockerfile.DS026.deny
TRACE | Redo data.builtin.dockerfile.DS026.deny
TRACE | | Redo res = __local1175__
TRACE | | Redo result.new(msg, {}, __local1175__)
TRACE | | Redo msg = "Add HEALTHCHECK instruction in your Dockerfile"
TRACE | | Redo __local1174__ = 0
TRACE | | Redo count(__local1705__, __local1174__)
TRACE | | Redo __local1705__ = data.lib.docker.healthcheck
TRACE | Exit data.builtin.dockerfile.DS026.deny = _
TRACE Redo data.builtin.dockerfile.DS026.deny = _
TRACE | Redo data.builtin.dockerfile.DS026.deny = _
TRACE 
```