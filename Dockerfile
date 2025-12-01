FROM debian:12
RUN apt-get update && apt-get install -y nginx
RUN echo "<h1>Hello World</h1>" > /var/www/html/index.html
RUN echo "server { \
    listen 82; \
    server_name localhost; \
    proxy_connect_timeout 300s; \
    proxy_send_timeout 300s; \
    proxy_read_timeout 300s; \
    root /var/www/html; \
    index index.html; \
}" > /etc/nginx/sites-available/default
EXPOSE 82
CMD ["nginx", "-g", "daemon off;"]
