# Agent Harness Map

Purpose: 作为工程控制平面，统一规划、执行、测试与治理七层 AI 服务体系。

## 七层总览（职责/价值/对象）

1. 服务运营网关层
- 项目名：agent-gateway-basic
- 技术：Java
- 职责：路由、鉴权、计量、计时、策略执行、审计、配额与限流
- 价值：把所有 AI 服务变成“可接入、可运营、可计费、可监管”的标准服务入口
- 服务对象：渠道系统、业务系统、外部调用方、生态伙伴

2. AI 服务层（场景解决方案层 / 智能体编排）
- 项目名：agent-business-solution
- 技术：Python
- 职责：面向业务场景做服务化编排与交付，不承载底层能力研发
- 价值：销售可讲“场景方案包”，业务可直接消费“标准场景服务”
- 服务对象：业务系统、场景产品、运营人员

3. 能力引擎层（原子能力供给层）
- 项目名：atomic-ai-service
- 技术：Python
- 职责：向第 2 层输出标准化、可复用、可组合的原子能力组件
- 价值：研发聚焦“能力组件化与接口标准化”，快速支撑新场景上线
- 服务对象：第 2 层场景编排与内部能力调用

4. 模型调度与执行层（模型调用治理层）
- 项目名：agent-model-runtime（建议）
- 技术：Java（建议）
- 职责：承接第 3 层模型调用请求，统一做同步/异步、排队、并发与稳定性治理
- 价值：解决“大模型慢、贵、并发受限”的工程瓶颈，使上层能力可规模化运行
- 服务对象：第 3 层能力引擎与运行策略系统

5. 知识运营层（知识资产治理层）
- 项目名：agent-knowledge-ops（建议）
- 技术：Python（建议）
- 职责：知识库管理、数据治理流水线、监控审计流水线、质量管理流水线、制品管理、配置管理、安全管理
- 价值：保障知识资产“可用、可信、可追溯、可授权、可持续迭代”
- 服务对象：第 2 层场景编排与第 3 层能力引擎

6. 模型层（模型供给与治理层）
- 项目名：agent-model-hub（建议）
- 技术：Python（建议）
- 职责：统一纳管通用大模型、行业垂直模型、多模态模型、向量模型、重排序模型、OCR 模型等
- 价值：形成稳定、可替换、可评估的模型能力池
- 服务对象：模型调度与执行层、能力引擎层

7. 基础设施层（资源与平台底座层）
- 项目名：agent-platform-foundation（建议）
- 技术形态：IaC + 平台工程（Terraform/Helm/K8s）
- 职责：安全合规算力、一体化湖仓、存储网络、容器与调度、消息与缓存、监控告警、日志追踪、容灾备份、密钥与访问控制
- 价值：提供高可用、可扩展、可观测、可审计的统一技术底座
- 服务对象：全栈各层服务

## Harness Responsibilities
- Unified project metadata and dependency map
- Task planning and incremental execution tracking
- Build/test/launch orchestration across Java/Python/IaC
- Governance: audit, access control, quota/limits
- Observability: logs/metrics/traces aggregation hooks
- Documentation: architecture map and design/plan artifacts

## Interfaces (Planned)
- REST API for control plane operations
- CLI for local development and CI workflows
- Web UI (optional) for visualization and approvals

## Source of Truth
- features.json: feature list and status
- incremental.md: progress and milestones
- ARCHITECTURE.md: bird’s-eye diagram and data/control flows
- docs/: structured design, plans, product specs, references, and quality

## Docs Layout
- docs/design-docs/: validation status and core beliefs
- docs/exec-plans/: active/completed plans and tech debt tracker
- docs/generated/: generated artifacts
- docs/product-specs/: product specifications
- docs/references/: reference material
- docs/DESIGN.md: system-level design notes
- docs/FRONTEND.md: UI considerations
- docs/PLANS.md: planning conventions
- docs/PRODUCT_SENSE.md: product principles and tradeoffs
- docs/QUALITY_SCORE.md: quality scoring rubric
- docs/RELIABILITY.md: reliability targets and SLOs
- docs/SECURITY.md: security model and audit policy

