FROM alpine:latest
MAINTAINER marius@twostairs.co

RUN apk update \
 && apk upgrade \
 && apk add fetchmail procmail openssl ca-certificates;

VOLUME ["/etc/fetchmailrc", "/etc/procmailrc", "/mail"]
CMD ["fetchmail", "-vvv", "--nosyslog", "--nodetach", "-f", "/etc/fetchmailrc"]
