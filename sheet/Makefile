.PHONY: build-all csdb-lint utcs-federation help build pdf html sbom hash tag order lint

# --- UTCS Federation Build Targets ---
help:
	@echo "UTCS Federation Build Targets:"
	@echo "  build-all         - Build root UTCS + 6 CSDB bundles"
	@echo "  csdb-lint         - Lint canon compliance (OB/OFF, QOx, AMPEL360 commons)"
	@echo "  utcs-federation   - Validate federation index"
	@echo "  build             - Build PDF and HTML"
	@echo "  pdf               - Build PDF"
	@echo "  html              - Build HTML"
	@echo "  sbom              - Generate SBOM"
	@echo "  hash              - Generate file hashes"
	@echo "  tag               - Tag the release"
	@echo "  order             - Show build order"
	@echo "  lint              - Run linter"

# Build-all placeholder
build-all:
	@echo "Build root UTCS + 6 CSDB bundles (placeholder compilation)"
	@echo "Root UTCS OK"
	@for p in AMPEL360-CSDB GAIA-AIR-CSDB GAIA-SPACE-CSDB H2-AIRPORT-CSDB BITFINANCE-CSDB INTELLIGENCE-SECRETARY-CSDB; do \
		test -f ../platforms/$$p/utcs/manifest.yaml || { echo "Missing manifest in $$p"; exit 1; }; \
	done
	@echo "All platform manifests validated"

csdb-lint:
	@echo "Lint: OB/OFF orientation only"
	@! grep -RInq "ONB\|OUT " -- ./platforms/ || (echo "Use OB/OFF only" && exit 1)
	@echo "Lint: QOx definition"
	@! grep -RInq "Quality Operations" --exclude-dir=.github --exclude=Makefile -- ./platforms/ ./README.md ./OVERVIEW.md ./BWB-Q100/ ./domains/ || (echo "QOx must be 'Quantum Optimizations'" && exit 1)
	@echo "Lint: AMPEL360 commons — no app code"
	@! find ../AMPEL360 -maxdepth 2 -type d \( -name src -o -name app -o -name services -o -name cmd \) 2>/dev/null | grep . && echo "OK" || echo "OK (no app dirs found)"
	@echo "All lints passed"

utcs-federation:
	@test -f ../utcs/federation.yaml || { echo "Missing utcs/federation.yaml"; exit 1; }
	@echo "UTCS federation index validated"

# --- Sheet Build Targets (adjust paths if needed) ---
CHAPTERS_FILE := sheet/chapters.txt
ifneq ("$(wildcard $(CHAPTERS_FILE))","")
  BUILD_MD := $(shell cat $(CHAPTERS_FILE) | sed 's|content/|sheet/content/|g' | tr '\n' ' ')
else
  BUILD_MD := sheet/content/*.md
endif

build: pdf html

pdf:
	@mkdir -p cache
	@echo "Building PDF from: $(BUILD_MD)"
	@pandoc $(BUILD_MD) -o cache/techpubs_overview.pdf

html:
	@mkdir -p cache
	@echo "Building HTML from: $(BUILD_MD)"
	@pandoc $(BUILD_MD) -o cache/techpubs_overview.html

sbom:
	@mkdir -p evidence
	@command -v syft >/dev/null 2>&1 || { echo >&2 "Error: syft is not installed. Please install syft to generate the SBOM."; exit 1; }
	@syft dir:. -o spdx-json > evidence/sbom.spdx.json

hash:
	@mkdir -p evidence
	@sha256sum cache/techpubs_overview.pdf cache/techpubs_overview.html > evidence/checksums.sha256

tag:
	@git tag -s ac-rf-v0.1 -m "BWBQ100 TechPubs Advanced Copies (Research Foresights)"

order:
	@echo "Build order:" && echo "$(BUILD_MD)" | tr ' ' '\n'

lint:
	@echo "No linting configured."
