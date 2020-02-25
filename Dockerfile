FROM mono:latest

ENV TAG="latest"

RUN curl https://github.com/LunaMultiplayer/LunaMultiplayer/releases/${TAG}/download/package.zip > /tmp/server.zip

RUN apt update \
    && apt install unzip

RUN unzip /tmp/server.zip

RUN cp /tmp/LMPServer/* /server/

WORKDIR /server
VOLUME  /server

RUN ["mono" "./server.exe"]

EXPOSE 8800/udp 8900/tcp
