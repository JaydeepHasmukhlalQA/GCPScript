SHELL := /bin/bash
VAR_DIR = "variables"
TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

terraform-init:
	@terraform init

poolapi-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolapi.tfvars

poolapi-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolapi.tfvars

poolui-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolui.tfvars

poolui-destory:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolui.tfvars