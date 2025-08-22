FROM debian:latest


RUN apt-get update && apt-get install -y nginx


COPY ./Tools/index.html /var/www/html/index.html
COPY ./Tools/style.css /var/www/html/style.css
COPY ./Tools/projects.html /var/www/html/projects.html
COPY ./Tools/contact.html /var/www/html/contact.html



EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]