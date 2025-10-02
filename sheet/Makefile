# UTCS Build Makefile
# UiX Threading Context/Content/Cache & Structure/Style/Sheet

.PHONY: all clean validate bundle

all: validate bundle

validate:
	@echo "Validating UTCS manifest..."
	@test -f ../utcs/manifest.yaml || (echo "Error: utcs/manifest.yaml not found" && exit 1)
	@echo "Validating program identity..."
	@test -f ../BWB-Q100/program.identity.json || (echo "Error: BWB-Q100/program.identity.json not found" && exit 1)
	@echo "Validating lineage registry..."
	@test -f ../AMPEL360/lineage/registry.yaml || (echo "Error: AMPEL360/lineage/registry.yaml not found" && exit 1)
	@echo "✓ All validations passed"

bundle:
	@echo "Creating UTCS bundle..."
	@mkdir -p ../evidence/utcs_bundles
	@cd .. && tar czf evidence/utcs_bundles/utcs-latest.tar.gz \
		utcs/ \
		AMPEL360/lineage/ \
		AMPEL360/schemas/ \
		BWB-Q100/program.identity.json \
		content/appendix_g_ampel360_commons.md
	@echo "✓ UTCS bundle created: evidence/utcs_bundles/utcs-latest.tar.gz"

clean:
	@echo "Cleaning UTCS artifacts..."
	@rm -f ../evidence/utcs_bundles/utcs-latest.tar.gz
	@echo "✓ Cleaned"
