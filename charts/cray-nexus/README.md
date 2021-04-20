# cray-nexus

![Version: 1.0.0-alpha.1](https://img.shields.io/badge/Version-1.0.0--alpha.1-informational?style=flat-square) ![AppVersion: 3.30.0](https://img.shields.io/badge/AppVersion-3.30.0-informational?style=flat-square)

Sonatype Nexus is an open source repository manager

**Homepage:** <https://github.com/Cray-HPE/nexus3>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Zachary Crisler | zachary.crisler@hpe.com |  |

## Source Code

* <https://github.com/sonatype/nexus-public>
* <https://github.com/travelaudience/docker-nexus>
* <https://github.com/travelaudience/kubernetes-nexus>
* <https://github.com/travelaudience/docker-nexus-backup>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://oteemo.github.io/charts/ | sonatype-nexus | 2.3.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| init.adminCredentials.enabled | bool | `false` |  |
| init.adminCredentials.secret | string | `"nexus-admin-credentials"` |  |
| init.enabled | bool | `true` |  |
| init.image.pullPolicy | string | `"IfNotPresent"` |  |
| init.image.repository | string | `"ghcr.io/cray-hpe/nexus3-setup:0.5.2"` |  |
| init.image.tag | string | `"0.5.2"` |  |
| istio.enabled | bool | `true` |  |
| istio.ingress.gateway | string | `"services/services-gateway"` |  |
| istio.ingress.hosts.packages.authority | string | `"packages.local"` |  |
| istio.ingress.hosts.packages.enabled | bool | `true` |  |
| istio.ingress.hosts.packages.routes[0].headers.request.add.X-WEBAUTH-USER | string | `"admin"` |  |
| istio.ingress.hosts.packages.routes[0].headers.request.remove[0] | string | `"Authorization"` |  |
| istio.ingress.hosts.packages.routes[0].port | int | `80` |  |
| istio.ingress.hosts.registry.authority | string | `"registry.local"` |  |
| istio.ingress.hosts.registry.enabled | bool | `true` |  |
| istio.ingress.hosts.registry.routes[0].headers.request.add.X-WEBAUTH-USER | string | `"admin"` |  |
| istio.ingress.hosts.registry.routes[0].headers.request.remove[0] | string | `"Authorization"` |  |
| istio.ingress.hosts.registry.routes[0].port | int | `5003` |  |
| istio.ingress.hosts.ui.authority | string | `"nexus.local"` |  |
| istio.ingress.hosts.ui.enabled | bool | `false` |  |
| istio.ingress.hosts.ui.routes[0].headers.request.add.X-WEBAUTH-USER | string | `"admin"` |  |
| istio.ingress.hosts.ui.routes[0].headers.request.remove[0] | string | `"Authorization"` |  |
| istio.ingress.hosts.ui.routes[0].port | int | `80` |  |
| sealedSecrets | list | `[]` |  |
| sonatype-nexus.deployment.additionalVolumes[0].configMap.name | string | `"nexus-config"` |  |
| sonatype-nexus.deployment.additionalVolumes[0].name | string | `"nexus-config"` |  |
| sonatype-nexus.deployment.initContainers[0].command[0] | string | `"bin/sh"` |  |
| sonatype-nexus.deployment.initContainers[0].command[1] | string | `"-c"` |  |
| sonatype-nexus.deployment.initContainers[0].command[2] | string | `"if [ -z \"$(ls -A /nexus-data/*)\" ]; then\n    mkdir -p /nexus-data/etc\n    cp /nexus-config/nexus.properties /nexus-data/etc/nexus.properties\n    chown -Rv 200:200 /nexus-data\n    chmod -Rv u+rwX,go+rX,go-w /nexus-data\nfi\n"` |  |
| sonatype-nexus.deployment.initContainers[0].image | string | `"ghcr.io/cray-hpe/nexus3-setup:0.5.2"` |  |
| sonatype-nexus.deployment.initContainers[0].name | string | `"init-data"` |  |
| sonatype-nexus.deployment.initContainers[0].volumeMounts[0].mountPath | string | `"/nexus-data"` |  |
| sonatype-nexus.deployment.initContainers[0].volumeMounts[0].name | string | `"nexus-data"` |  |
| sonatype-nexus.deployment.initContainers[0].volumeMounts[1].mountPath | string | `"/nexus-config"` |  |
| sonatype-nexus.deployment.initContainers[0].volumeMounts[1].name | string | `"nexus-config"` |  |
| sonatype-nexus.deploymentStrategy.type | string | `"Recreate"` |  |
| sonatype-nexus.fullnameOverride | string | `"nexus"` |  |
| sonatype-nexus.nameOverride | string | `"nexus"` |  |
| sonatype-nexus.nexus.env[0].name | string | `"install4jAddVmParams"` |  |
| sonatype-nexus.nexus.env[0].value | string | `"-Xms4G -Xmx4G -XX:MaxDirectMemorySize=39158M -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"` |  |
| sonatype-nexus.nexus.env[1].name | string | `"NEXUS_SECURITY_RANDOMPASSWORD"` |  |
| sonatype-nexus.nexus.env[1].value | string | `"false"` |  |
| sonatype-nexus.nexus.imageName | string | `"ghcr.io/cray-hpe/nexus3"` |  |
| sonatype-nexus.nexus.imageTag | string | `"3.30.0"` |  |
| sonatype-nexus.nexus.podAnnotations."sidecar.istio.io/proxyCPULimit" | string | `"8"` |  |
| sonatype-nexus.nexus.podAnnotations."sidecar.istio.io/proxyMemoryLimit" | string | `"16Gi"` |  |
| sonatype-nexus.nexus.resources.limits.cpu | string | `"12"` |  |
| sonatype-nexus.nexus.resources.limits.memory | string | `"64Gi"` |  |
| sonatype-nexus.nexus.resources.requests.cpu | string | `"4"` |  |
| sonatype-nexus.nexus.resources.requests.memory | string | `"12Gi"` |  |
| sonatype-nexus.nexusBackup.persistence.enabled | bool | `false` |  |
| sonatype-nexus.nexusProxy.enabled | bool | `false` |  |
| sonatype-nexus.persistence.accessMode | string | `"ReadWriteMany"` |  |
| sonatype-nexus.persistence.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| sonatype-nexus.persistence.enabled | bool | `true` |  |
| sonatype-nexus.persistence.storageClass | string | `"ceph-cephfs-external"` |  |
| sonatype-nexus.persistence.storageSize | string | `"1000Gi"` |  |
| sonatype-nexus.service.annotations."metallb.universe.tf/address-pool" | string | `"node-management"` |  |
| sonatype-nexus.service.enabled | bool | `true` |  |
| sonatype-nexus.service.name | string | `"nexus"` |  |
| sonatype-nexus.service.port | int | `80` |  |
| sonatype-nexus.service.portName | string | `"nexus"` |  |
| sonatype-nexus.service.ports[0].name | string | `"default-registry"` |  |
| sonatype-nexus.service.ports[0].port | int | `5003` |  |
| sonatype-nexus.service.ports[0].targetPort | int | `5003` |  |
| sonatype-nexus.service.targetPort | int | `8081` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
