# CONTRACTS

统一运行契约用于约束七层项目的 build/test/run/deploy 接口，供 harness 统一调用。

## 统一字段
- project: 项目名
- layer: L1-L7
- tech: 技术栈
- build: 构建命令
- test: 测试命令
- run: 本地运行命令
- deploy: 部署入口与目标环境
- healthcheck: 健康检查方式

## 契约模板（示例）
```
project: agent-gateway-basic
layer: L1
tech: Java
build: mvn -q -DskipTests package
test: mvn -q test
run: mvn -q spring-boot:run
deploy: helm upgrade --install ...
healthcheck: http://host:port/actuator/health
```

## 本地落地（harnees_aimp）
路径根：`/Users/linzeran/code/2026-zn/harnees_aimp`

```
project: agent-gateway-basic
layer: L1
tech: Java
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-gateway-basic/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-gateway-basic/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-gateway-basic/scripts/run.sh
healthcheck: http://127.0.0.1:8080/health
```

```
project: agent-business-solution
layer: L2
tech: Python
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-business-solution/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-business-solution/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-business-solution/scripts/run.sh
healthcheck: http://127.0.0.1:8002/health
```

```
project: atomic-ai-service
layer: L3
tech: Python
build: /Users/linzeran/code/2026-zn/harnees_aimp/atomic-ai-service/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/atomic-ai-service/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/atomic-ai-service/scripts/run.sh
healthcheck: http://127.0.0.1:8003/health
```

```
project: agent-model-runtime
layer: L4
tech: Java
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-runtime/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-runtime/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-runtime/scripts/run.sh
healthcheck: http://127.0.0.1:8081/health
```

```
project: agent-knowledge-ops
layer: L5
tech: Python
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-knowledge-ops/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-knowledge-ops/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-knowledge-ops/scripts/run.sh
healthcheck: http://127.0.0.1:8004/health
```

```
project: agent-model-hub
layer: L6
tech: Python
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-hub/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-hub/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-model-hub/scripts/run.sh
healthcheck: http://127.0.0.1:8005/health
```

```
project: agent-platform-foundation
layer: L7
tech: IaC
build: /Users/linzeran/code/2026-zn/harnees_aimp/agent-platform-foundation/scripts/build.sh
test: /Users/linzeran/code/2026-zn/harnees_aimp/agent-platform-foundation/scripts/test.sh
run: /Users/linzeran/code/2026-zn/harnees_aimp/agent-platform-foundation/scripts/run.sh
healthcheck: local script (scripts/healthcheck.sh)
```

## 约束要求
- 每个项目必须提供 build/test/run/deploy 的可执行命令
- 测试命令必须产出机器可读报告或可解析日志
- healthcheck 必须稳定可用
