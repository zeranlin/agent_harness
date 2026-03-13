# atomic-ai-service 方案

本文档定义 L3 `atomic-ai-service` 的 MVP 方案，作为原子能力供给层的正式设计文档。

## 1. 目标
- 向 L2 场景层输出标准化、可复用、可组合的原子能力接口。
- 用能力契约替代零散的私有调用格式。
- 让新场景优先复用能力，而不是重复开发底层逻辑。

## 2. 定位
- 项目名：`atomic-ai-service`
- 层级：L3
- 技术：Python
- 角色：原子能力供给层

## 3. 核心职责
- 能力注册与暴露
- 统一能力执行入口
- 结构化结果输出
- 供 L2 编排直接复用

## 4. 不负责的内容
- 业务场景交付与编排
- 模型调度治理
- 知识资产治理
- 平台基础设施治理

## 5. MVP 能力
- `structured_extraction`

## 6. MVP 接口
### 6.1 健康检查
```http
GET /health
```

### 6.2 能力调用
```http
POST /invoke
```

请求示例：
```json
{
  "request_id": "req-cap-001",
  "capability_code": "structured_extraction",
  "tenant_id": "tenant-c",
  "operator_id": "operator-c",
  "input": {
    "document": "合同条款与资格条件"
  }
}
```

响应示例：
```json
{
  "status": "ok",
  "request_id": "req-cap-001",
  "service": "compliance",
  "provider": "atomic-ai-service",
  "capability_code": "structured_extraction",
  "evidence_count": 2,
  "risk_level": "medium",
  "tenant_id": "tenant-c",
  "operator_id": "operator-c"
}
```

## 7. 设计原则
- 能力接口稳定优先
- 输出结构可被 L2/L1 直接消费
- 能力代码与场景代码分离
- 能力粒度可组合

## 8. 第一阶段验收标准
- `/health` 可用
- `/invoke` 可执行 `structured_extraction`
- 返回标准结构化结果
- 可被 L1 契约映射正确调用
