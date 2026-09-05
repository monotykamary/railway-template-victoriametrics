FROM docker.io/victoriametrics/victoria-metrics:v1.151.0@sha256:6d164540a04f49ba4e696cbdb70f9fee78be1e94b8f2a1292743a0b1ab8275bd

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
