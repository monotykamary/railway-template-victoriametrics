FROM docker.io/victoriametrics/victoria-metrics:v1.154.1@sha256:c7884f32920dd45a9d86542a717227e63af03e060e53bbf8031e6e6fd0e1e05d

COPY start-victoriametrics.sh /usr/local/bin/start-victoriametrics
RUN chmod 0555 /usr/local/bin/start-victoriametrics

EXPOSE 8428

ENTRYPOINT ["/usr/local/bin/start-victoriametrics"]
