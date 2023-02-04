APP_NAME ?= bachelor-api
TERRAFORM_DIR ?= terraform

# Use .env file if it exists
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

# DOCKER
docker-build:
	docker build -t ${APP_NAME} .
docker-compose-up:
	docker-compose up -d
docker-compose-down:
	docker-compose down

# TERRAFORM
terraform-init:
	terraform -chdir=${TERRAFORM_DIR} \
		init
terraform-plan:
	terraform -chdir=${TERRAFORM_DIR} \
		plan \
		-var "app_name=${APP_NAME}"
terraform-apply:
	terraform -chdir=${TERRAFORM_DIR} \
		apply \
		-var "app_name=${APP_NAME}"
terarform-destroy:
	terraform -chdir=${TERRAFORM_DIR} \
		destroy \
		-var "app_name=${APP_NAME}"