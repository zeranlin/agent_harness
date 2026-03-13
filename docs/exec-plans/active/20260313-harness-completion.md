# 执行计划：harness engineering 补齐

## 背景与目标
当前仓库已具备文档结构与基础规范，但缺少执行闭环与自动化门禁。目标是补齐计划闭环、运行契约、质量门禁、可观测规范与 doc-gardening。

## 范围（in / out）
- In: 计划闭环、统一运行契约、质量门禁脚本、可观测规范、doc-gardening 脚本
- Out: 接入真实业务仓库与运行环境

## 成功标准（验收口径）
- 有可执行计划文件并持续更新
- 有统一 build/test/run/deploy 契约模板
- 有可运行的质量门禁脚本与说明
- 有可观测性输出规范
- 有 doc-gardening 规则与执行入口

## 依赖与风险
- 依赖：无
- 风险：规范与实际工程脱节，需后续对接真实仓库

## 里程碑与时间点
- M1：计划闭环（当天）
- M2：契约与门禁（当天）
- M3：可观测与 doc-gardening（当天）

## 任务拆解（Epic → Story → Task）
- Epic A：计划闭环
  - Task A1：创建 active 计划并写入验收标准
- Epic B：运行契约
  - Task B1：输出 build/test/run/deploy 契约模板
- Epic C：质量门禁
  - Task C1：门禁脚本与执行说明
- Epic D：可观测规范
  - Task D1：日志/指标/追踪格式与字段
- Epic E：doc-gardening
  - Task E1：扫描过期文档与 TODO

## 交付物清单
- docs/exec-plans/active/20260313-harness-completion.md
- docs/CONTRACTS.md
- scripts/quality_gate.sh
- docs/QUALITY_SCORE.md（已存在，作为门禁依据）
- docs/OBSERVABILITY.md
- scripts/doc_gardener.sh
- docs/references/doc-gardening.md

## 运行/验证步骤
- ./scripts/docs_lint.sh
- ./scripts/quality_gate.sh
- ./scripts/doc_gardener.sh

## 变更记录
- 2026-03-13: 创建计划与交付物列表

