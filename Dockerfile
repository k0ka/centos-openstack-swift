FROM centos:7

ENV USER_ID=160 \
    GROUP_ID=160 \
    SUMMARY="Platform for running openstack swift" \
    DESCRIPTION="Openstack Swift is a highly available, distributed, eventually consistent object/blob store. \
Organizations can use Swift to store lots of data efficiently, safely, and cheaply."


LABEL maintainer="admin@idwrx.com" \
    summary="${SUMMARY}" \
    description="${DESCRIPTION}" \
    name="idwrx/openstack-swift"

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r -g $GROUP_ID swift && useradd -r -g swift -u $USER_ID swift


RUN yum update -y && \
	yum install -y centos-release-openstack-train && \
	yum install -y --setopt=tsflags=nodocs openstack-swift-object openstack-swift-container \
		openstack-swift-account openstack-swift-proxy rsync rsync-daemon && \
	yum clean all


COPY rsyncd.conf /etc/rsyncd.conf

CMD ['/bin/bash']
