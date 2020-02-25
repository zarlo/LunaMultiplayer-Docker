FROM mono:latest

ENV TAG="latest"

RUN curl -o /tmp/server.zip https://github.com/LunaMultiplayer/LunaMultiplayer/releases/${TAG}/download/package.zip

RUN apt update \
    && apt install unzip

RUN unzip /tmp/server.zip

RUN cp /tmp/LMPServer/* /server/

WORKDIR /server
VOLUME  /server

RUN ["mono" "./server.exe"]
