# ASI-T2 Build System - UTCS Integration
# Makefile for Agency /the_garden and PRINT carpet trees

.PHONY: print-carpet dot pdf-carpet lint-agency

print-carpet:
	@mkdir -p ../cache
	cd .. && python3 print/scripts/generate_carpet_trees.py --spec print/specs/carpet_trees.yaml --out-dot cache/carpet_trees.dot
	@echo "DOT generated at cache/carpet_trees.dot"

pdf-carpet: print-carpet
	@which dot >/dev/null || (echo "Graphviz not installed" && exit 1)
	cd .. && dot -Tpdf cache/carpet_trees.dot -o cache/carpet_trees.pdf
	@echo "PDF generated at cache/carpet_trees.pdf"

lint-agency:
	@test -f ../agency/the_garden/curation/catalog.yaml
	@test -f ../agency/the_garden/curation/catalog.schema.json
	@cd .. && python3 -c "import json, yaml; from jsonschema import validate; schema = yaml.safe_load(open('agency/the_garden/curation/catalog.schema.json')); doc = yaml.safe_load(open('agency/the_garden/curation/catalog.yaml')); validate(instance=doc, schema=schema); print('Catalog validates.')"
