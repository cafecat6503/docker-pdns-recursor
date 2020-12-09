FROM debian:buster

RUN echo "deb [arch=amd64 trusted=yes] http://repo.powerdns.com/debian buster-rec-44 main" > /etc/apt/sources.list.d/pdns.list
RUN echo "Package: pdns-*\nPin: origin repo.powerdns.com\nPin-Priority: 600" > /etc/apt/preferences.d/pdns
RUN apt-get update && apt-get install -y pdns-recursor
RUN mkdir -p /var/run/pdns-recursor

ADD static/recursor.conf /etc/powerdns/

EXPOSE 53
ENTRYPOINT ["pdns_recursor","--daemon=no"]