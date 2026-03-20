FROM node:20 AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY *.js .


FROM node:20.20.1-alpine3.23
WORKDIR /app
COPY --from=builder /app /app
ENV MONGO=true \
    REDIS_URL='redis://redis:6379' \
    MONGO_URL="mongodb://mongodb:27017/users"
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && chown -R roboshop:roboshop /app
USER roboshop
CMD ["node","server.js"]
