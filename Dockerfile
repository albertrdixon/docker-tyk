FROM stackbrew/ubuntu:14.04
MAINTAINER Albert Dixon "albert@timelinelabs.com"

RUN apt-get update -qq

ADD https://github.com/lonelycode/tyk/releases/download/1.1/tyk.linux.amd64_1.1-1_all.deb /tmp/tyk.deb
RUN dpkg -i /tmp/tyk.deb
RUN rm -f /tmp/tyk.deb

RUN rm -f /etc/tyk/apps/*
RUN rm -f /etc/tyk/tyk.conf
ADD configurations/tyk.conf /etc/tyk/
ADD configurations/sample_api.json /etc/tyk/apps/
ADD bin/start-tyk.sh /bin/start-tyk.sh

EXPOSE 8080

WORKDIR /etc/tyk
ENTRYPOINT ["/bin/start-tyk.sh"]
CMD ["/usr/bin/tyk", "--debug", "--conf=/etc/tyk/tyk.conf"]
