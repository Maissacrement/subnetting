#!make

network: 
	@docker network create -d bridge \
	  --subnet=172.56.20.0/24 \
	  --gateway=172.56.20.1 \
	subnettuto