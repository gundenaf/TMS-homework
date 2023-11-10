FROM grafana/grafana

ENV GF_SECURITY_ADMIN_PASSWORD=admin

COPY grafana/provisioning/datasources/datasources.yml /etc/grafana/provisioning/datasources/datasources.yml
COPY grafana/provisioning/dashboards/nginx_dashboard.json /etc/grafana/provisioning/dashboards/nginx_dashboard.json
COPY grafana/grafana.ini /etc/grafana/grafana.ini