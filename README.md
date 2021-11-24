# Docker image for Openstack Swift (release Train) based on CentOS 7

## Usage

You have to run 13 containers - one for each daemon

```shell
$ docker run -d \
  --name swift-rsync \
  -v /swift/data:/mnt \
  ghcr.io/k0ka/centos-openstack-swift \
  /usr/bin/rsync --daemon --no-detach -6
```

```shell
$ docker run -d \
  --name swift-rsync \
  -v /swift/config:/etc/swift \
  -v /swift/data:/mnt \
  ghcr.io/k0ka/centos-openstack-swift \
  /usr/bin/swift-object-server /etc/swift/object-server.conf
```

```shell
$ docker run -d \
  --name swift-rsync \
  -v /swift/config:/etc/swift \
  -v /swift/data:/mnt \
  ghcr.io/k0ka/centos-openstack-swift \
  /usr/bin/swift-object-auditor /etc/swift/object-server.conf
```

etc. Rest commands are:
* /usr/bin/swift-object-replicator /etc/swift/object-server.conf
* /usr/bin/swift-object-updater /etc/swift/object-server.conf
* /usr/bin/swift-container-server /etc/swift/container-server.conf
* /usr/bin/swift-container-auditor /etc/swift/container-server.conf
* /usr/bin/swift-container-replicator /etc/swift/container-server.conf
* /usr/bin/swift-container-updater /etc/swift/container-server.conf
* /usr/bin/swift-account-server /etc/swift/account-server.conf'
* /usr/bin/swift-account-auditor /etc/swift/account-server.conf
* /usr/bin/swift-account-reaper /etc/swift/account-server.conf
* /usr/bin/swift-account-replicator /etc/swift/account-server.conf

Commands may differ if you're using other types of replication or policy.
