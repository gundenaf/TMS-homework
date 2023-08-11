FROM ubuntu:focal
RUN apt update && apt -y upgrade && apt -y install nginx curl
RUN mkdir -p /app/static

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./app/static/ /app/static

RUN chown -R www-data:www-data /app/static \
    && chmod -R 755 /app/static

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]