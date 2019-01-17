node.default['aem']['prometheus']['agent'] = 'jmx_prometheus_javaagent-0.3.1.jar'
node.default['aem']['prometheus']['base_dir'] = '/tmp/prometheus'
node.default['aem']['prometheus']['url'] = 'https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar'
node.default['aem']['prometheus']['cmd'] = 'java -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8889 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -javaagent:/tmp/jmx_prometheus_javaagent-0.3.1.jar=9404:osgi_metrics_config.yml -Xms4G -Xmx8G -XX:MaxPermSize=256M -jar cq-author-4502.jar'
#node.default['aem']['prometheus']['install_java'] = 