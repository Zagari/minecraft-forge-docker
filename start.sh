#!/bin/bash
echo "Iniciando servidor Forge..."

# Força modo online (ou comente para usar offline)
sed -i 's/online-mode=false/online-mode=true/' server.properties 2>/dev/null || true

# JAR=$(ls forge-*.jar | head -n1)
# if [ -f "$JAR_FILE" ]; then
#    java -Xmx4G -Xms2G -jar "$JAR" nogui
#else
#    echo "Erro: Arquivo forge-*.jar não encontrado."
#    exit 1
# fi
./run.sh

