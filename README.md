# Elastic stack for docker

Run the basic Elastic stack (Elasticsearch, Kibana, Fluentd) with Docker and Docker-compose.
Kibana contains Beats dashboards :)

Based on the official images:
* [elasticsearch][1]
* [kibana][2]
* [Fluentd][5]
* [Dockerbeat][6]

## Requirements

### Setup
1. Install [Docker][3]
1. Install [Docker-compose][4]
1. Clone this repository.

### Usage
1. Start Elastic stack in background.
```bash
$ docker-compose up -d
```
1. Start beats on target node.
```bash
$ curl -O -L https://download.elastic.co/beats/topbeat/topbeat-1.2.3-x86_64.tar.gz
$ tar zxvf topbeat-1.2.3-x86_64.tar.gz
$ cd topbeat-1.2.3-x86_64
$ cat<<EOF >topbeat.yml
output:
  elasticsearch:
    hosts: ["localhost:9200"]
EOF
$ ./topbeat -e -c topbeat.yml
```

> Other beats packages are [here][7].

[1]: https://registry.hub.docker.com/_/elasticsearch/
[2]: https://registry.hub.docker.com/_/kibana/
[3]: http://docker.io/
[4]: http://docs.docker.com/compose/install/
[5]: https://hub.docker.com/r/fluent/fluentd/
[6]: https://hub.docker.com/r/ingensi/dockerbeat/~/dockerfile/
[7]: https://www.elastic.co/downloads/beats
