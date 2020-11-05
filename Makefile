#!make
env:=.env
include $(env)
APP_NAME=subnetting

build:
	@docker build -t ${APP_NAME} .

run: build
	@docker run -it --rm --privileged  ${APP_NAME} 

tag:
	@docker tag ${APP_NAME} ${APP_REGISTERY}/${APP_NAME}:${APP_VERSION}

push: tag build
	@docker push ${APP_REGISTERY}/${APP_NAME}:${APP_VERSION}

pull:
	@docker pull ${APP_REGISTERY}/${APP_NAME}:latest

prod: pull
	@docker run -it --rm --privileged  ${APP_REGISTERY}/${APP_NAME}:latest

network: 
	@docker network create -d bridge \
	  --subnet=172.56.20.0/24 \
	  --gateway=172.56.20.1 \
	subnettuto
