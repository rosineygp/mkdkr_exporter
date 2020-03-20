MKDKR_EXPORTER_TAG=latest

define _exporter_header =
	@$(dkr)
	instance: rosiney/mkdkr_exporter:$(MKDKR_EXPORTER_TAG)
	run: /app/export_data \> /tmp/export.yaml
endef

_exporter_gitlab-ci:
	$(call _exporter_header)
	run: jinja2 --format=yml /app/templates/gitlab-ci.yml.j2 /tmp/export.yaml > .gitlab-ci.yml

_exporter_github:
	$(call _exporter_header)
	mkdir -p .github/workflows/
	run: jinja2 --format=yml /app/templates/github.yml.j2 /tmp/export.yaml > .github/workflows/main.yml

_exporter_travis:
	$(call _exporter_header)
	run: jinja2 --format=yml /app/templates/travis.yml.j2 /tmp/export.yaml > .travis.yml

_exporter_circle-ci:
	$(call _exporter_header)
	mkdir -p .circleci
	run: jinja2 --format=yml /app/templates/circle-ci.yml.j2 /tmp/export.yaml > .circleci/config.yml

_exporter_jenkins_pipeline:
	$(call _exporter_header)
	run: jinja2 --format=yml /app/templates/Jenkinsfile.j2 /tmp/export.yaml > Jenkinsfile

_exporter_bitbucket-pipelines:
	$(call _exporter_header)
	run: jinja2 --format=yml /app/templates/bitbucket-pipelines.yml.j2 /tmp/export.yaml > bitbucket-pipelines.yml