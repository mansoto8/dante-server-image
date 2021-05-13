 # syntax=docker/dockerfile:1
FROM alpine:3.13.5
RUN adduser socks5 -D && echo "socks5:socks5" | chpasswd
RUN apk update
# RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache --upgrade dante-server
ADD ./sockd.conf /etc/sockd.conf
WORKDIR /etc/init.d
CMD sockd