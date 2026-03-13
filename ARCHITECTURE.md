# ARCHITECTURE

## Bird’s-eye View (Seven Layers)
```mermaid
flowchart TB
  subgraph L1["L1 Service Operations Gateway"]
    GW["agent-gateway-basic (Java)"]
  end
  subgraph L2["L2 AI Service Orchestration"]
    BS["agent-business-solution (Python)"]
  end
  subgraph L3["L3 Atomic Capability Engine"]
    AT["atomic-ai-service (Python)"]
  end
  subgraph L4["L4 Model Runtime & Scheduling"]
    MR["agent-model-runtime (Java)"]
  end
  subgraph L5["L5 Knowledge Ops"]
    KO["agent-knowledge-ops (Python)"]
  end
  subgraph L6["L6 Model Hub"]
    MH["agent-model-hub (Python)"]
  end
  subgraph L7["L7 Platform Foundation"]
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

## Harness Control Plane
```mermaid
flowchart TB
  subgraph CP["Harness Control Plane"]
    K["Knowledge Plane"]
    C["Control Plane"]
    E["Execution Plane"]
    O["Observation Plane"]
    I["Integration Plane"]
  end

  K --> C --> E --> O --> C
  I --> C
  I --> E
  I --> O
```

## Responsibilities by Plane
- Knowledge Plane: AGENTS.md, docs/, architecture map, specs
- Control Plane: planning, approvals, audit, policy
- Execution Plane: build/test/run, boot sequences
- Observation Plane: logs/metrics/traces, quality gates
- Integration Plane: project registry, contracts, adapters

## Interfaces (Planned)
- REST API for control plane operations
- CLI for local development and CI workflows
- Optional web UI for approvals and visualization

## L1 Console Architecture
L1 is the web entrypoint for both operations and debugging across L2-L7.

### Console Areas
- `Dashboard`: global status, health, alerts, traffic, quality
- `Operations`: routing, auth, quota, audit, approvals
- `Debug Studio`: request builder, contract mapping, trace, replay
- `Scenarios`: L2 scenario operations
- `Capabilities`: L3 capability operations
- `Model Runtime`: L4 queue, retry, breaker, routing, cost
- `Knowledge Ops`: L5 pipelines and asset status
- `Model Hub`: L6 model registry and evaluation status
- `Platform`: L7 infrastructure status
- `Quality & Reliability`: score, SLO, release risk, tech debt

### Aggregation APIs
- `GET /ops/overview`
- `GET /ops/layers`
- `GET /ops/l2/scenarios`
- `GET /ops/l3/capabilities`
- `GET /ops/l4/runtime`
- `GET /ops/l5/knowledge`
- `GET /ops/l6/models`
- `GET /ops/l7/platform`
- `POST /debug/request`
- `GET /debug/trace/{request_id}`
- `POST /debug/replay/{request_id}`

### Data Flow
```mermaid
flowchart LR
  UI["L1 Console UI"] --> API["L1 Aggregation APIs"]
  API --> L2["L2 Scenario APIs"]
  API --> L3["L3 Capability APIs"]
  API --> L4["L4 Runtime APIs"]
  API --> L5["L5 Knowledge APIs"]
  API --> L6["L6 Model APIs"]
  API --> L7["L7 Platform APIs"]
  API --> OBS["Audit / Metrics / Trace Stores"]
```

## Layer Integration Contracts
Each layer exposes a minimal harness contract:
- build: command and required env
- test: command and coverage/report output
- run: entrypoint, ports, health checks
- deploy: target environment and rollback
