FROM docker.elastic.co/beats/filebeat:7.15.0

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY logs-app /var/log/

USER root

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml
