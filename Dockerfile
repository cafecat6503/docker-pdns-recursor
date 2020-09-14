FROM centos:8

RUN yum install -y epel-release && dnf install -y 'dnf-command(config-manager)' && dnf config-manager --set-enabled PowerTools && curl -o /etc/yum.repos.d/powerdns-rec-43.repo https://repo.powerdns.com/repo-files/centos-rec-43.repo && yum -y install pdns-recursor

ADD recursor.conf /etc/pdns-recursor

EXPOSE 53/tcp
EXPOSE 53/udp

CMD  ["/usr/sbin/pdns_recursor"]