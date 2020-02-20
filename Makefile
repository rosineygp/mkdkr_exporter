include $(shell bash .mkdkr init)

PROJECT=rosiney
REPOS=mkdkr_exporter

build:
	$(docker_build)

push:
	$(docker_push)

teste:
	@$(.)
	... rosiney/mkdkr_exporter
	.. bash