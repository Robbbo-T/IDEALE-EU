# UTCS — UiX Threading & Federation

This directory contains the UTCS (UiX Threading Context/Content/Cache & Structure/Style/Sheet) federation for the Digital Platforms.

## Files

- **federation.yaml** — Global UTCS federation index listing all six platform CSDBs
- **manifest.yaml** — Root UTCS bundle manifest for IDEALE-EU

## Federation

The federation.yaml defines the bridge (QS→FWD→UE→FE→CB→QB) and lists six platforms:
1. AMPEL360-CSDB
2. GAIA-AIR-CSDB
3. GAIA-SPACE-CSDB
4. H2-AIRPORT-CSDB
5. BITFINANCE-CSDB
6. INTELLIGENCE-SECRETARY-CSDB

## Policy

- **PAx orientation**: OB/OFF only
- **QOx**: Quantum Optimizations
- **AMPEL360 commons**: Progenitor (ontology/deontology/source_data)

## Usage

The federation is validated by:
```bash
make -C sheet utcs-federation
```

Each platform has its own UTCS manifest at `platforms/<PLATFORM>/utcs/manifest.yaml`.
