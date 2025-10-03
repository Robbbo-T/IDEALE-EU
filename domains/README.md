# TFA V2 Domains

## Overview

This directory contains the canonical domain roots for the ASI-T2 ecosystem, following **TFA V2 Architecture** as specified in Section 3.0 of the Master Whitepaper.

## Normative Rule

> **Domain and layer codes MUST be ALL-CAPS under strict TFA path grammar.**

## Domain Codes (Canonical)

### AAA - Airframes, Aerodynamics & Airworthiness
Safety and compliance for aircraft structures and aerodynamics.
- **Path**: `domains/AAA/`
- **Focus**: Structural design, aerodynamic performance, safety certification
- **Standards**: CS-25, FAR Part 25, ARP4754A, ARP4761

### AAP - Airport Adaptable Platforms
Airport infrastructure and ground operations.
- **Path**: `domains/AAP/`
- **Focus**: Airport facilities, ground equipment, operations
- **Standards**: ICAO Annex 14, ACI guidelines

### CCC - Cockpit, Cabin & Cargo
Interior systems and human factors.
- **Path**: `domains/CCC/`
- **Focus**: Flight deck, passenger cabin, cargo systems
- **Standards**: CS-25, DO-178C, human factors standards

### CQH - Cryogenics, Quantum & H$_2$
Hydrogen systems and quantum technologies.
- **Path**: `domains/CQH/`
- **Focus**: H$_2$/LH$_2$ systems, cryogenic storage, quantum optimization
- **Standards**: ISO 19880, NFPA 2, quantum computing best practices

### DDD - Drainage, Dehumidification & Drying
Water management and moisture control.
- **Path**: `domains/DDD/`
- **Focus**: Drainage systems, dehumidification, corrosion prevention
- **Standards**: CS-25, aerospace environmental control

### EDI - Electronics & Digital Instruments
Electronic systems and avionics.
- **Path**: `domains/EDI/`
- **Focus**: Avionics, flight instruments, electronic systems
- **Standards**: DO-178C, DO-254, DO-160

### EEE - Electrical, Endotransponders & Circulation
Electrical power and distribution.
- **Path**: `domains/EEE/`
- **Focus**: Electrical generation, distribution, transponders
- **Standards**: CS-25, SAE aerospace electrical standards

### EER - Environmental, Emissions & Remediation
Environmental impact and sustainability.
- **Path**: `domains/EER/`
- **Focus**: Emissions reduction, environmental compliance, remediation
- **Standards**: ICAO Annex 16, EASA environmental standards

### IIF - Industrial Infrastructure & Facilities
Manufacturing and industrial facilities.
- **Path**: `domains/IIF/`
- **Focus**: Production facilities, tooling, industrial processes
- **Standards**: AS9100, ISO 9001

### IIS - Information & Intelligence Systems
Cybersecurity, defense, and information systems.
- **Path**: `domains/IIS/`
- **Focus**: Cybersecurity, defense systems, data intelligence
- **Standards**: ISO 27001, defense standards (as applicable)

### LCC - Linkages, Control & Communications
Control systems and communications.
- **Path**: `domains/LCC/`
- **Focus**: Flight controls, communication systems, data links
- **Standards**: DO-178C, ARINC specifications, RTCA standards

### LIB - Logistics, Inventory & Blockchain
Supply chain and logistics.
- **Path**: `domains/LIB/`
- **Focus**: Supply chain, inventory management, blockchain traceability
- **Standards**: ISO 28000, supply chain standards

### MEC - Mechanical Systems Modules
Mechanical systems and components.
- **Path**: `domains/MEC/`
- **Focus**: Hydraulics, landing gear, mechanical actuation
- **Standards**: CS-25, SAE aerospace mechanical standards

### OOO - OS, Ontologies & Office Interfaces
Operating systems and software frameworks.
- **Path**: `domains/OOO/`
- **Focus**: Operating systems, data models, interfaces
- **Standards**: POSIX, software architecture standards

### PPP - Propulsion & Fuel Systems
Propulsion and fuel systems.
- **Path**: `domains/PPP/`
- **Focus**: Engines, fuel systems, propulsion integration
- **Standards**: CS-E, EASA/FAA engine certification

## TFA Bridge Grammar

The complete path grammar is:

```
domains/<DOMAIN_CODE>/ATA-XX/<XX-XX>_<DESCRIPTION>/S1000D/<LAYER>/<PACK>/<SUBPACK>
```

### Components
- **DOMAIN_CODE**: One of the 15 ALL-CAPS codes above
- **ATA-XX**: ATA chapter (e.g., ATA-57 for Wings)
- **XX-XX_DESCRIPTION**: Work breakdown (e.g., 57-10_Wing_Primary_Structure)
- **S1000D**: Structured technical documentation
- **LAYER**: TFA flow layer (QS, FWD, UE, FE, CB, QB)
- **PACK**: CAx, QOx, or PAx
- **SUBPACK**: Specific content (CAD, CAE, OPT, etc.)

## TFA Layers

- **QS** (Primordial) - Primary origin and reference of state
- **FWD** (Prediction/Probability) - Predictive/probabilistic dynamics
- **UE** (Unit Element/Collapse) - Atomic execution units
- **FE** (Federation Entanglement/Contracting) - Federated systems with SLOs
- **CB** (Classical Bit/Companion Binary) - Deterministic artifacts
- **QB** (Bit Cubic) - Non-quantum discrete 3D state lifting

## Packs

- **CAx** - Computer-Aided X (CAD/CAE/CAM/CAT/CFD)
- **QOx** - Quantum Optimizations (variational/annealing/quantum-inspired)
- **PAx** - Packaging & Assemblies (ONB=Onboard, OUT=Outboard)

## CI Gates

Non-conforming paths **fail** FCR-1/FCR-2 per the SSoT (ASI-T · Universal Injection Prompt v1).

## Example Structure

See [BWB-Q100/domains/AAA/](../BWB-Q100/domains/AAA/) for a complete example following this grammar.

## Links

- [Master Whitepaper](../README.md)
- [BWB-Q100 Example](../BWB-Q100/)
- [Product Specification Template](../schemas/PRODUCT_SPEC_TEMPLATE.yaml)
