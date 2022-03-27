# Airflow on Amazon MWAA

## Build MWAA local image
- `make build` will build the image from sources.

`./aws-mwaa-local-runner` is a submodule and can be updated with `git submodule update --remote`

Use the `make` file in this repo to build and start a local airflow environment.

The image build process is enabled as a prebuild in `../.gitpod.yml` and if there exists an image in `/workspace/airflow.tar.gz` it will be used.

If you need a new version of aws-mwaa-local-runner you may change [.gitmodules](../.gitmodules) and run `make update-submodule`

## Start the environment

- `make start` will load or build the necessary images and start the airflow environment. `Ctrl+c stops the envronment`
- `make ui` opens the user interface in a browser window.

 Credentials: `airflow:test`
