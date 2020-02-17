include $(shell bash .mkdkr init)

PROJECT=rosiney
REPOS=mkdkr_export

build:
	$(docker_build)

push:
	$(docker_push)
