#!/bin/sh
set -eu

port="${PORT:-8428}"
username="${VM_USERNAME:-admin}"
retention="${VM_RETENTION_PERIOD:-1y}"
self_scrape_interval="${VM_SELF_SCRAPE_INTERVAL:-10s}"

case "$port" in
  ''|*[!0-9]*)
    echo "PORT must be an integer between 1 and 65535" >&2
    exit 1
    ;;
esac
if [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
  echo "PORT must be an integer between 1 and 65535" >&2
  exit 1
fi
if [ -z "$username" ]; then
  echo "VM_USERNAME must not be empty" >&2
  exit 1
fi
if [ -z "${VM_PASSWORD:-}" ]; then
  echo "VM_PASSWORD must not be empty" >&2
  exit 1
fi

password_file=/tmp/victoriametrics-http-password
umask 077
printf '%s' "$VM_PASSWORD" > "$password_file"

exec /victoria-metrics-prod \
  "-storageDataPath=/victoria-metrics-data" \
  "-httpListenAddr=:$port" \
  "-retentionPeriod=$retention" \
  "-selfScrapeInterval=$self_scrape_interval" \
  "-httpAuth.username=$username" \
  "-httpAuth.password=file://$password_file" \
  "-loggerFormat=json"
