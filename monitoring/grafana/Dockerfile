FROM grafana/grafana:5.4.2
COPY prometheus.yml /etc/grafana/provisioning/datasources
COPY dashboard.yml /etc/grafana/provisioning/dashboards
COPY dashboards/ /var/grafana/dashboards
