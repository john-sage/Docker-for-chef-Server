FROM ubuntu:16.04
MAINTAINER OitOps 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl vim rsync && \
    wget --no-check-certificate --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=16.04&m=x86_64&v=latest&prerelease=false&nightlies=false" && \
    dpkg -i chef-server-core_12.17.15-1_amd64.deb* && \
    rm chef-server-core_12.17.15-1_amd64.deb* && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*
COPY main.sh chef.sh /usr/local/bin/
VOLUME /var/log
CMD ["main.sh"]
