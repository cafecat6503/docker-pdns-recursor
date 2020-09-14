FROM alpine:edge

RUN apk add pdns-recursor

ADD recursor.conf /etc/pdns-recursor

EXPOSE 53/tcp
EXPOSE 53/udp

CMD  ["/usr/sbin/pdns_recursor"]