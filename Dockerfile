FROM nginx:alpine

# Instala o envsubst (parte do pacote gettext)
RUN apk add --no-cache gettext

# Copia o arquivo HTML para um template
COPY index.template.html /usr/share/nginx/html/index.template.html

# Copia o script de entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Define o entrypoint para realizar a substituição e iniciar o nginx
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
