FROM docker.io/library/debian:buster-slim

RUN apt-get update \
 && apt-get install -y unzip curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl --output bedrock-server.zip "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.17.31.01.zip" \     
 && unzip bedrock-server.zip -d bedrock-server \
 && chmod +x bedrock-server/bedrock_server \
 && rm bedrock-server.zip

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server

