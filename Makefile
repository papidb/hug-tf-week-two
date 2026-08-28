AWS_PROFILE ?= terraform-lab

plan:
	@ip=$$(curl -fsS https://checkip.amazonaws.com); \
	AWS_PROFILE=$(AWS_PROFILE) TF_VAR_ssh_cidr="$$ip/32" \
	terraform plan -out=tfplan

apply:
	AWS_PROFILE=$(AWS_PROFILE) terraform apply tfplan
