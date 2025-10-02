# Appendix G — AMPEL360 as Commons (Progenitor)

**Definition (canon):** `AMPEL360/` is the **common source** from which programs **emancipate/evolve** as distinct identities. These identities are (i) **ontologically linked** (functions/taxonomies shared), and (ii) **deontologically bound** to the **source data** (duties and evidence). No app-level code resides under `AMPEL360/`.

**Allowed:** `ontology/`, `deontology/`, `source_data/`, `schemas/`, `contracts/`, optional `utcs/`.

**Forbidden:** app code, build artifacts, per-program logic.

## Lineage

Identities must declare `program.identity.json` and appear in `AMPEL360/lineage/registry.yaml`. UTCS manifests MUST reference the commons where applicable.

## Program Identity Schema

Each identity emancipated from AMPEL360 commons must:

1. **Declare product_id**: Unique identifier (e.g., `BWB-Q100`)
2. **Reference emancipated_from**: Always `AMPEL360`
3. **List ontological_functions**: Shared concepts/functions used (e.g., `airframe.wing.primary_structure`)
4. **Bind deontologically**: Source data references with duties (e.g., `retain-hash-and-provenance`)
5. **Reference UTCS**: Manifests that bind the commons artifacts

## Example: BWB-Q100

```json
{
  "product_id": "BWB-Q100",
  "name": "AMPEL360 BWB-Q100 (H2)",
  "emancipated_from": "AMPEL360",
  "ontological_functions": [
    "airframe.wing.primary_structure",
    "fuel.h2.lh2.turnaround",
    "avionics.ima.partitioning"
  ],
  "deontological_bindings": [
    {
      "source_data_ref": "AMPEL360/source_data/h2_materials_v1.csv",
      "duties": [
        "retain-hash-and-provenance",
        "do-not-redist-nonreleasable",
        "update-utcs-on-change"
      ]
    }
  ],
  "utcs_refs": ["utcs/manifest.yaml"]
}
```

## Canon Compliance

- **Thread/Function Flow**: QS→FWD→UE→FE→CB→QB maintained
- **UTCS**: UiX Threading Context/Content/Cache & Structure/Style/Sheet enforced
- **QOx**: Quantum Optimizations where applicable
- **PAx**: Orientation markers OB/OFF only (no ONB/OUT)
