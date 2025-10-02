# Evidence & Provenance

## Overview

This directory contains evidence artifacts for verifiable, reproducible, and auditable releases of the ASI-T2 ecosystem, following **Section 5** of the Master Whitepaper.

## Directory Structure

```
evidence/
├── sboms/              # Software Bills of Materials (SPDX, CycloneDX)
├── attestations/       # SLSA/in-toto attestations
├── hashes/             # SHA-256 hashes and checksums
├── videos_logs/        # Demo videos and simulation logs
└── utcs_bundles/       # UTCS threading bundles
```

## Minimal Evidence Pipeline

Per **Section 5.1** of the Master Whitepaper, each release includes:

### 1. Signed Git Tag
```bash
git tag -s vX.Y.Z -m "Release version X.Y.Z"
```

### 2. SBOM Generation
```bash
syft dir:. -o spdx-json > evidence/sboms/sbom-vX.Y.Z.spdx.json
```

### 3. Hash Computation
```bash
sha256sum <artifact> > evidence/hashes/<artifact>.sha256
```

### 4. UTCS Bundle
UTCS (UiX Threading Context/Content/Cache & Structure/Style/Sheet) bundle manifest:
- Context: Domain, product, version
- Content: Artifact references
- Cache: Dependencies and versions
- Structure: File organization
- Style: Presentation standards
- Sheet: Output formats

### 5. DOI Publication
- Publish to Zenodo or similar repository
- Update `RELEASE.md` with DOI
- Link to Hall of Records

### 6. Demo Artifacts
- Upload videos/logs with hashes
- Include simulation seeds
- Document reproduction steps

## Hall of Records

The Hall of Records indexes all releases with:
- DOI
- Signed git tag
- SBOM location
- UTCS bundle manifest
- Attestations
- Audit guide

## Reproducibility

Per **Section 5.2**, all releases include:
- One-click reproduction scripts
- Documented simulation seeds
- SLSA-lite/in-toto attestations
- Build environment specifications

## File Naming Convention

- SBOMs: `sbom-v{VERSION}.spdx.json` or `sbom-v{VERSION}.cyclonedx.json`
- Hashes: `{ARTIFACT_NAME}.sha256`
- Attestations: `attestation-v{VERSION}.intoto.jsonl`
- UTCS Bundles: `utcs-v{VERSION}.yaml`
- Videos/Logs: `{PRODUCT}-{TEST}-{DATE}.{ext}` with accompanying `.sha256`

## Verification

To verify an artifact:
```bash
sha256sum -c evidence/hashes/artifact.sha256
```

To verify a signed tag:
```bash
git tag -v vX.Y.Z
```

## Standards

- **SPDX**: Software Package Data Exchange for SBOM
- **CycloneDX**: Bill of Materials standard
- **SLSA**: Supply-chain Levels for Software Artifacts
- **in-toto**: Framework for securing software supply chains

## Links

- [Master Whitepaper](../README.md)
- [RELEASE.md](../docs/RELEASE.md) (when created)
