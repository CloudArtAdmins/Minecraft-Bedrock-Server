# Minecraft Bedrock Server

Run a bedrock server in a container

This Dockerfile will download the Bedrock Server app and set it up, along with its dependencies.

If you run the container as is, the `worlds` directory will be created inside the container, which is unadvisable. It is highly recommended that you store your worlds outside the container using a volume mount. It is also likely that you will want to customize your `server.properties` file. The best way to do this is also using a `server.properties` file outside the container using a mount.

Here is a `podman run` command that will do that, assuming you have a `worlds` directory and `server.properties` file at `/minecraft`. (You should change the path to wherever your stuff is.)

    $ podman run --detach \
	--name=mc-bre \
	-p 19132:19132/udp \
	-p 19133:19133/udp \
	--volume "mc-bre-world:/bedrock-server/worlds" \
	--volume "${PWD}/server.properties:/bedrock-server/server.properties:z,ro" \
	--volume "${PWD}/whitelist.json:/bedrock-server/whitelist.json:z,ro" \
	--volume "${PWD}/permissions.json:/bedrock-server/permissions.json:z,ro" \
	docker.io/farrahscloudart/minecraft_bedrock_edition

If you wanted to use custom resource packs, a whitelist, or other things, you could also mount those paths as well. Separating the content from the sever executable means that you can safely destroy your Docker container without losing your world. This will come in handy when there are updates to the server app, and you want to redeploy the container.

Hopefully this is helpful to folks. Happy Minecrafting!
