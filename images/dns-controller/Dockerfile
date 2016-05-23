FROM debian:jessie

RUN apt-get update && apt-get install --yes ca-certificates

COPY /.build/artifacts/dns-controller /usr/bin/dns-controller

CMD /usr/bin/dns-controller

