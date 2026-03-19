FROM python:3.9
WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
ENV CART_HOST=cart \
    CART_PORT=8080 \
    USER_HOST=user \
    USER_PORT=8080 \
    AMQP_HOST=rabbitmq \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123
RUN useradd roboshop
USER roboshop
CMD ["uwsgi","--ini","payment.ini"]