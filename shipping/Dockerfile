FROM maven:3.5-jdk-9-slim
WORKDIR /app
COPY . .
RUN mvn clean package
RUN mv target/shipping-1.0.jar shipping.jar
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
RUN useradd roboshop
USER roboshop
CMD ["java","-jar","/app/shipping.jar"]
