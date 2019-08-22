FROM neo4j:3.5.8-enterprise

ENV _JAVA_OPTIONS=-Xmx2g \
    NEO4J_ACCEPT_LICENSE_AGREEMENT='yes' \
    NEO4J_dbms_connector_http_listen__address=':7474' \
    NEO4J_dbms_connector_bolt_listen__address=':7687' \
    NEO4J_PLUGINS_PATH=/var/lib/neo4j/plugins \
    NEO4J_APOC_PLUGIN_VERSION=3.5.0.4 \
    NEO4J_APOC_PLUGIN_PATH=$NEO4J_PLUGINS_PATH/apoc-$NEO4J_APOC_PLUGIN_VERSION-all.jar \
    NEO4J_apoc_export_file_enabled=true \
    NEO4J_apoc_import_file_enabled=true \
    NEO4J_apoc_import_file_use__neo4j__config=true

RUN apt-get update && apt-get -qq -y install wget
RUN wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/$NEO4J_APOC_PLUGIN_VERSION/apoc-$NEO4J_APOC_PLUGIN_VERSION-all.jar
RUN mv apoc-$NEO4J_APOC_PLUGIN_VERSION-all.jar $NEO4J_PLUGINS_PATH/apoc.jar

ENTRYPOINT ["/sbin/tini", "-g", "--", "/docker-entrypoint.sh"]
CMD ["neo4j"]