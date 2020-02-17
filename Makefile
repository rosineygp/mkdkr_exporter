include $(shell bash .mkdkr init)

build:
	$(docker_build)

push:
	$(docker_push)
