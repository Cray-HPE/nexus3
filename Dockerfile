FROM sonatype/nexus3:3.25.0

# Install the Keycloak plugin, see https://github.com/flytreeleft/nexus3-keycloak-plugin
ARG KEYCLOAK_PLUGIN_VERSION=0.5.0
ADD https://github.com/flytreeleft/nexus3-keycloak-plugin/releases/download/v${KEYCLOAK_PLUGIN_VERSION}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar /opt/sonatype/nexus/deploy/

USER root

# This Nexus image is based on the RHEL Universal Base Image (UBI).
# Update any base image packagess now so that we keep our Nexus image
# current.
RUN dnf update -y

RUN curl -sfL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/bin/jq \
    && chmod +x /usr/bin/jq

RUN chown nexus:nexus /opt/sonatype/nexus/deploy/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar

# The plugin requires an updated JVM cacerts file and credential
# which must be referenced from nexus.vmoptions.  The nexus user
# will need to modify the file so it makes sense that nexus
# should just own the file.
RUN chown nexus:nexus /opt/sonatype/nexus/bin/nexus.vmoptions
RUN dnf install -y openssl

# Allow nexus to modify the logging properties for debugging purposes.
RUN chown nexus:nexus /opt/sonatype/nexus/etc/logback/logback.xml

COPY create-trust-store.sh /usr/local/bin/

USER nexus
