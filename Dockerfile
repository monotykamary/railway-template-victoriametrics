FROM docker.io/victoriametrics/victoria-metrics:v1.153.0@sha256:5eff7af5341e401471002f58d106d399e614a62f3d240f2dbc21901e49eed5dd

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
