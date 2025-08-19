FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx 

COPY conf/default /etc/nginx/sites-available/.

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]