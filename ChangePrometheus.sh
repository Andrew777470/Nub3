#! /bin/bash
cat <<EOT>> /etc/prometheus/prometheus.yml
  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
    - targets: ['localhost:9100']
EOT
