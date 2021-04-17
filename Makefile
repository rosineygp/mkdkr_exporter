include $(shell [ ! -f .mkdkr ] && curl -fsSL https://git.io/JOBYz > .mkdkr; bash .mkdkr init)

PROJECT=rosiney
REPOS=mkdkr_exporter

build:
	$(docker_build)

push:
	$(docker_push)
