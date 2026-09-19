# VictoriaMetrics on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/victoriametrics?referralCode=ZqgrJ0)

A secure, persistent Railway template for the single-node edition of [VictoriaMetrics](https://victoriametrics.com/), pinned to version `1.152.0`. It includes the built-in VMUI, Prometheus-compatible ingestion and query APIs, Basic Authentication, self-monitoring, and durable storage.

## Access VMUI

Open `https://<your-domain>/vmui/` and sign in with `VM_USERNAME` and `VM_PASSWORD` from the VictoriaMetrics service variables.

The unauthenticated `/health` endpoint is intentionally available for Railway health checks. All data, query, administration, metrics, and UI endpoints require Basic Authentication.

## Configuration

| Variable | Default | Purpose |
| --- | --- | --- |
| `PORT` | `8428` | HTTP port used by VictoriaMetrics and the Railway public domain. |
| `VM_USERNAME` | `admin` | Basic Authentication username for protected HTTP endpoints. |
| `VM_PASSWORD` | Generated | Basic Authentication password generated for each deployment. |
| `VM_RETENTION_PERIOD` | `1y` | Duration that stored metrics are retained. |
| `VM_SELF_SCRAPE_INTERVAL` | `10s` | Interval for scraping VictoriaMetrics' own operational metrics. |

## API examples

Set your deployment URL and credentials:

```bash
export VM_URL="https://your-domain.up.railway.app"
export VM_USERNAME="admin"
export VM_PASSWORD="your-generated-password"
```

Import a Prometheus sample:

```bash
curl -u "$VM_USERNAME:$VM_PASSWORD" \
  --data-binary 'railway_example_metric 42' \
  "$VM_URL/api/v1/import/prometheus"
```

Query it:

```bash
curl -u "$VM_USERNAME:$VM_PASSWORD" \
  --get --data-urlencode 'query=railway_example_metric' \
  "$VM_URL/api/v1/query"
```

## Persistence and backups

Metrics are stored under `/victoria-metrics-data`, which the template mounts on a Railway volume. Deleting the volume permanently removes the stored metrics. For production backup workflows, use the upstream [vmbackup documentation](https://docs.victoriametrics.com/victoriametrics/vmbackup/).

## Local development

```bash
docker build -t railway-victoriametrics .
docker run --rm -p 8428:8428 \
  -e VM_PASSWORD=change-me \
  -v victoria-metrics-data:/victoria-metrics-data \
  railway-victoriametrics
```

## License

The Railway startup wrapper is MIT licensed. VictoriaMetrics retains its upstream license and trademarks.
