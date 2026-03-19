FROM node:20
WORKDIR /app
COPY package.json .
RUN npm install
COPY *.js .
ENV MONGO=true \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
RUN useradd roboshop
USER roboshop
CMD ["node","server.js"]
