MKDKR_EXPORT_TAG=latest

export.gitlab-ci:
	@$(.)
	... rosiney/mkdkr_exporter:$(MKDKR_EXPORT_TAG)
	.. /app/export_data > export.yaml
	.. jinja2 --format=yml /app/templates/.gitlab-ci.yml.j2 export.yaml > .gitlab-ci.yml
