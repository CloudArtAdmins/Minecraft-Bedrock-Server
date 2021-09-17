#!/bin/sh

podman run --detach \
	--name=mc-bre \
	-p 19132:19132/udp \
	--volume "wills:/bedrock-server/worlds" \
	--volume "${PWD}/server.properties:/bedrock-server/server.properties:ro,z" \
	--volume "${PWD}/whitelist.json:/bedrock-server/whitelist.json:ro,z" \
	docker.io/farrahscloudart/minecraft_bedrock_edition
