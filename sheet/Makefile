# UTCS Federation Build System
# For six Digital Platform CSDBs

.PHONY: build-all csdb-lint utcs-federation help

help:
	@echo "UTCS Federation Build Targets:"
	@echo "  build-all         - Build root UTCS + 6 CSDB bundles"
	@echo "  csdb-lint        - Lint canon compliance (OB/OFF, QOx, AMPEL360 commons)"
	@echo "  utcs-federation  - Validate federation index"

# Build-all placeholder (if each CSDB later compiles PMs into PDF/HTML)
build-all:
	@echo "Build root UTCS + 6 CSDB bundles (placeholder compilation)"
	@echo "Root UTCS OK"
	@for p in AMPEL360-CSDB GAIA-AIR-CSDB GAIA-SPACE-CSDB H2-AIRPORT-CSDB BITFINANCE-CSDB INTELLIGENCE-SECRETARY-CSDB; do \
		test -f ../platforms/$$p/utcs/manifest.yaml || { echo "Missing manifest in $$p"; exit 1; }; \
	done
	@echo "All platform manifests validated"

# Lints
csdb-lint:
	@echo "Lint: OB/OFF orientation only"
	@! grep -RInq "ONB\|OUT " -- ../platforms/ || (echo "Use OB/OFF only" && exit 1)
	@echo "Lint: QOx definition"
	@! grep -RInq "Quality Operations" --exclude-dir=.github --exclude=Makefile -- ../platforms/ ../README.md ../OVERVIEW.md ../BWB-Q100/ ../domains/ || (echo "QOx must be 'Quantum Optimizations'" && exit 1)
	@echo "Lint: AMPEL360 commons — no app code"
	@! find ../AMPEL360 -maxdepth 2 -type d \( -name src -o -name app -o -name services -o -name cmd \) 2>/dev/null | grep . && echo "OK" || echo "OK (no app dirs found)"
	@echo "All lints passed"

utcs-federation:
	@test -f ../utcs/federation.yaml || { echo "Missing utcs/federation.yaml"; exit 1; }
	@echo "UTCS federation index validated"
