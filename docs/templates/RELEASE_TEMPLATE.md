# Release Notes Template

## Release vX.Y.Z

**Release Date**: YYYY-MM-DD  
**Horizon**: H0 / H1 / H2  
**Classification**: PUBLIC-DRAFT / PUBLIC / CONTROLLED

---

## Summary

Brief description of this release and its objectives.

---

## Products Included

### AMPEL360 BWB
- [ ] Feature/Update 1
- [ ] Feature/Update 2

### GAIA SPACE
- [ ] Feature/Update 1
- [ ] Feature/Update 2

### GAIA AIR / IDRO-HYDROROBOT / EU Defense Wall Swarm
- [ ] Feature/Update 1
- [ ] Feature/Update 2

### Digital Platform
- [ ] Feature/Update 1
- [ ] Feature/Update 2

### H₂/LH₂ Airport
- [ ] Feature/Update 1
- [ ] Feature/Update 2

### Sustainable Finance
- [ ] Feature/Update 1
- [ ] Feature/Update 2

---

## Evidence & Provenance

Per **Section 5** of the Master Whitepaper, this release includes:

### 1. Signed Git Tag
```bash
git tag -v vX.Y.Z
```

### 2. SBOM (Software Bill of Materials)
- **Location**: `evidence/sboms/sbom-vX.Y.Z.spdx.json`
- **Format**: SPDX 2.3
- **Hash**: SHA-256 checksum in `evidence/hashes/`

### 3. UTCS Bundle
- **Location**: `evidence/utcs_bundles/utcs-vX.Y.Z.yaml`
- **Threading**: Context/Content/Cache + Structure/Style/Sheet
- **Hash**: SHA-256 checksum

### 4. DOI (Digital Object Identifier)
- **DOI**: 10.XXXXX/XXXXXX
- **Repository**: Zenodo / other
- **URL**: https://doi.org/...

### 5. Demo Artifacts
- **Videos/Logs**: `evidence/videos_logs/`
- **Hashes**: SHA-256 checksums for all artifacts

### 6. Attestations
- **SLSA Level**: 1 / 2 / 3
- **in-toto Layout**: `evidence/attestations/`
- **Build Provenance**: Link to CI/CD logs

---

## Gate Compliance

### FCR-1 Criteria
- [x] SBOM generated and signed
- [x] Videos/logs uploaded with hashes
- [x] DOI published
- [x] Signed git tag
- [x] UTCS bundle created

### FCR-2 Criteria (if applicable)
- [ ] Reproducibility demonstrated
- [ ] Test coverage ≥ X%
- [ ] Attestations complete
- [ ] Two external validations obtained

---

## Changes

### New Features
- Feature 1: Description
- Feature 2: Description

### Improvements
- Improvement 1: Description
- Improvement 2: Description

### Bug Fixes
- Fix 1: Description
- Fix 2: Description

### Documentation
- Doc 1: Description
- Doc 2: Description

---

## Breaking Changes

List any breaking changes and migration guidance:

1. **Change 1**: Description and migration steps
2. **Change 2**: Description and migration steps

---

## KPIs and Metrics

### AMPEL360 BWB
- **Tracking Error**: X.XX units
- **Simulated Energy**: X.XX kWh
- **Stability Margins**: X.XX%
- **Simulated MTBF**: XXXX hours

### GAIA SPACE
- **Downlink Latency**: X.XX ms
- **Packet Integrity**: XX.X%
- **Mission Success Rate**: XX.X%

### Swarms
- **Mean Pairwise Distance**: X.XX m
- **Collisions**: 0
- **Mission Completion**: XX.X%

### Digital Platform
- **Bus Latency p50/p95**: X.X / XX.X ms
- **Uptime**: XX.XX%
- **MTTR**: X.XX hours

### H₂/LH₂ Airport
- **Turnaround Time**: XX minutes
- **Boil-off Losses**: X.X%
- **Capacity**: XX vehicles/hour

### Sustainable Finance
- **% Funds to Service/R&D**: XX.X%
- **Volatility**: ≤ X.X%
- **SLO Compliance**: XX.X%

---

## Standards Compliance

- **ARP4754A**: Systems development (lite)
- **ARP4761**: Safety assessment (lite)
- **DO-178C**: Software Level C/D (indicative)
- **S1000D**: Technical documentation
- **AS9100**: Quality management (lite)

---

## IDEALE-EU Impact

### Climate/Energy
- Per-mission energy reduction: XX.X%
- H₂/LH₂ integration: status
- Carbon payback: XX months/years

### Safety
- Avoided incidents: X
- MTTD improvement: XX.X%
- Mission integrity: XX.X%

### Socio-Economic
- Cost-per-service: €XXX
- Accessibility: metric
- % funds to public R&D: XX.X%

### ESG-EU Tags
- Tag 1
- Tag 2
- Tag 3

---

## Dependencies

### Internal
- Product A: vX.Y.Z
- Product B: vX.Y.Z

### External
- Library 1: vX.Y.Z
- Library 2: vX.Y.Z

---

## Known Issues

1. **Issue 1**: Description and workaround
2. **Issue 2**: Description and workaround

---

## Next Steps

### H0+1 / H1 / H2
- Milestone 1
- Milestone 2
- Milestone 3

---

## Verification & Reproducibility

### One-Click Reproduction
```bash
# Clone repository
git clone https://github.com/Robbbo-T/IDEALE-EU.git
cd IDEALE-EU

# Checkout release
git checkout vX.Y.Z

# Verify signature
git tag -v vX.Y.Z

# Run reproduction script
./scripts/reproduce-vX.Y.Z.sh
```

### Environment
- OS: Ubuntu 22.04 / Other
- Tools: List of required tools and versions
- Dependencies: See SBOM

---

## Contributors

Thank you to all contributors for this release:
- Contributor 1
- Contributor 2

---

## How to Cite

> Pelliccia, A., et al. (2025). *ASI-T2 Ecosystem: Release vX.Y.Z*. DOI: 10.XXXXX/XXXXXX.

Machine-readable citation: See `CITATION.cff`

---

## License

This release is distributed under [LICENSE] with **MAL-EEM** ethical use restrictions. See [LICENSE.md] for full terms.

---

## Contact

- Issues: https://github.com/Robbbo-T/IDEALE-EU/issues
- Discussions: https://github.com/Robbbo-T/IDEALE-EU/discussions
- Email: [MAINTAINER_EMAIL]

---

*This release follows the ASI-T2 Master Whitepaper v0.1.0*
