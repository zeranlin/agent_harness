# agent-model-runtime 方案

本文档定义 L4 `agent-model-runtime` 的 MVP 方案，作为模型调度与执行层的正式设计文档。

## 1. 目标
- 为上层提供统一模型执行入口。
- 屏蔽底层模型调度、路由和运行细节。
- 为 L2/L3 提供稳定、可观测的模型执行元数据。

## 2. 定位
- 项目名：`agent-model-runtime`
- 层级：L4
- 技术：Java
- 角色：模型调用治理层

## 3. 核心职责
- 模型调用接入
- 运行时路由
- 稳定性治理
- 执行元数据返回

## 4. 不负责的内容
- 业务场景编排
- 原子能力实现
- 模型资产治理
- 基础设施资源治理

## 5. MVP 任务
- `pricing_inference`

## 6. MVP 接口
### 6.1 健康检查
```http
GET /health
```

### 6.2 模型执行
```http
POST /invoke
```

请求示例：
```json
{
  "request_id": "req-runtime-001",
  "task_type": "pricing_inference",
  "tenant_id": "tenant-p",
  "operator_id": "operator-p",
  "input": {
    "payload": "生成价格分析摘要"
  }
}
```

响应示例：
```json
{
  "status": "ok",
  "service": "pricing",
  "provider": "agent-model-runtime",
  "request_id": "req-runtime-001",
  "task_type": "pricing_inference",
  "runtime": "priority-scheduler",
  "model_route": "general-llm-v1",
  "payload_size": 262
}
```

## 7. 设计原则
- 统一运行入口优先
- 路由策略与调用方解耦
- 响应中返回关键执行元数据
- 让上游可观测模型执行结果，而不是只拿到文本

## 8. 第一阶段验收标准
- `/health` 可用
- `/invoke` 可执行 `pricing_inference`
- 返回 `runtime`、`model_route` 等标准元数据
- 可被 L1 契约映射正确调用
