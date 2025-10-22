# AMSDP-CSDB · Aerospace Material & Software Digital Passports

This is the **S1000D CSDB** for `AMSDP-CSDB`, part of the UTCS-federated Digital Platforms.

## Overview

The **Aerospace Material & Software Digital Passports (AMSDP)** module provides comprehensive lifecycle traceability for materials, components, and software artifacts used across all ASI-T2 aerospace programs. It ensures complete audit trails from sourcing through disposal, supporting compliance, quality assurance, and sustainability requirements.

## Purpose

- **Material Traceability**: Complete chain of custody for aerospace materials and components
- **Software Provenance**: End-to-end tracking of software artifacts, versions, and dependencies
- **Digital Passport Generation**: Automated creation of immutable digital passports
- **Compliance Support**: Built-in support for AS9100, REACH, RoHS, conflict minerals
- **Audit Readiness**: Real-time audit trails with cryptographic verification
- **Multi-Vehicle Integration**: Unified tracking across all ASI-T2 platforms

## Scope

### Material Passports
- **Raw Materials**: Metals, composites, polymers, ceramics
- **Components**: Fasteners, electronics, hydraulics, systems
- **Assemblies**: Sub-assemblies and integrated systems
- **Lifecycle Events**: Receipt, inspection, installation, maintenance, removal, disposal

### Software Passports
- **Source Code**: Version control integration, commit signatures
- **Build Artifacts**: Compiled binaries, libraries, containers
- **Dependencies**: SBOM integration with supply chain tracking
- **Certifications**: DO-178C compliance evidence, test results
- **Deployment**: Installation records, configuration management

## Architecture

### Digital Passport Structure

Each passport contains:
```yaml
passport:
  id: AMSDP-{TYPE}-{SERIAL}-{VERSION}
  type: MATERIAL | SOFTWARE | ASSEMBLY
  classification: PUBLIC | RESTRICTED | CONTROLLED
  
  identity:
    part_number: string
    serial_number: string
    manufacturer: string
    batch_lot: string
    
  provenance:
    origin: {country, facility, certification}
    supply_chain: [{supplier, date, certificate}]
    certificates: [{type, number, issuer, expiry}]
    
  material_properties:
    specification: string
    composition: {elements, percentages}
    mechanical: {tensile, yield, hardness}
    environmental: {temp_min, temp_max, corrosion}
    
  quality_records:
    inspection_reports: [{date, inspector, result, attachments}]
    test_results: [{type, date, values, pass_fail}]
    certifications: [{standard, number, date, issuer}]
    
  lifecycle:
    manufactured: {date, facility, operator}
    received: {date, inspector, condition}
    installed: {date, location, technician, aircraft/system}
    maintenance: [{date, type, technician, findings, actions}]
    removed: {date, reason, condition, technician}
    disposition: {date, method, documentation}
    
  compliance:
    reach: {compliant, substances, date}
    rohs: {compliant, exemptions, date}
    conflict_minerals: {compliant, source, date}
    export_control: {classification, authority, date}
    
  cryptographic:
    hash: SHA-256 of passport content
    signature: Digital signature by issuing authority
    previous_hash: Link to previous version (blockchain-style)
    utcs_bundle: Reference to UTCS bundle
```

### Software Passport Structure

```yaml
software_passport:
  id: AMSDP-SW-{NAME}-{VERSION}
  type: SOFTWARE
  classification: PUBLIC | RESTRICTED | CONTROLLED
  
  identity:
    name: string
    version: semver
    git_commit: SHA
    build_number: string
    
  provenance:
    repository: URL
    branch: string
    commit_history: [{sha, author, date, message}]
    build_system: {tool, version, date}
    
  dependencies:
    sbom: Reference to SBOM file
    direct: [{name, version, license, source}]
    transitive: [{name, version, license, source}]
    vulnerabilities: [{cve, severity, status, mitigation}]
    
  verification:
    tests: [{suite, coverage, pass_rate, date}]
    static_analysis: [{tool, findings, resolved, date}]
    certification: {standard, level, evidence, date}
    
  deployment:
    targets: [{platform, vehicle, installation_date}]
    configuration: {parameters, environment}
    rollback: {capability, last_good_version}
    
  compliance:
    do_178c: {level, evidence, artifacts}
    open_source: {licenses, compliance_check}
    export_control: {classification, itar_ear}
    
  cryptographic:
    artifact_hash: SHA-256
    signature: GPG/code signing certificate
    attestations: SLSA/in-toto references
    utcs_bundle: Reference to UTCS bundle
```

## Integration Points

### MAL Integration
- **MAL.v1.control**: Passport creation, update, query commands
- **MAL.v1.telemetry**: Lifecycle event streaming
- **MAL.v1.audit**: Audit trail publication

### UTCS Threading
- **Context**: Product domain, passport type, version
- **Content**: Passport data, supporting documents
- **Cache**: Certificates, test reports, images
- **Structure**: Passport schema, validation rules
- **Style**: Presentation formats (PDF, HTML, JSON)
- **Sheet**: Template definitions

### Evidence Plane
- All passports stored in `evidence/passports/`
- Immutable append-only storage
- Cryptographic linking (blockchain-style)
- Integration with SBOM pipeline
- Automated hash generation and verification

### Multi-Vehicle Tracking
Supports tracking across all ASI-T2 platforms:
- **AMPEL360**: BWB aircraft materials and software
- **GAIA SPACE**: Satellite components and flight software
- **GAIA AIR**: Swarm agent hardware and control software
- **H2 AIRPORT**: Infrastructure materials and operational software

## Compliance Framework

### Aerospace Standards
- **AS9100**: Quality management traceability requirements
- **ARP4754A**: Systems development lifecycle tracking
- **DO-178C**: Software lifecycle data (for software passports)
- **DO-254**: Hardware lifecycle data (for electronic components)

### Material Compliance
- **REACH**: Registration, Evaluation, Authorisation of Chemicals
- **RoHS**: Restriction of Hazardous Substances
- **Conflict Minerals**: Dodd-Frank Section 1502 compliance
- **ITAR/EAR**: Export control material tracking

### Supply Chain Security
- **NIST SP 800-161**: Supply chain risk management
- **SLSA**: Software supply chain attestations
- **in-toto**: Cryptographic supply chain guarantees

## Workflow

### Material Passport Creation
1. Material received with manufacturer documentation
2. Inspection performed, results recorded
3. Digital passport created with all documentation
4. Passport signed and hash computed
5. Passport published to AMSDP system
6. UTCS bundle created and archived
7. Audit trail entry generated

### Software Passport Creation
1. Software build completed in CI/CD
2. SBOM generated automatically
3. Tests executed, results attached
4. Static analysis performed
5. Digital passport created with all evidence
6. Passport signed with code signing certificate
7. Attestations generated (SLSA/in-toto)
8. Passport published and archived

### Lifecycle Updates
1. Event occurs (installation, maintenance, etc.)
2. Event details captured by technician/system
3. New passport version created (linked to previous)
4. Signatures and hashes updated
5. Audit trail updated
6. Notifications sent via MAL.v1.telemetry

## Schema Definitions

Located in:
- `schemas/amsdp/material_passport.schema.json`
- `schemas/amsdp/software_passport.schema.json`
- `schemas/amsdp/lifecycle_event.schema.json`
- `schemas/amsdp/compliance_record.schema.json`

## Query API

### Material Queries
- Find by part number
- Find by serial number
- Find by material specification
- Find by manufacturer
- Find by installation location
- Find materials requiring maintenance
- Find materials approaching expiry

### Software Queries
- Find by name and version
- Find by git commit
- Find by deployment target
- Find by certification level
- Find vulnerabilities by CVE
- Find by license type
- Find dependencies

### Audit Queries
- Lifecycle history for item
- Chain of custody verification
- Compliance status report
- Pending certifications
- Supply chain trace
- Cryptographic verification

## MAL-EEM Compliance

Digital passports support MAL-EEM policy:
- **Transparency**: All lifecycle events recorded
- **Accountability**: Signatures and audit trails
- **Ethical Sourcing**: Conflict minerals tracking
- **Environmental**: Material composition and disposal
- **Dual-Use Control**: Export control classification

## IDEALE-EU Alignment

- **Intelligence**: Data-driven material and software intelligence
- **Defense**: Export control and security tracking
- **Energy**: Material sustainability and lifecycle management
- **Aerospace**: Complete aerospace material traceability
- **Logistics**: Supply chain visibility and optimization
- **ESG**: Environmental compliance, ethical sourcing, governance

## Roadmap

### H0 (0-90 days)
- [x] AMSDP architecture and schema design
- [ ] Basic passport creation workflow
- [ ] Integration with evidence plane
- [ ] Material passport prototype
- [ ] Software passport integration with SBOM

### H1 (3-9 months)
- [ ] Full lifecycle tracking implementation
- [ ] Multi-vehicle integration
- [ ] Advanced query capabilities
- [ ] Automated compliance reporting
- [ ] Mobile inspection interface

### H2 (9-24 months)
- [ ] Blockchain anchoring for passports
- [ ] AI-powered anomaly detection
- [ ] Predictive maintenance integration
- [ ] Third-party system integration
- [ ] Regulatory authority interfaces

## KPIs

- **Passport Coverage**: >95% of materials and software tracked
- **Creation Time**: <5 minutes per passport
- **Query Response**: <100ms for standard queries
- **Audit Trail Integrity**: 100% cryptographic verification
- **Compliance Rate**: >99% on scheduled audits
- **Data Completeness**: >98% of required fields populated

## Links

- [Master Whitepaper](../../README.md)
- [AAMMPP Integration](../AAMMPP-CSDB/README.md)
- [Evidence System](../../evidence/README.md)
- [Schema Definitions](../../schemas/)
- [MAL-EEM Policy](../../governance/MAL_EEM_POLICY.md)

## Layout

- `csdb/register/dmc_register.yml` — DMC catalog for AMSDP documentation
- `csdb/publication/issue_map.yml` — Publication management
- `csdb/content/` — S1000D structured content for passports
- `icd/interfaces.md` — MAL interfaces and data contracts
- `utcs/manifest.yaml` — UTCS bundle manifest

## Evidence

SBOM (SPDX-JSON), checksums, signed tags via repo CI. All passports archived in `evidence/passports/` with cryptographic verification.

---

**UTCS** bundles (Context/Content/Cache + Structure/Style/Sheet) ensure deterministic packaging.  
**Canon:** QS→FWD→UE→FE→CB→QB · **QOx = Quantum Optimizations** · **PAx OB/OFF only**.  
No proprietary data; synthetic or releasable assets only.
