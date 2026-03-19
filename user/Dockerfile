FROM node:20
WORKDIR /app
COPY package.json .
RUN npm install
COPY *.js .
ENV MONGO=true \
    REDIS_URL='redis://redis:6379' \
    MONGO_URL="mongodb://mongodb:27017/users"
RUN useradd roboshop
USER roboshop
CMD ["node","server.js"]
