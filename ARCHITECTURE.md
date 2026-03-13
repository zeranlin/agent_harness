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

## Layer Integration Contracts
Each layer exposes a minimal harness contract:
- build: command and required env
- test: command and coverage/report output
- run: entrypoint, ports, health checks
- deploy: target environment and rollback

