ARG IMAGE=sonatype/nexus3
FROM $IMAGE

# Install the Keycloak plugin, see https://github.com/flytreeleft/nexus3-keycloak-plugin
ARG KEYCLOAK_PLUGIN_VERSION=0.5.0
ADD https://github.com/flytreeleft/nexus3-keycloak-plugin/releases/download/v${KEYCLOAK_PLUGIN_VERSION}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar /opt/sonatype/nexus/deploy/

COPY keycloak-plugin/initialize-keycloak-plugin /usr/local/bin
COPY keycloak-plugin/generate-credential-config /usr/local/bin

USER root
# The plugin requires an updated JVM cacerts file and credential
# which must be referenced from nexus.vmoptions.  The nexus user
# will need to modify the file so it makes sense that nexus
# should just own the file.
RUN chown nexus:nexus /opt/sonatype/nexus/bin/nexus.vmoptions
RUN yum install -y openssl

# Allow nexus to modify the logging properties for debugging purposes.
RUN chown nexus:nexus /opt/sonatype/nexus/etc/logback/logback.xml
USER nexus
COPY keycloak-plugin/configure-jvm-cacerts /usr/local/bin
