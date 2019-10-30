FROM nginx

RUN mkdir -p /var/cache/nginx/pypi && chown www-data /var/cache/nginx/pypi
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
