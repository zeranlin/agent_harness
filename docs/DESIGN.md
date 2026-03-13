# DESIGN

## Purpose
Design a multi-project agent harness that can coordinate planning, execution, testing, and governance across the seven-layer AI stack.

## Design Goals
- Full-stack orchestration across Java, Python, and IaC projects
- Incremental delivery with explicit progress tracking
- Non-invasive to business logic; enforce contracts and interfaces
- Human-in-the-loop approvals for high-risk operations
- Machine-readable observability and auditability

## Non-Goals
- Replace layer services or their internal implementations
- Build a monolithic all-in-one runtime
- Own model training or dataset pipelines directly

## Control Planes
1. Knowledge Plane
- Documents as system of record
- Progressive disclosure via AGENTS.md and docs/
- Architecture map and product specs

2. Control Plane
- Task planning and prioritization
- Approval gates and audit log
- Policy enforcement (quota, access, risk)

3. Execution Plane
- Build/test/run orchestration
- Boot sequences (single-layer or full-stack)
- Environment management (dev/staging/prod)

4. Observation Plane
- Standardized logs/metrics/traces
- Quality scoring and gates
- Failure analysis and auto-remediation hooks

5. Integration Plane
- Metadata registry for seven-layer projects
- Unified interface contracts and adapters
- Dependency graph and call routing metadata

## Key Artifacts
- AGENTS.md: navigation map for humans and agents
- ARCHITECTURE.md: bird’s-eye view and data/control flows
- features.json: feature matrix and status
- incremental.md: milestones and progress
- docs/: design, plans, specs, references, quality

## Minimal Harness Services
- Registry Service: catalog projects, owners, entrypoints
- Planner Service: tasks, milestones, dependencies
- Runner Service: build/test/run orchestration
- Auditor Service: approvals, audit records
- Observer Service: test results, logs, quality gates

## Data Model Sketch (Conceptual)
- Project: name, layer, language, repo, entrypoints
- Task: id, title, status, dependencies, artifacts
- Run: id, project, command, status, logs, timestamps
- Approval: id, request, approver, decision, reason
- Quality Gate: id, criteria, status, evidence

## Execution Flow (High Level)
1. Agent reads AGENTS.md and picks relevant docs
2. Planner creates tasks and dependencies
3. Runner executes build/test/run for target layers
4. Observer collects signals and updates quality
5. Auditor records approvals and outcomes

