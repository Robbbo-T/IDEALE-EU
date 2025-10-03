# sheet/Makefile
.PHONY: build pdf html sbom hash tag order lint

CHAPTERS_FILE := chapters.txt
ifneq ("$(wildcard $(CHAPTERS_FILE))","")
  BUILD_MD := $(shell cat $(CHAPTERS_FILE) | sed 's|content/|../content/|g' | tr '\n' ' ')
else
  BUILD_MD := ../content/*.md
endif

build: pdf html

pdf:
	@mkdir -p ../cache
	@echo "Building PDF from: $(BUILD_MD)"
	@pandoc $(BUILD_MD) -o ../cache/techpubs_overview.pdf

html:
	@mkdir -p ../cache
	@echo "Building HTML from: $(BUILD_MD)"
	@pandoc $(BUILD_MD) -o ../cache/techpubs_overview.html

sbom:
	@mkdir -p ../evidence
	@command -v syft >/dev/null 2>&1 || { echo >&2 "Error: syft is not installed. Please install syft to generate the SBOM."; exit 1; }
	@syft dir:.. -o spdx-json > ../evidence/sbom.spdx.json

hash:
	@mkdir -p ../evidence
	@sha256sum ../cache/techpubs_overview.pdf ../cache/techpubs_overview.html > ../evidence/checksums.sha256

tag:
	@git tag -s ac-rf-v0.1 -m "BWBQ100 TechPubs Advanced Copies (Research Foresights)"

order:
	@echo "Build order:" && echo "$(BUILD_MD)" | tr ' ' '\n'

# Add this lint rule (customize the echo or add a real linter)
lint:
	@echo "No linting configured."
