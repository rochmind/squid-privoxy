FROM alpine:latest

RUN apk --no-cache add squid privoxy ca-certificates && \
    ln -sf /dev/stdout /var/log/privoxy/logfile && \
    chown -R squid:squid /var/cache/squid && \
    chown -R squid:squid /var/log/squid

COPY service /opt/

EXPOSE 3128 3129 8118

CMD ["/bin/sh", "/opt/start.sh"]
