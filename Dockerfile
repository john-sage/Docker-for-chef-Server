FROM ubuntu:16.04
MAINTAINER OitOps 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl vim rsync && \
    wget --no-check-certificate --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=16.04&m=x86_64&v=latest&prerelease=false&nightlies=false" && \
    dpkg -i chef-server*.deb && \
    rm chef-server*.deb && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
COPY main.sh chef.sh /usr/local/bin/
VOLUME /var/log
CMD ["main.sh"]
