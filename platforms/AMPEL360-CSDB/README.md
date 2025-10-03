# AMPEL360-CSDB · CSDB (S1000D)

This is the **S1000D CSDB** for `AMPEL360-CSDB`, part of the UTCS-federated Digital Platforms.

This platform provides common **airframes/avionics** technical pubs for AMPEL360 identities (BWB-Q100 etc.), tied to **AMPEL360 commons** (ontology/deontology/source_data).

- **UTCS** bundles (Context/Content/Cache + Structure/Style/Sheet) ensure deterministic packaging.
- **Canon:** QS→FWD→UE→FE→CB→QB · **QOx = Quantum Optimizations** · **PAx OB/OFF only**.
- No proprietary data; synthetic or releasable assets only.

## Layout

- `csdb/register/dmc_register.yml` — DMC catalog (SNS, Issue, Lang).
- `csdb/publication/issue_map.yml` — which DMCs go into which PMs.
- `csdb/content/` — DMs grouped by SNS.
- `icd/interfaces.md` — external interfaces (MAL topics, data contracts).
- `utcs/manifest.yaml` — UTCS bundle for this CSDB.

## Evidence

SBOM (SPDX-JSON), checksums, signed tag via repo CI.
