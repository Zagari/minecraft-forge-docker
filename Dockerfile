# FROM amazoncorretto:17-alpine
FROM ubuntu:22.04

# Variáveis
ENV FORGE_VERSION=1.20.1-47.4.0
ENV FORGE_INSTALLER=forge-${FORGE_VERSION}-installer.jar

# Instalar curl e bash
# RUN apk add --no-cache bash curl
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless curl unzip dos2unix && \
    rm -rf /var/lib/apt/lists/*
    
# Diretório de trabalho
WORKDIR /minecraft

# Baixar e instalar o Forge
# curl -o forge-1.20.1-47.4.0-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar
# java -jar forge-1.20.1-47.4.0-installer.jar --installServer

RUN curl -o ${FORGE_INSTALLER} https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/${FORGE_INSTALLER}
RUN java -jar ${FORGE_INSTALLER} --installServer
# && rm ${FORGE_INSTALLER}

# Copiar arquivos necessários
COPY start.sh .
COPY eula.txt .
COPY mods ./mods
COPY server.properties .
COPY server.properties ./Settings

RUN java -jar ${FORGE_INSTALLER} --installServer
# RUN apt-get install dos2unix
RUN dos2unix start.sh
RUN chmod +x start.sh

EXPOSE 25565

CMD ["./start.sh"]
