FROM nginx

RUN mkdir -p /var/cache/nginx/pypi && chown www-data /var/cache/nginx/pypi
COPY nginx.conf /etc/nginx/nginx.conf
COPY 90-logging-include.sh /docker-entrypoint.d/90-logging-include.sh

EXPOSE 8080
