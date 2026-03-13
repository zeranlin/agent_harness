# agent-business-solution 方案

本文档定义 L2 `agent-business-solution` 的系统设计草案，作为场景解决方案层 / 智能体编排层的正式方案。

## 1. 目标
- L2 负责把底层能力组织成可交付的业务场景服务。
- 对上承接 L1 `agent-gateway-basic`。
- 对下编排 L3 `atomic-ai-service`、L4 `agent-model-runtime`、L5 `agent-knowledge-ops`、L6 `agent-model-hub`。
- 对内提供统一的场景注册、执行、观测、版本治理能力。

## 2. 设计原则
- 场景优先，不做底层能力研发。
- 编排和能力解耦。
- 请求与响应标准化。
- 场景可版本化、可回放、可审计。
- 同时支持程序化编排和可视化编排。

## 3. 系统边界
L2 负责：
- 场景注册
- 场景运行
- 结果封装
- 场景观测
- 场景版本治理

L2 不负责：
- 模型调度与并发治理（L4）
- 原子能力实现（L3）
- 知识资产全生命周期治理（L5）
- 模型池治理（L6）
- 基础设施治理（L7）

## 4. 核心职责
- 面向业务场景提供可直接消费的服务。
- 编排 L3 原子能力、L4 模型运行时、L5 知识、L6 模型供给。
- 把复杂能力包装成稳定的“场景方案包”。
- 对上输出结构化、标准化的业务结果。

## 5. 典型场景
- 智能问答
- 专项整治
- 质疑投诉
- 辅助评审
- 合同审查
- 合规审查
- 价格预警
- 寻源
- 政策咨询
- 需求编写
- 辅助操作
- 围串标分析

## 6. 核心模块
1. `api`
- 对外 HTTP 接口
- 接收来自 L1 的统一调用

2. `scenario_registry`
- 管理场景元数据
- 场景版本、状态、入口、依赖

3. `scenario_runtime`
- 统一执行入口
- 根据 `scenario_code` 选择场景并运行

4. `orchestrators`
- `langgraph/`
- `visual_flow/`
- 屏蔽不同编排实现差异

5. `adapters`
- 对接 L3/L4/L5/L6

6. `schemas`
- 请求、响应、证据、错误、执行状态

7. `observability`
- trace、metrics、audit、execution log

8. `tests`
- 场景契约测试
- 场景回归测试
- adapter 测试

## 7. 建议目录结构
```text
agent-business-solution/
├── app.py
├── requirements.txt
├── README.md
├── config/
│   ├── scenarios.yaml
│   └── runtime.yaml
├── api/
│   ├── routes.py
│   └── handlers.py
├── scenario_registry/
│   ├── registry.py
│   └── models.py
├── scenario_runtime/
│   ├── runtime.py
│   ├── dispatcher.py
│   └── executor.py
├── orchestrators/
│   ├── base.py
│   ├── langgraph/
│   │   └── qa_graph.py
│   └── visual_flow/
│       └── loader.py
├── scenarios/
│   ├── intelligent_qa/
│   │   ├── manifest.yaml
│   │   └── service.py
│   └── contract_review/
│       ├── manifest.yaml
│       └── service.py
├── adapters/
│   ├── l3_atomic_ai_service.py
│   ├── l4_model_runtime.py
│   ├── l5_knowledge_ops.py
│   └── l6_model_hub.py
├── schemas/
│   ├── request.py
│   ├── response.py
│   ├── evidence.py
│   └── error.py
├── observability/
│   ├── metrics.py
│   ├── audit.py
│   └── tracing.py
├── scripts/
│   ├── build.sh
│   ├── test.sh
│   ├── run.sh
│   └── healthcheck.sh
└── tests/
    ├── test_health.py
    ├── test_invoke.py
    └── test_scenarios.py
```

## 8. 核心对象
### 8.1 ScenarioManifest
- `scenario_code`
- `name`
- `version`
- `status`
- `orchestrator_type`
- `entrypoint`
- `dependencies`
- `input_schema`
- `output_schema`

### 8.2 ScenarioRequest
- `request_id`
- `scenario_code`
- `tenant_id`
- `operator_id`
- `input`
- `context`
- `options`

### 8.3 ScenarioResponse
- `request_id`
- `scenario_code`
- `status`
- `result`
- `evidence`
- `metrics`
- `errors`

### 8.4 ExecutionRecord
- `request_id`
- `scenario_code`
- `started_at`
- `ended_at`
- `dependency_calls`
- `final_status`

## 9. 统一接口
### 9.1 健康检查
```http
GET /health
```

### 9.2 场景执行
```http
POST /invoke
```

请求示例：
```json
{
  "request_id": "req-001",
  "scenario_code": "intelligent_qa",
  "tenant_id": "demo",
  "operator_id": "user-1",
  "input": {
    "question": "采购评审里废标条款怎么判断？"
  },
  "context": {
    "channel": "gateway"
  },
  "options": {
    "debug": false
  }
}
```

响应示例：
```json
{
  "request_id": "req-001",
  "scenario_code": "intelligent_qa",
  "status": "success",
  "result": {
    "answer": "..."
  },
  "evidence": [
    {
      "type": "knowledge",
      "source": "policy_doc_12",
      "snippet": "..."
    }
  ],
  "metrics": {
    "duration_ms": 842
  },
  "errors": []
}
```

### 9.3 场景列表
```http
GET /scenarios
```

### 9.4 场景详情
```http
GET /scenarios/{scenario_code}
```

### 9.5 执行记录查询
```http
GET /executions/{request_id}
```

## 10. 执行流
```mermaid
flowchart LR
    A["L1 Gateway"] --> B["L2 API /invoke"]
    B --> C["Scenario Runtime"]
    C --> D["Scenario Registry"]
    C --> E["Orchestrator"]
    E --> F["L3 Atomic Capability"]
    E --> G["L4 Model Runtime"]
    E --> H["L5 Knowledge Ops"]
    E --> I["L6 Model Hub"]
    F --> E
    G --> E
    H --> E
    I --> E
    E --> J["Response Normalizer"]
    J --> K["Audit / Metrics / Trace"]
    K --> A
```

## 11. 场景注册机制
- 每个场景一个 `manifest.yaml`
- 启动时加载全部 manifest
- 场景状态建议：
- `draft`
- `testing`
- `active`
- `deprecated`

## 12. 编排抽象
- 定义统一接口 `Orchestrator.execute(request)`
- `langgraph` 和 `visual_flow` 都实现该接口
- `scenario_runtime` 不关心底层编排方式

## 13. 依赖适配原则
- L2 不直接写复杂底层逻辑
- 通过 adapter 调用 L3/L4/L5/L6
- adapter 负责超时、重试、错误映射、响应标准化

## 14. 可观测性
每次执行至少记录：
- `request_id`
- `scenario_code`
- `status`
- `duration_ms`
- `dependency_calls`
- `error_type`

第一版先实现执行日志，后续再扩展总览与聚合指标。

## 15. MVP 建议
- 先只做一个场景：`intelligent_qa`
- 先只支持一种编排：程序化编排
- 先只接两个下游：
- L3 能力服务
- L4 模型运行时

## 16. 第一阶段验收标准
- `/health` 可用
- `/invoke` 可执行 `intelligent_qa`
- 场景注册表可返回场景信息
- 至少有 1 条真实编排链路
- 有基本执行日志和错误返回
