FROM docker.io/victoriametrics/victoria-metrics:v1.149.0@sha256:13b8951e35bb3589626816538483127785a9d8b53f9f5123769db0fcab1d961f

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
