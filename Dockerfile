FROM victoriametrics/victoria-metrics:v1.148.0

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428
VOLUME ["/victoria-metrics-data"]

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
