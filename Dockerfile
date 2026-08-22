FROM docker.io/victoriametrics/victoria-metrics:v1.150.0@sha256:54467c7764a3e6579199af1914bb779f01ce32265cd552eb5ae0d4f8a2b80a97

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
