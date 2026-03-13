# OBSERVABILITY

定义可观测性输出规范，确保日志/指标/追踪对智能体可读。

## 日志
- 结构化 JSON 优先
- 必须字段：timestamp, level, service, trace_id, span_id, event, message

## 指标
- 命名规范：service.metric_name
- 必须字段：value, unit, timestamp
- 关键指标：请求量、错误率、延迟分位

## 追踪
- trace_id 与 span_id 必须贯通跨层调用
- 关键路径必须保留完整链路

## 质量信号输出
- 测试结果应输出机器可读摘要（JSON 或 JUnit）
- 失败用统一 error_code 与 error_type

