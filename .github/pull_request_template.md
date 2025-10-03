
## Title

Digital Platforms :: Six CSDBs + UTCS Federation (AMPEL360 · GAIA-AIR · GAIA-SPACE · H2-AIRPORT · BITFINANCE · INTELLIGENCE-SECRETARY)

## Summary

* Add six S1000D **CSDB** skeletons under `platforms/*-CSDB`
* Add **UTCS federation** index at `utcs/federation.yaml`
* Preserve canon: **QS→FWD→UE→FE→CB→QB · UTCS · QOx=Quantum Optimizations · PAx=ONB/OUT**
* **AMPEL360** remains commons progenitor (**no app code**)

## Changes

* `platforms/AMPEL360-CSDB/` … `platforms/INTELLIGENCE-SECRETARY-CSDB/`

  * `content/`, `schema/`, `publication/`, `illustrations/`, `exchange/`, `README.md` (S1000D skeletons)
* `utcs/federation.yaml` (federates the six CSDBs; paths for **cache/structure/sheet**)
* `utcs/manifest.yaml` (+federation entry)
* `evidence/ci/` (lint rules, federation validator)
* `sheet/Makefile` (targets to validate federation + optional root build)

## Evidence

* [ ] CI federation & lints passed
* [ ] `evidence/sbom.spdx.json` generated
* [ ] (Optional) root PDF/HTML built to `cache/`

## Canon & Policy Checks

* [x] **Bridge:** QS→FWD→UE→FE→CB→QB
* [x] **UTCS:** UiX Threading **Context/Content/Cache** and **Structure/Style/Sheet**
* [x] **QOx:** Quantum Optimizations (no “Quality Operations”)
* [x] **PAx orientation:** **OB/OFF** only (no “ONB/OUT”)
* [x] **AMPEL360:** commons semantics; **no app code** (`src/`, `app/`, `services/`, `cmd/` absent)

## CI / Automation

* Validate each CSDB skeleton (presence of S1000D dirs, required stubs)
* Validate `utcs/federation.yaml` (referenced paths exist; resolve under UTCS cache/structure/sheet)
* Lint UTCS canon (Bridge/QOx/PAx/UTCS defs) and TFA path grammar
* Generate SBOM for federation + CSDB tooling; update checksums on artifacts
* Fail on any canon violation or broken path

## Reviewers

* Architecture (MAL/TFA)
* TechPubs (S1000D/ATA)
* Evidence (UTCS/SBOM/DOI)

## Checklist

* [ ] Paths follow **TFA grammar** and ATA/S1000D structure
* [ ] No proprietary data; synthetic examples only
* [ ] UTCS federation links resolve (cache/structure/sheet)
* [ ] SBOM + checksums updated
* [ ] AMPEL360 contains **no app code**

---


