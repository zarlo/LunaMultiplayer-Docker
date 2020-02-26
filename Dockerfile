FROM mono:latest

ENV TAG="latest"


RUN apt update \
    && apt install unzip wget

RUN wget -O /tmp/server.zip https://github.com/LunaMultiplayer/LunaMultiplayer/releases/${TAG}/download/LunaMultiplayer-Release.zip


RUN unzip /tmp/server.zip

RUN cp /tmp/LMPServer/ /server/

WORKDIR /server
VOLUME  /server

RUN ["mono" "./server.exe"]

EXPOSE 8800/udp 8900/tcp
