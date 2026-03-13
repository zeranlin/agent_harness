# 架构

## 鸟瞰图（七层）
```mermaid
flowchart TB
  subgraph L1["L1 服务运营网关"]
    GW["agent-gateway-basic (Java)"]
  end
  subgraph L2["L2 AI 服务编排"]
    BS["agent-business-solution (Python)"]
  end
  subgraph L3["L3 原子能力引擎"]
    AT["atomic-ai-engine (Python SDK)"]
  end
  subgraph L4["L4 模型运行时与调度"]
    MR["agent-model-runtime (Java)"]
  end
  subgraph L5["L5 知识运营"]
    KO["agent-knowledge-ops (Python)"]
  end
  subgraph L6["L6 模型中台"]
    MH["agent-model-hub (Python)"]
  end
  subgraph L7["L7 平台基础设施"]
    PF["agent-platform-foundation (IaC)"]
  end

  GW --> BS --> AT --> MR --> MH
  BS --> KO
  KO --> AT
  PF --> GW
  PF --> BS
  PF --> AT
  PF --> MR
  PF --> KO
  PF --> MH
```

## Harness 控制平面
```mermaid
flowchart TB
  subgraph CP["Harness 控制平面"]
    K["知识平面"]
    C["控制平面"]
    E["执行平面"]
    O["观测平面"]
    I["集成平面"]
  end

  K --> C --> E --> O --> C
  I --> C
  I --> E
  I --> O
```

## 各平面职责
- 知识平面：AGENTS.md、docs/、架构图、规格
- 控制平面：规划、审批、审计、策略
- 执行平面：构建/测试/运行、启动序列
- 观测平面：日志/指标/追踪、质量门禁
- 集成平面：项目注册、契约、适配

## 计划接口
- REST API：控制平面操作
- CLI：本地与 CI 工作流
- 可选 Web UI：审批与可视化

## 层级集成契约
每一层暴露最小 harness 契约：
- build：命令与依赖环境
- test：命令与报告输出
- run：入口、端口、健康检查
- deploy：目标环境与回滚策略

