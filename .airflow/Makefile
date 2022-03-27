.PHONY:
.ONESHELL:
SHELL := /bin/bash

build:
	cd aws-mwaa-local-runner && ./mwaa-local-env build-image
	docker image save amazon/mwaa-local:2.2 -o /workspace/airflow.tar.gz

start:
	if ! $$(docker inspect --type=image amazon/mwaa-local:2.2 &> /dev/null); then 
		if test -f /workspace/airflow.tar.gz; then 
			docker image load -i /workspace/airflow.tar.gz 
		else 
			$(MAKE) build 
		fi 
	fi 
	cd $$GITPOD_REPO_ROOT/airflow && docker-compose -f $$GITPOD_REPO_ROOT/.airflow/aws-mwaa-local-runner/docker/docker-compose-local.yml up

ui:
	gp await-port 8080 && gp preview $$(gp url 8080) --external

update-submodule:
	git submodule update --remote --force
