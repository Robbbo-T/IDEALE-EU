# AAMMPP Interfaces · Interface Control Document

## Overview

This document defines the external interfaces for the **Aerospace Assets Management, Maintenance & Procurement Platform (AAMMPP)**, including MAL topics, data contracts, and integration points with other ASI-T2 systems.

## MAL Topics

### Control Plane (MAL.v1.control)

#### aammpp.asset.register
Register a new asset in the system.

**Request:**
```json
{
  "command": "aammpp.asset.register",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "type": "AIRCRAFT | SPACECRAFT | AGENT | INFRASTRUCTURE | GSE",
    "identity": {
      "designation": "string",
      "serial_number": "string",
      "manufacturer": "string",
      "model": "string"
    },
    "configuration": {
      "baseline": "string",
      "software_version": "string"
    },
    "amsdp_passports": ["passport_ids"]
  },
  "signature": "base64"
}
```

**Response:**
```json
{
  "status": "ACK | NACK",
  "asset_id": "AAMMPP-ASSET-{TYPE}-{SERIAL}",
  "hash": "sha256",
  "timestamp": "ISO8601"
}
```

#### aammpp.asset.update
Update asset information or status.

**Request:**
```json
{
  "command": "aammpp.asset.update",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "asset_id": "string",
    "update_type": "STATUS | LOCATION | CONFIGURATION | UTILIZATION",
    "data": { /* update-specific fields */ }
  },
  "signature": "base64"
}
```

#### aammpp.work_order.create
Create a maintenance work order.

**Request:**
```json
{
  "command": "aammpp.work_order.create",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "asset_id": "string",
    "type": "SCHEDULED | CORRECTIVE | PREDICTIVE | PREVENTIVE",
    "priority": "CRITICAL | HIGH | NORMAL | LOW",
    "work_description": {
      "title": "string",
      "description": "text",
      "procedures": ["references"],
      "estimated_hours": "number"
    },
    "schedule": {
      "scheduled_start": "ISO8601",
      "scheduled_end": "ISO8601"
    },
    "resources": {
      "skills_required": ["skill_codes"],
      "materials_required": [{"part_number": "string", "quantity": "number"}]
    }
  },
  "signature": "base64"
}
```

**Response:**
```json
{
  "status": "ACK | NACK",
  "work_order_id": "AAMMPP-WO-{NUMBER}",
  "hash": "sha256",
  "timestamp": "ISO8601"
}
```

#### aammpp.work_order.update
Update work order status or details.

**Request:**
```json
{
  "command": "aammpp.work_order.update",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "work_order_id": "string",
    "status": "PLANNED | IN_PROGRESS | INSPECTION | COMPLETED | CANCELLED",
    "actual_start": "ISO8601 (optional)",
    "actual_end": "ISO8601 (optional)",
    "findings": [{"description": "text", "severity": "string"}],
    "corrective_actions": [{"description": "text", "status": "string"}],
    "sign_off": {
      "technician": {"name": "string", "license": "string", "signature": "base64"},
      "inspector": {"name": "string", "authorization": "string", "signature": "base64"}
    }
  },
  "signature": "base64"
}
```

#### aammpp.procurement.request
Create a procurement request.

**Request:**
```json
{
  "command": "aammpp.procurement.request",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "type": "ROUTINE | URGENT | AOG | STRATEGIC",
    "priority": 1-5,
    "requisition": {
      "requested_by": "person",
      "date_required": "ISO8601",
      "justification": "text"
    },
    "items": [{
      "part_number": "string",
      "description": "string",
      "quantity": "number",
      "estimated_cost": {"amount": "number", "currency": "string"},
      "amsdp_requirements": "boolean"
    }]
  },
  "signature": "base64"
}
```

**Response:**
```json
{
  "status": "ACK | NACK",
  "request_id": "AAMMPP-PR-{NUMBER}",
  "hash": "sha256",
  "timestamp": "ISO8601"
}
```

#### aammpp.procurement.approve
Approve or reject a procurement request.

**Request:**
```json
{
  "command": "aammpp.procurement.approve",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "request_id": "string",
    "approver": "person",
    "decision": "APPROVED | REJECTED",
    "comments": "text"
  },
  "signature": "base64"
}
```

#### aammpp.query
Query assets, work orders, or procurement requests.

**Request:**
```json
{
  "command": "aammpp.query",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "entity_type": "ASSET | WORK_ORDER | PROCUREMENT",
    "query_type": "BY_ID | BY_STATUS | BY_DATE | BY_PLATFORM",
    "filters": { /* entity-specific filters */ },
    "pagination": {
      "page": 1,
      "per_page": 50
    }
  }
}
```

### Telemetry Plane (MAL.v1.telemetry)

#### aammpp.events.asset
Asset lifecycle events.

**Message:**
```json
{
  "topic": "aammpp.events.asset",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "asset_id": "string",
    "event_type": "REGISTERED | COMMISSIONED | DEPLOYED | MAINTENANCE | RETIRED",
    "event_data": { /* event-specific data */ },
    "location": "string",
    "actor": "string"
  },
  "signature": "base64"
}
```

#### aammpp.events.maintenance
Maintenance activity events.

**Message:**
```json
{
  "topic": "aammpp.events.maintenance",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "work_order_id": "string",
    "asset_id": "string",
    "event_type": "STARTED | INSPECTION | FINDING | COMPLETED | CANCELLED",
    "details": { /* event-specific details */ },
    "technician": "string"
  },
  "signature": "base64"
}
```

#### aammpp.events.procurement
Procurement workflow events.

**Message:**
```json
{
  "topic": "aammpp.events.procurement",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "request_id": "string",
    "event_type": "SUBMITTED | APPROVED | ORDERED | RECEIVED | COMPLETED",
    "details": { /* event-specific details */ },
    "actor": "string"
  },
  "signature": "base64"
}
```

#### aammpp.alerts.maintenance
Maintenance-related alerts.

**Message:**
```json
{
  "topic": "aammpp.alerts.maintenance",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "alert_type": "INSPECTION_DUE | AD_COMPLIANCE | DEFERRED_EXPIRING | CRITICAL_FINDING",
    "severity": "INFO | WARNING | CRITICAL",
    "asset_id": "string",
    "details": { /* alert-specific details */ },
    "action_required": "string",
    "due_date": "ISO8601"
  },
  "signature": "base64"
}
```

#### aammpp.alerts.procurement
Procurement-related alerts.

**Message:**
```json
{
  "topic": "aammpp.alerts.procurement",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "alert_type": "AOG_REQUEST | DELAYED_DELIVERY | BUDGET_EXCEEDED | APPROVAL_PENDING",
    "severity": "INFO | WARNING | CRITICAL",
    "request_id": "string",
    "details": { /* alert-specific details */ }
  },
  "signature": "base64"
}
```

#### aammpp.metrics.operations
Operational metrics for monitoring.

**Message:**
```json
{
  "topic": "aammpp.metrics.operations",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "metric_type": "AVAILABILITY | UTILIZATION | MTBF | MTTR | BACKLOG",
    "value": "number",
    "unit": "string",
    "dimensions": {
      "platform": "AMPEL360 | GAIA_SPACE | ...",
      "asset_type": "AIRCRAFT | SPACECRAFT | ..."
    }
  }
}
```

### Audit Plane (MAL.v1.audit)

#### aammpp.audit.trail
Immutable audit trail entries.

**Message:**
```json
{
  "topic": "aammpp.audit.trail",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "action": "REGISTER | UPDATE | CREATE_WO | APPROVE | SIGN_OFF",
    "subject": "asset_id or work_order_id or request_id",
    "actor": {
      "user": "string",
      "system": "string",
      "ip_address": "string"
    },
    "result": "SUCCESS | FAILURE",
    "evidence_hash": "sha256",
    "previous_hash": "sha256"
  },
  "signature": "base64"
}
```

## Data Schemas

### JSON Schema References
- `/schemas/aammpp/asset.schema.json` - Asset structure
- `/schemas/aammpp/work_order.schema.json` - Work order structure
- `/schemas/aammpp/procurement_request.schema.json` - Procurement request structure
- `/schemas/aammpp/maintenance_event.schema.json` - Maintenance event structure

### Versioning
All schemas use semantic versioning with backward-compatible minor updates.
- Current version: `v1.0.0`
- Compatibility: MAL v1.x

## External Integrations

### AMSDP Integration
AAMMPP consumes passport data from AMSDP:
- Subscribe to: `amsdp.integration.aammpp`
- Queries: Material and software passport lookups
- Updates: Trigger passport updates during maintenance and receiving

**Data Flow:**
```
AMSDP → AAMMPP: Passport data for materials and software
AAMMPP → AMSDP: Maintenance events, installation records, usage data
```

### Platform-Specific Integrations

#### AMPEL360
- Topics: `aammpp.ampel360.*`
- Data: BWB aircraft assets, flight systems maintenance
- Telemetry: Flight hours, cycles, system health

#### GAIA SPACE
- Topics: `aammpp.gaia_space.*`
- Data: Satellite assets, orbital systems maintenance
- Telemetry: Mission data, component health

#### GAIA AIR / IDRO-HYDROROBOT / EU Defense Wall
- Topics: `aammpp.gaia_air.*`, `aammpp.idro.*`, `aammpp.defense.*`
- Data: Swarm agent assets, distributed maintenance
- Telemetry: Agent status, fleet health

#### H2 AIRPORT
- Topics: `aammpp.h2_airport.*`
- Data: Infrastructure assets, facility maintenance
- Telemetry: Equipment status, safety systems

### Evidence Plane
All records archived in evidence directory:
- Path: `evidence/aammpp/{type}/{year}/{id}.json`
- Format: JSON with embedded signatures
- UTCS bundle: `evidence/utcs_bundles/aammpp-{id}.yaml`

## Rate Limits

- **Asset Registration**: 50 per minute per system
- **Work Order Creation**: 200 per minute per system
- **Procurement Requests**: 100 per minute per system
- **Updates**: 500 per minute per system
- **Queries**: 1000 per minute per user
- **Telemetry Stream**: No limit (best effort QoS)

## Security

### Authentication
- All commands require valid MAL credentials
- JWT tokens with 1-hour expiry
- Mutual TLS for system-to-system

### Authorization
- Role-based access control (RBAC)
- Roles: `asset.manager`, `maintenance.tech`, `maintenance.inspector`, `procurement.buyer`, `procurement.approver`, `admin`
- Fine-grained permissions per platform and asset type

### Encryption
- All data encrypted in transit (TLS 1.3)
- Sensitive fields encrypted at rest (AES-256)
- Key management via MAL key service

### Signatures
- All critical records digitally signed
- Ed25519 or RSA-4096 signatures
- Multi-signature support for approvals

## Error Codes

| Code | Description | Recovery |
|------|-------------|----------|
| AAMMPP-001 | Invalid asset data | Fix payload structure |
| AAMMPP-002 | Duplicate asset ID | Use existing asset or create new ID |
| AAMMPP-003 | Asset not found | Verify ID or register new asset |
| AAMMPP-004 | Work order validation failed | Check work order data |
| AAMMPP-005 | Unauthorized operation | Check permissions |
| AAMMPP-006 | Rate limit exceeded | Back off and retry |
| AAMMPP-007 | Procurement approval required | Submit for approval |
| AAMMPP-008 | Invalid maintenance sequence | Check lifecycle state |
| AAMMPP-009 | Missing AMSDP passport | Create passport first |
| AAMMPP-010 | Signature verification failed | Re-sign payload |

## Quality of Service

### Priority Levels
1. **Critical**: AOG requests, safety findings, critical failures
2. **High**: Work order updates, inspection due alerts
3. **Normal**: Asset registration, routine procurement
4. **Low**: Metrics, statistics, reporting

### Latency Targets
- **Command ACK**: <100ms (p95)
- **Query Response**: <500ms (p95)
- **Telemetry Delivery**: <1s (p99)
- **Audit Trail**: <5s (p99)

### Reliability
- **Uptime**: 99.9% (excluding planned maintenance)
- **Data Durability**: 99.999999999% (11 nines)
- **Message Delivery**: At-least-once guarantee

## Monitoring

### Health Endpoints
- `aammpp.health.status` - Overall system health
- `aammpp.health.database` - Database performance
- `aammpp.health.integrations` - Integration status

### Metrics
- Asset registration rate
- Work order completion rate
- Procurement lead time
- Query latency (p50, p95, p99)
- Alert rate by type and severity

## Versioning and Compatibility

### Interface Versions
- **Current**: v1.0.0
- **Minimum Supported**: v1.0.0
- **Deprecation Policy**: 6 months notice

### Backward Compatibility
- Minor version updates are backward compatible
- Major version updates require migration
- Migration tools provided for major updates

## Contact

For interface questions or integration support:
- Technical documentation: This file and linked schemas
- Integration issues: GitHub Issues
- Security concerns: Follow responsible disclosure policy

---

**Canon:** QS→FWD→UE→FE→CB→QB  
**UTCS Threading:** Context/Content/Cache + Structure/Style/Sheet  
**MAL-EEM:** All interfaces comply with ethics and empathy policy
