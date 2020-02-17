MKDKR_EXPORT_TAG=latest

define export_header =
	@$(.)
	... rosiney/mkdkr_exporter:$(MKDKR_EXPORT_TAG)
	.. /app/export_data \> /tmp/export.yaml
endef

export.gitlab-ci:
	$(export_header)
	.. jinja2 --format=yml /app/templates/gitlab-ci.yml.j2 /tmp/export.yaml > .gitlab-ci.yml

export.github:
	$(export_header)
	mkdir -p .github/workflows/
	.. jinja2 --format=yml /app/templates/github.yml.j2 /tmp/export.yaml > .github/workflows/main.yml

export.travis:
	$(export_header)
	.. jinja2 --format=yml /app/templates/travis.yml.j2 /tmp/export.yaml > .travis.yml

export.circle-ci:
	$(export_header)
	mkdir -p .circleci
	.. jinja2 --format=yml /app/templates/travis.yml.j2 /tmp/export.yaml > .circleci/config.yml