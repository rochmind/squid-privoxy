FROM arm32v7/alpine:latest

RUN apk --no-cache --update add privoxy squid wget ca-certificates && \
    ln -sf /dev/stdout /var/log/privoxy/logfile && \
    mkdir -p /var/cache/squid /var/log/squid

RUN chown -R squid:squid /var/cache/squid && \
    chown -R squid:squid /var/log/squid && \
    chown privoxy:privoxy /etc/privoxy/*

COPY service /opt/

EXPOSE 3128 3129 8118

CMD ["/bin/sh", "/opt/start.sh"]
