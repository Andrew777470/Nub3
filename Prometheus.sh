#! /bin/bash
sudo useradd --no-create-home --shell /usr/sbin/nologin prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/prometheus /var/lib/prometheus ~/prometheus
chown prometheus: /etc/prometheus /var/lib/prometheus
sudo wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz
sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar -xvf node_exporter-1.1.2.linux-amd64.tar.gz
tar -xvf prometheus-2.26.0.linux-amd64.tar.gz
cp node_exporter-1.1.2.linux-amd64/node_exporter /usr/local/bin
cp prometheus-2.26.0.linux-amd64/prom{etheus,tool} /usr/local/bin
chown prometheus: /usr/local/bin/prometheus
chown prometheus: /usr/local/bin/promtool
chown node_exporter: /usr/local/bin/node_exporter
cat > /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Sevice]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[install]
WantedBy=multi-user.target
EOF
echo "ok"
cp -r /home/adminroot/prometheus-2.26.0.linux-amd64/console_libraries /etc/prometheus
cp -r /home/adminroot/prometheus-2.26.0.linux-amd64/consoles /etc/prometheus
cp /home/adminroot/prometheus-2.26.0.linux-amd64/prometheus.yml /etc/prometheus
chown -Rv prometheus: /etc/prometheus
cat > /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries
ExecReload=/bin/kill -HUP $MAINPID

[install]
WantedBy=multi-user.target
EOF


