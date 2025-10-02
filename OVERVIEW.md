# ASI-T2 Repository Overview

**Quick Navigation Guide**

## What is ASI-T2?

ASI-T2 is a system-of-systems (SoS) spanning aircraft, space, multi-agent swarms, digital infrastructure, hydrogen-airport operations, and sustainable finance - all engineered to be verifiable, reproducible, and ethically governed.

Read the full [Master Whitepaper](README.md) for complete details.

## Quick Start

### For Contributors
1. Read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
2. Read [CONTRIBUTING.md](CONTRIBUTING.md)
3. Review [Master Whitepaper](README.md)
4. Pick an area to contribute

### For Researchers
1. Review [Master Whitepaper](README.md)
2. Check [evidence/](evidence/) for release artifacts
3. Read product-specific READMEs
4. See [CITATION.cff](CITATION.cff) for citation

### For Auditors
1. Review [evidence/HALL_OF_RECORDS.md](evidence/HALL_OF_RECORDS.md)
2. Verify release signatures and SBOMs
3. Check [governance/MAL_EEM_POLICY.md](governance/MAL_EEM_POLICY.md)
4. Review compliance documentation

## Repository Structure

```
.
├── README.md                          # Master Whitepaper
├── CITATION.cff                       # Machine-readable citation
├── CODE_OF_CONDUCT.md                 # Community standards
├── CONTRIBUTING.md                    # Contribution guide
├── LICENSE.md                         # License (TBD)
│
├── AMPEL360/                          # BWB aircraft platform
├── AMPEL360_AIR_TRANSPORT/            # Air transport integration
├── AMPEL_360PLUS/                     # Space tourism variant
│
├── BWB-Q100/                          # Technical implementation
│   └── domains/AAA/ata/               # ATA-structured technical docs
│
├── GAIA_SPACE/                        # Satellite constellation
├── GAIA_AIR/                          # Aerial swarm
├── IDRO_HYDROROBOT/                   # Aquatic swarm
├── EU_DEFENSE_WALL_SWARM/             # Ground defense swarm
│
├── DIGITAL_PLATFORM/                  # Infrastructure services
├── H2_AIRPORT/                        # Hydrogen airport operations
├── SUSTAINABLE_FINANCE/               # Financial system
│
├── domains/                           # 15 canonical domain roots
│   ├── AAA/  AAP/  CCC/  CQH/  DDD/  # (ALL-CAPS required)
│   ├── EDI/  EEE/  EER/  IIF/  IIS/
│   └── LCC/  LIB/  MEC/  OOO/  PPP/
│
├── schemas/                           # Data schemas and templates
│   └── PRODUCT_SPEC_TEMPLATE.yaml
│
├── evidence/                          # Evidence & provenance
│   ├── sboms/                         # Software Bills of Materials
│   ├── attestations/                  # SLSA/in-toto attestations
│   ├── hashes/                        # SHA-256 checksums
│   ├── utcs_bundles/                  # UTCS threading bundles
│   ├── videos_logs/                   # Demo artifacts
│   ├── README.md
│   └── HALL_OF_RECORDS.md             # Release index
│
├── governance/                        # Governance documents
│   └── MAL_EEM_POLICY.md              # Ethics framework
│
└── docs/                              # Additional documentation
    └── templates/
        └── RELEASE_TEMPLATE.md
```

## Key Concepts

### TFA V2 Architecture
The **Tiered Functional Architecture V2** organizes everything with:
- **Domains**: 15 ALL-CAPS codes (AAA, AAP, CCC, etc.)
- **Layers**: QS → FWD → UE → FE → CB → QB
- **Packs**: CAx, QOx, PAx

See [Master Whitepaper Section 3](README.md#3-tfa-v2-architecture)

### MAL (Master Application Layer)
Common services for messaging, telemetry, health, logging, and zero-trust basics.

See [Master Whitepaper Section 3.4](README.md#34-mal-master-application-layerlogic)

### UTCS Bundling
**UiX Threading Context/Content/Cache & Structure/Style/Sheet** for deterministic packaging.

See [Master Whitepaper Section 5](README.md#5-evidence--provenance-qs--utcs-bundling)

### MAL-EEM
**Master Application Layer - Ethics & Empathy Module** provides ethical governance.

See [governance/MAL_EEM_POLICY.md](governance/MAL_EEM_POLICY.md)

### IDEALE-EU
**Intelligence, Defense, Energy, Aerospace, Logistics, ESG (EU)** - the strategic framework.

See [Master Whitepaper](README.md)

## Products

| Product | Status | Description |
|---------|--------|-------------|
| [AMPEL360](AMPEL360/) | H0 SIL | Blended-wing-body aircraft |
| [GAIA SPACE](GAIA_SPACE/) | H0 Sim | Satellite constellation |
| [GAIA AIR](GAIA_AIR/) | H0 10-20 | Aerial swarm |
| [IDRO-HYDROROBOT](IDRO_HYDROROBOT/) | H0 Design | Aquatic swarm |
| [EU Defense Wall](EU_DEFENSE_WALL_SWARM/) | H0 Design | Ground defense |
| [360PLUS](AMPEL_360PLUS/) | H0 Demo | Space tourism |
| [Digital Platform](DIGITAL_PLATFORM/) | H0 Design | Infrastructure |
| [H₂ Airport](H2_AIRPORT/) | H0 Model | Hydrogen operations |
| [Sustainable Finance](SUSTAINABLE_FINANCE/) | H0 Design | Financial system |

## Roadmap

- **H0 (0-90 days)**: Foundation and demonstrations
- **H1 (3-9 months)**: Integration and scaling
- **H2 (9-24 months)**: Cross-integration and audits

See [Master Whitepaper Section 8](README.md#8-roadmap--gates)

## Standards & Compliance

- **Aerospace**: ARP4754A, ARP4761, DO-178C, DO-254
- **Space**: ECSS standards
- **Quality**: AS9100-lite
- **Export**: EU 2021/821, ITAR/EAR
- **Documentation**: S1000D, ATA chapters

## Evidence & Reproducibility

All releases include:
1. Signed git tag
2. SBOM (Software Bill of Materials)
3. UTCS bundle
4. DOI (Digital Object Identifier)
5. Demo videos/logs with hashes

See [evidence/](evidence/) directory

## How to Cite

```bibtex
@software{pelliccia2025asit2,
  author = {Pelliccia, Amedeo},
  title = {ASI-T2 Ecosystem: Master Whitepaper},
  year = {2025},
  version = {0.1.0},
  note = {DOI: TBA}
}
```

See [CITATION.cff](CITATION.cff) for machine-readable format.

## Getting Help

- **Issues**: https://github.com/Robbbo-T/IDEALE-EU/issues
- **Discussions**: https://github.com/Robbbo-T/IDEALE-EU/discussions
- **Email**: [CONTACT_EMAIL] (to be established)

## License

See [LICENSE.md](LICENSE.md) - To be finalized before v0.1.0

---

**IDEALE-EU: Guiding strategy, structure, threading, and evidence across foundational EU nodes.**
