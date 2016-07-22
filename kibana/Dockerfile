FROM kibana:4.5.2

# Install plugins
RUN set -ex \
    && apt-get update \
    && apt-get install -y \
               netcat \
               curl \
               unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && kibana plugin --install elastic/sense

# Setup dashboard
COPY dashboards/ /etc/dashboards/
RUN set -ex \
    && curl -O -L http://download.elastic.co/beats/dashboards/beats-dashboards-1.2.3.zip \
    && unzip beats-dashboards-1.2.3.zip \
    && rm beats-dashboards-1.2.3.zip \
    && cp -ru /etc/dashboards/* /beats-dashboards-1.2.3/dashboards/

# Setup entrypoint
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
CMD ["/tmp/entrypoint.sh"]
