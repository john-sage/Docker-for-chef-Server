FROM ubuntu:16.04 
MAINTAINER OitOps 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl rsync && \
    wget --no-check-certificate --content-disposition "https://packages.chef.io/files/stable/chef-server/12.17.33/ubuntu/16.04/chef-server-core_12.17.33-1_amd64.deb" && \
    dpkg -i chef-server-core_12.17.33-1_amd64.deb* && \
    rm chef-server-core_12.17.33-1_amd64.deb* && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*
COPY main.sh chef.sh /usr/local/bin/
VOLUME /var/log
CMD ["main.sh"]
