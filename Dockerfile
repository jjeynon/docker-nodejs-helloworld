FROM    fedora:21

MAINTAINER "JJ Eynon" <jj.eynon@cnn.com>

RUN yum -y update && yum clean all
RUN yum -y install npm && yum clean all

# FIX: https://vpavlin.eu/2015/02/fedora-docker-and-systemd/
#RUN systemctl mask systemd-remount-fs.service dev-hugepages.mount sys-fs-fuse-connections.mount systemd-logind.service getty.target console-getty.service
#RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service
#VOLUME ["/sys/fs/cgroup", "/run", "/tmp"]
#ENV container=docker
#CMD ["/usr/sbin/init"]
# END OF FIX

ADD . /src

RUN cd /src; npm install

EXPOSE  8080

CMD ["node", "/src/index.js"]
