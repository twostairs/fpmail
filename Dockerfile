FROM alpine:latest
MAINTAINER marius@twostairs.co

RUN apk update \
 && apk upgrade \
 && apk add fetchmail procmail openssl ca-certificates;

 RUN touch /fetchmail.pid \
 && chmod 777 /fetchmail.pid

VOLUME ["/etc/fetchmailrc", "/etc/procmailrc", "/mail"]
CMD ["fetchmail", "-vvv", "--nosyslog", "--nodetach", "--pidfile", "/fetchmail.pid", "-f", "/etc/fetchmailrc"]
