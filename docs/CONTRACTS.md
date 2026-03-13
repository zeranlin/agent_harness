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

## 约束要求
- 每个项目必须提供 build/test/run/deploy 的可执行命令
- 测试命令必须产出机器可读报告或可解析日志
- healthcheck 必须稳定可用

