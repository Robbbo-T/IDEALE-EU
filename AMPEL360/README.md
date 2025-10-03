# AMPEL360 · Commons (Progenitor)

**Role:** This directory is the **common source** from which programs **emancipate/evolve** as distinct identities.  
- **Ontological linkage (between programs):** shared concepts, taxonomies, functions, and DSLs that ensure semantic coherence across identities.  
- **Deontological linkage (to source data):** duties/constraints for using, curating, and versioning source data with evidence (UTCS).  
- **No app code here.** Only ontology, deontology, schemas, contracts, and curated source data.

## Allowed subfolders
- `ontology/` — concepts, taxonomies, DSLs, mappings.
- `deontology/` — duties, policies, obligations; data-usage rules.
- `source_data/` — curated source datasets (hashes + provenance).
- `schemas/` — JSON/YAML schemas (e.g., program.identity).
- `contracts/` — ICDs/base contracts reused by identities.
- `utcs/` — manifests that bind commons artifacts (optional).

Programs (e.g., `BWB-Q100/`) reference these commons via **lineage** and **UTCS**.
