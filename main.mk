MKDKR_EXPORTER_TAG=latest

define exporter_header =
	@$(.)
	... rosiney/mkdkr_exporter:$(MKDKR_EXPORTER_TAG)
	.. /app/export_data \> /tmp/export.yaml
endef

exporter.gitlab-ci:
	$(exporter_header)
	.. jinja2 --format=yml /app/templates/gitlab-ci.yml.j2 /tmp/export.yaml > .gitlab-ci.yml

exporter.github:
	$(exporter_header)
	mkdir -p .github/workflows/
	.. jinja2 --format=yml /app/templates/github.yml.j2 /tmp/export.yaml > .github/workflows/main.yml

exporter.travis:
	$(exporter_header)
	.. jinja2 --format=yml /app/templates/travis.yml.j2 /tmp/export.yaml > .travis.yml

exporter.circle-ci:
	$(exporter_header)
	mkdir -p .circleci
	.. jinja2 --format=yml /app/templates/travis.yml.j2 /tmp/export.yaml > .circleci/config.yml