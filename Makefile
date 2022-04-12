.ONESHELL:

SHELL := /bin/bash

azdo-agent:
	echo "Calling azdo-agent"
	terraform init
	terraform plan
	terraform apply -auto-approve
destroy:
	terraform destroy -auto-approve
clean:
	@find . -name terraform.tfstate -type f -exec rm -rf {} +
	@find . -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find . -name .terraform -type d -exec rm -rf {} +
	@find . -name .terraform.lock.hcl -type f -exec rm -rf {} +
	@find . -name providers -type d -exec rm -rf {} +
	