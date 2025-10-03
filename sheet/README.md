# Sheet — Build System

Build and validation system for UTCS federation and CSDB platforms.

## Targets

- `make build-all` — Validate all 6 platform UTCS manifests
- `make csdb-lint` — Enforce canon compliance (OB/OFF, QOx, AMPEL360 commons)
- `make utcs-federation` — Validate federation index
- `make help` — Show available targets

## Canon Enforcement

The linting system ensures:
- **PAx orientation**: Only OB/OFF (not ONB/OUT)
- **QOx definition**: Quantum Optimizations (not "Quality Operations")
- **AMPEL360 commons**: No app code directories (src/app/services/cmd)

## Usage

From repository root:
```bash
make -C sheet build-all
make -C sheet csdb-lint
make -C sheet utcs-federation
```

## CI Integration

Used by `.github/workflows/utcs-ci.yml` for automated validation on PRs and pushes.
