FROM node:20
WORKDIR /app
COPY package.json .
RUN npm install
COPY *.js .
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT=8080
RUN useradd roboshop
USER roboshop
CMD ["node","server.js"]
