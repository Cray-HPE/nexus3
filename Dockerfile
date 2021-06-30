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

COPY keycloak-plugin/generate-credential-config /usr/local/bin
