FROM fluent/fluentd

USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

# Setup plugins
RUN set -ex \
    && gem install fluent-plugin-elasticsearch

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF \
            -p /fluentd/plugins $FLUENTD_OPT
