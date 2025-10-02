## Title
[Replace with a concise, descriptive title for your PR]

## Summary
- Adds `content/appendix_f_glossary.md` (canon: QS→FWD→UE→FE→CB→QB; UTCS; QOx; ONB/OUT)
- Updates `utcs/manifest.yaml` to include glossary
- Adds `sheet/chapters.txt` to enforce build order (glossary last)
- Upgrades `sheet/Makefile` to read ordered chapters
- CI: adds UTCS build & evidence checks

## Evidence (attach or link)
- [ ] `cache/techpubs_overview.pdf` built
- [ ] `evidence/sbom.spdx.json` generated
- [ ] `evidence/checksums.sha256` updated
- [ ] Tag prepared: `ac-rf-v0.1`

## Canon & Policy
- [x] **PAx orientation:** ONB/OUT only
- [x] **QOx:** Quantum Optimizations
- [x] **UTCS:** UiX Threading Context/Content/Cache & Structure/Style/Sheet
- [x] **Bridge:** QS→FWD→UE→FE→CB→QB
- [x] **MAL-EEM:** non-weaponisation, decision logging

## Reviewers
- Architecture (MAL/TFA)
- TechPubs (S1000D/ATA)
- Evidence (UTCS/SBOM/DOI)

## Checklist
- [ ] Paths follow TFA grammar and ATA/S1000D structure
- [ ] No proprietary data; synthetic examples only
- [ ] No "OB/OFF"; only ONB/OUT appears
