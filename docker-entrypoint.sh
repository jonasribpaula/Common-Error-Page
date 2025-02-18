#!/bin/sh
set -e

# Verifica se SUPPORT_EMAIL está definido; caso não esteja, aborta o container
: "${SUPPORT_EMAIL:?A variável de ambiente SUPPORT_EMAIL deve ser definida.}"

echo "Substituindo variáveis de ambiente no template do HTML..."
envsubst '$SUPPORT_EMAIL' < /usr/share/nginx/html/index.template.html > /usr/share/nginx/html/index.html

# Inicia o nginx
exec "$@"
