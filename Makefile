.DEFAULT_GOAL := help
PWD := $(shell pwd)

help:
	@echo "-- Commands"
	@echo " enableService -- \t\t Enable a service, omit the .yml"
	@echo " listServices -- \t\t List services available and not enabled"
	@echo " htpasswd -- \t\t Generate a htpasswd secret"
	@echo " autheliaSecrets -- \t\t Generate Authelia JWT and Session secrets"
	@echo ""
	@echo "-- Docker"
	@echo " generateCompose -- \t\t Generate docker-compose.yml"
	@echo " stop -- \t\t Stop the containers"
	@echo " start -- \t\t Start the containers"
	@echo " restart -- \t\t Restart the containers"
	@echo " build -- \t\t Pull + Build + Create the containers"


restart: | stop start
stop: | generateCompose
	@docker-compose stop

start: | generateCompose
	@docker-compose up -d

build: | generateCompose
	@docker-compose pull
	@docker-compose build --no-cache --pull
	@docker-compose create

setup: | autheliaSecrets htpasswd
	@read -p "Input Cloudflare Email: " cloudflareEmail \
	&& /bin/sh -c "echo $${cloudflareEmail} > $(PWD)/secrets/cloudflareEmail"
	@read -p "Input Cloudflare ApiKey: " cloudflareApiKey \
	&& /bin/sh -c "echo $${cloudflareApiKey} > $(PWD)/secrets/cloudflareApiKey"
	@read -p "Input Cloudflare ApiToken: " cloudflareApiToken \
	&& /bin/sh -c "echo $${cloudflareApiToken} > $(PWD)/secrets/cloudflareApiToken"
	@read -p "Input Email Address: " eMail \
	&& /bin/sh -c "echo $${eMail} > $(PWD)/secrets/eMail"
	@read -p "Input Traefik Pilot Token: " traefikPilotToken \
	&& /bin/sh -c "echo $${traefikPilotToken} > $(PWD)/secrets/traefikPilotToken"

autheliaSecrets:
	@cat /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c128 > secrets/autheliaJwtSecret
	@cat /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c128 > secrets/autheliaSessionSecret
	@echo "Secrets generated"

htpasswd:
	@read -p "Please input username: " username \
	&& /bin/sh -c "htpasswd -c $(PWD)/secrets/htpasswd $${username}"

generateCompose:
	@docker-compose --project-directory $(PWD) -f $(PWD)/stacks/enabled/*.yml config > $(PWD)/docker-compose.yml

listServices:
	@diff -q stacks/available stacks/enabled | grep -v base.yml || echo "All services enabled" && exit 0

enableService:
	@read -p "Please input service name: " serviceName \
	&& /bin/sh -c "ln -s $(PWD)/stacks/available/$${serviceName}.yml stacks/enabled/"