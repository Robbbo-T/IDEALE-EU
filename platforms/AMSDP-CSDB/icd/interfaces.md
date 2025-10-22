# AMSDP Interfaces · Interface Control Document

## Overview

This document defines the external interfaces for the **Aerospace Material & Software Digital Passports (AMSDP)** module, including MAL topics, data contracts, and integration points with other ASI-T2 systems.

## MAL Topics

### Control Plane (MAL.v1.control)

#### amsdp.passport.create
Create a new digital passport for a material or software artifact.

**Request:**
```json
{
  "command": "amsdp.passport.create",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "type": "MATERIAL | SOFTWARE | ASSEMBLY",
    "identity": {
      "part_number": "string",
      "serial_number": "string",
      "manufacturer": "string"
    },
    "provenance": { /* ... */ },
    "properties": { /* ... */ }
  },
  "signature": "base64"
}
```

**Response:**
```json
{
  "status": "ACK | NACK",
  "passport_id": "AMSDP-{TYPE}-{SERIAL}-{VERSION}",
  "hash": "sha256",
  "timestamp": "ISO8601",
  "signature": "base64"
}
```

#### amsdp.passport.update
Update existing passport with lifecycle event or property change.

**Request:**
```json
{
  "command": "amsdp.passport.update",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "passport_id": "string",
    "event_type": "INSPECTION | INSTALLATION | MAINTENANCE | REMOVAL",
    "event_data": { /* ... */ },
    "technician": "string",
    "location": "string"
  },
  "signature": "base64"
}
```

#### amsdp.passport.query
Query passports by various criteria.

**Request:**
```json
{
  "command": "amsdp.passport.query",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "query_type": "BY_PART | BY_SERIAL | BY_LOCATION | BY_STATUS",
    "filters": {
      "part_number": "string (optional)",
      "serial_number": "string (optional)",
      "location": "string (optional)",
      "status": "ACTIVE | MAINTENANCE | RETIRED"
    },
    "pagination": {
      "page": 1,
      "per_page": 50
    }
  }
}
```

#### amsdp.passport.verify
Verify passport integrity and cryptographic signatures.

**Request:**
```json
{
  "command": "amsdp.passport.verify",
  "idempotency_key": "uuid",
  "timestamp": "ISO8601",
  "payload": {
    "passport_id": "string",
    "verify_chain": true
  }
}
```

### Telemetry Plane (MAL.v1.telemetry)

#### amsdp.events.lifecycle
Stream of lifecycle events as they occur.

**Message:**
```json
{
  "topic": "amsdp.events.lifecycle",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "passport_id": "string",
    "event_type": "CREATED | UPDATED | INSTALLED | INSPECTED | REMOVED",
    "event_data": { /* ... */ },
    "actor": "string",
    "location": "string"
  },
  "signature": "base64"
}
```

#### amsdp.alerts.compliance
Compliance-related alerts and warnings.

**Message:**
```json
{
  "topic": "amsdp.alerts.compliance",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "alert_type": "CERTIFICATION_EXPIRING | INSPECTION_DUE | VULNERABILITY",
    "severity": "INFO | WARNING | CRITICAL",
    "passport_id": "string",
    "details": { /* ... */ },
    "action_required": "string"
  },
  "signature": "base64"
}
```

#### amsdp.metrics.operations
Operational metrics for monitoring.

**Message:**
```json
{
  "topic": "amsdp.metrics.operations",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "metric_type": "PASSPORT_COUNT | CREATION_RATE | QUERY_LATENCY",
    "value": "number",
    "unit": "string",
    "dimensions": {
      "type": "MATERIAL | SOFTWARE",
      "platform": "AMPEL360 | GAIA_SPACE | ..."
    }
  }
}
```

### Audit Plane (MAL.v1.audit)

#### amsdp.audit.trail
Immutable audit trail entries.

**Message:**
```json
{
  "topic": "amsdp.audit.trail",
  "sequence": 12345,
  "timestamp": "ISO8601",
  "payload": {
    "action": "CREATE | UPDATE | QUERY | DELETE | VERIFY",
    "subject": "passport_id or query_id",
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
- `/schemas/amsdp/material_passport.schema.json` - Material passport structure
- `/schemas/amsdp/software_passport.schema.json` - Software passport structure
- `/schemas/amsdp/lifecycle_event.schema.json` - Lifecycle event structure
- `/schemas/amsdp/compliance_record.schema.json` - Compliance record structure

### Versioning
All schemas use semantic versioning with backward-compatible minor updates.
- Current version: `v1.0.0`
- Compatibility: MAL v1.x

## External Integrations

### AAMMPP Integration
AMSDP provides passport data to AAMMPP for:
- Asset tracking and lifecycle management
- Maintenance planning based on material history
- Procurement decisions using material specifications

**Interface:**
- Topic: `amsdp.integration.aammpp`
- Protocol: MAL.v1.control
- Data: Passport summaries and lifecycle events

### SBOM Integration
Automatic integration with Software Bill of Materials:
- SBOM generation triggers software passport creation
- Dependency tracking linked to software passports
- Vulnerability scanning updates passport status

**Tools:**
- `syft` for SBOM generation
- `grype` for vulnerability scanning
- Integration via evidence pipeline

### Evidence Plane
All passports archived in evidence directory:
- Path: `evidence/passports/{type}/{year}/{id}.json`
- Format: JSON with embedded signatures
- UTCS bundle: `evidence/utcs_bundles/amsdp-{id}.yaml`

### Platform-Specific Integrations

#### AMPEL360
- Material passports for BWB structural components
- Software passports for flight control software
- Topic: `amsdp.ampel360.*`

#### GAIA SPACE
- Component passports for satellite hardware
- Software passports for mission software
- Topic: `amsdp.gaia_space.*`

#### GAIA AIR
- Agent hardware passports
- Swarm control software passports
- Topic: `amsdp.gaia_air.*`

#### H2 AIRPORT
- Infrastructure material passports
- Operational software passports
- Topic: `amsdp.h2_airport.*`

## Rate Limits

- **Passport Creation**: 100 per minute per system
- **Passport Updates**: 500 per minute per system
- **Queries**: 1000 per minute per user
- **Telemetry Stream**: No limit (best effort QoS)

## Security

### Authentication
- All commands require valid MAL credentials
- JWT tokens with 1-hour expiry
- Mutual TLS for system-to-system

### Authorization
- Role-based access control (RBAC)
- Roles: `passport.creator`, `passport.updater`, `passport.viewer`, `passport.admin`
- Fine-grained permissions per passport type and platform

### Encryption
- All data encrypted in transit (TLS 1.3)
- Sensitive fields encrypted at rest (AES-256)
- Key management via MAL key service

### Signatures
- All passports digitally signed
- Ed25519 or RSA-4096 signatures
- Signature verification required for updates

## Error Codes

| Code | Description | Recovery |
|------|-------------|----------|
| AMSDP-001 | Invalid passport schema | Fix payload structure |
| AMSDP-002 | Duplicate passport ID | Use existing passport or create new ID |
| AMSDP-003 | Signature verification failed | Re-sign payload |
| AMSDP-004 | Missing required fields | Add missing data |
| AMSDP-005 | Unauthorized access | Check permissions |
| AMSDP-006 | Rate limit exceeded | Back off and retry |
| AMSDP-007 | Passport not found | Verify ID or create new |
| AMSDP-008 | Lifecycle event invalid | Check event sequence |
| AMSDP-009 | Compliance data missing | Add required compliance records |
| AMSDP-010 | Hash chain broken | Investigate data integrity |

## Quality of Service

### Priority Levels
1. **Critical**: Compliance alerts, security events
2. **High**: Passport updates, lifecycle events
3. **Normal**: Passport creation, queries
4. **Low**: Metrics, statistics

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
- `amsdp.health.status` - Overall system health
- `amsdp.health.storage` - Storage capacity and performance
- `amsdp.health.crypto` - Signature verification status

### Metrics
- Passport creation rate
- Query latency (p50, p95, p99)
- Storage utilization
- Signature verification time
- Compliance alert rate

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
