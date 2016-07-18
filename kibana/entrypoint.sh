#!/usr/bin/env bash

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Stalling for Elasticsearch"
while true; do
    nc -q 1 elasticsearch 9200 2>/dev/null && break
done

echo "Setup beats dashboard"
kibana &
pid=$!
sleep 10
cd beats-dashboards-1.2.3
./load.sh -url "http://elasticsearch:9200"
kill $pid

echo "Starting Kibana"
exec kibana
