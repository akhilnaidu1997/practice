ARG APP_VERSION=9
FROM almalinux:${APP_VERSION}
LABEL maintainer="akhilnaid1997@gmail.com"
WORKDIR /app
RUN dnf install nginx -y && rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/
EXPOSE 80
RUN useradd akhil
USER akhil
CMD ["nginx","-g","daemon off;"]

