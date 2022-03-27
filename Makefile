.PHONY: airflow
SHELL := /bin/bash

# If the first argument is "airflow"...
ifeq (airflow,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "airflow"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

airflow:
	$(MAKE) -C .airflow $(RUN_ARGS)