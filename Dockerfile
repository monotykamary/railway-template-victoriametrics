FROM docker.io/victoriametrics/victoria-metrics:v1.154.0@sha256:4bd592341587d669b7f57d54bbb82bd21ac8675f4e24234b7703a7c0f85197d8

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
