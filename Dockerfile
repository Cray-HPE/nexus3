# Pin to 3.25.0 as this is the current tested version.  Also
# the newer version is missing the Sign Out button and may
# have other unknown changes.  Note the version number here
# is used by the GH action to create the final image version.
FROM sonatype/nexus3:3.25.0

# Install the Keycloak plugin.
# See https://github.com/flytreeleft/nexus3-keycloak-plugin
# NXRM has no admin API for adding the plugin so this action
# can not be performed from within nexus-setup.  The plugin
# directory is also only writable by root.

COPY keycloak-plugin/nexus3-keycloak-plugin-0.5.0-bundle.kar \
     /opt/sonatype/nexus/deploy
#COPY keycloak-plugin/nexus3-keycloak-plugin-0.6.0-SNAPSHOT-bundle.kar \
#     /opt/sonatype/nexus/deploy

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
