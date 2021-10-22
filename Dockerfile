ARG IMAGE=sonatype/nexus3
FROM $IMAGE

# Install the Keycloak plugin, see https://github.com/flytreeleft/nexus3-keycloak-plugin
ARG KEYCLOAK_PLUGIN_VERSION=0.5.0
ADD https://github.com/flytreeleft/nexus3-keycloak-plugin/releases/download/v${KEYCLOAK_PLUGIN_VERSION}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar /opt/sonatype/nexus/deploy/
