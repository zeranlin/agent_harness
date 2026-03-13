# Agent Harness Map

Purpose: engineering control plane that can orchestrate, test, and operate the seven-layer AI service stack end-to-end.

## Scope (Seven Layers)
1. Service Operations Gateway: agent-gateway-basic (Java)
2. AI Service Orchestration: agent-business-solution (Python)
3. Atomic Capability Engine: atomic-ai-service (Python)
4. Model Runtime & Scheduling: agent-model-runtime (Java, proposed)
5. Knowledge Ops: agent-knowledge-ops (Python, proposed)
6. Model Hub: agent-model-hub (Python, proposed)
7. Platform Foundation: agent-platform-foundation (IaC)

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
