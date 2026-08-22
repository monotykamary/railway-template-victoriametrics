# Deploy and Host VictoriaMetrics with Railway

VictoriaMetrics is a fast, cost-effective time-series database and monitoring solution. This template deploys its single-node edition with persistent storage, a generated Basic Authentication password, built-in VMUI, Prometheus-compatible APIs, self-monitoring, and an HTTP health check.

## About Hosting VictoriaMetrics

Hosting VictoriaMetrics provides durable storage and fast queries for infrastructure, application, and business metrics. Railway builds a thin wrapper around the pinned official container, provisions a persistent volume, assigns a public HTTPS domain, and monitors the dedicated health endpoint. Protected endpoints require generated credentials, while the integrated VMUI provides immediate querying and visualization without requiring Grafana. The single-node edition is appropriate for compact production installations and can later receive metrics from Prometheus, vmagent, OpenTelemetry-compatible collectors, or direct HTTP imports.

## Common Use Cases

- Store and query Prometheus metrics with efficient compression
- Centralize application and infrastructure monitoring
- Power Grafana dashboards through a Prometheus-compatible datasource
- Retain business and IoT time-series data
- Explore operational metrics with the built-in VMUI

## Dependencies for VictoriaMetrics Hosting

- VictoriaMetrics single-node v1.150.0
- A Railway volume mounted at `/victoria-metrics-data`
- Railway HTTPS networking on port `8428`

### Deployment Dependencies

- [VictoriaMetrics documentation](https://docs.victoriametrics.com/victoriametrics/)
- [Single-node deployment guide](https://docs.victoriametrics.com/victoriametrics/single-server-victoriametrics/)
- [VictoriaMetrics source repository](https://github.com/VictoriaMetrics/VictoriaMetrics)
- [Template source repository](https://github.com/monotykamary/railway-template-victoriametrics)

### Implementation Details

The startup wrapper validates the port and required credentials before launching the pinned official image. It passes the generated password through VictoriaMetrics’ supported file-based secret mechanism, then configures durable storage, retention, self-scraping, JSON logs, and HTTP Basic Authentication. VictoriaMetrics leaves `/health` unauthenticated for Railway readiness checks while protecting VMUI and the ingestion, query, metrics, and administrative APIs.

### Why Deploy VictoriaMetrics on Railway?

Railway provides reproducible source builds, HTTPS networking, deployment health checks, persistent volumes, logs, and restart management around VictoriaMetrics. This creates a compact monitoring datastore without maintaining a virtual machine or assembling a larger observability stack.
