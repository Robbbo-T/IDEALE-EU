# Digital Platform

**Network · Information · Data Infrastructure**

## Overview

The Digital Platform provides the foundational infrastructure for the ASI-T2 ecosystem, including deterministic messaging, observability, data management, and service integration.

## Purpose

- **Deterministic Messaging**: Pub/sub with QoS guarantees
- **Observability**: Mission timelines, metrics, alerting
- **Data Management**: Versioned data products, append-only storage
- **Service Integration**: MAL (Master Application Layer) services
- **UTCS Packaging**: Consistent threading across services

## State (H0)

- **Maturity**: Core services design
- **Current Deliverables**:
  - MAL v1 specifications
  - Messaging architecture
  - Data plane design

## Architecture

### Execution Planes

Per **Section 3.3** of the Master Whitepaper:

#### Data Plane
- Ingestion and telemetry streams
- Append-only storage with UTCS threading/bundling
- UiX Context/Content/Cache management
- Structure/Style/Sheet organization

#### Control Plane
- Mission orchestration
- Keys, policies, permissions (MAL-EEM)
- Service discovery and registration
- Configuration management

#### Model Plane
- Digital twins (SIL/HIL)
- Scenario management
- Verification & Validation frameworks
- Simulation orchestration

#### Evidence Plane
- SBOM generation and management
- in-toto/SLSA-lite attestations
- DOIs and signed tags
- Audit trails and reproducibility

### MAL (Master Application Layer/Logic)

Per **Section 3.4**, MAL provides:

- **Common IO/Messaging**: Standardized interfaces
- **Telemetry/Health/Logging**: Unified observability
- **Versioned Contracts**: Backward-compatible APIs
- **Observability Timelines**: Event correlation
- **Signed Flight-Recorders**: Tamper-evident logs
- **Zero-Trust Basics**: Key management, policy engine

## Interfaces

### MAL.v1.control
Deterministic commands with:
- Ack/nack responses
- Rate limiting
- Idempotency keys
- Command versioning

### MAL.v1.telemetry
Per-product topics with:
- Timestamps (nanosecond precision)
- Digital signatures
- Sequence numbers
- Schema versioning

## UTCS Threading/Bundling

**UTCS** = **UiX Threading Context/Content/Cache and Structure/Style/Sheet**

### Components
- **Context**: Domain, product, version, environment
- **Content**: Artifact references, data products
- **Cache**: Dependencies, versions, build artifacts
- **Structure**: File organization, references
- **Style**: Presentation standards, formatting
- **Sheet**: Output formats, templates

### Benefits
- Deterministic packaging
- Reproducible builds
- Clear dependency tracking
- Consistent cross-service integration

## Domains

- **OOO** - OS, Ontologies & Office Interfaces
- **IIS** - Information & Intelligence Systems
- **LCC** - Linkages, Control & Communications
- **LIB** - Logistics, Inventory & Blockchain

## Roadmap

### H0 (0-90 days)
- [x] MAL v1 specification
- [ ] Messaging prototype
- [ ] Data plane basic implementation

### H1 (3-9 months)
- [ ] Full observability framework
- [ ] Multi-product integration
- [ ] Evidence plane automation

### H2 (9-24 months)
- [ ] Production hardening
- [ ] Third-party service integration
- [ ] Public API release

## KPIs

- **Bus Latency p50/p95**: <5ms / <20ms
- **Uptime**: >99.9%
- **MTTR**: <1 hour
- **Data Integrity**: >99.99%

## Standards

- **MQTT/AMQP**: Messaging protocols
- **OpenTelemetry**: Observability
- **CloudEvents**: Event specification
- **JSON Schema**: Data validation

## Security

- **Zero-Trust**: No implicit trust
- **Least Privilege**: Minimal permissions
- **Key Management**: Secure credential storage
- **Audit Trails**: Immutable logging
- **Secret Hygiene**: No secrets in code

## IDEALE-EU Alignment

- **Intelligence**: Data-driven insights
- **Logistics**: Efficient data flow
- **ESG**: Transparent, auditable systems

## Links

- [Master Whitepaper](../README.md)
- [Evidence Directory](../evidence/)
- [Product Specification Template](../schemas/PRODUCT_SPEC_TEMPLATE.yaml)
