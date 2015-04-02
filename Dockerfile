FROM    fedora:21

MAINTAINER "JJ Eynon" <jj.eynon@cnn.com>

RUN yum -y update && yum clean all
RUN yum -y install npm && yum clean all

#RUN      apt-get update && apt-get install -y curl
#RUN      curl -sL https://deb.nodesource.com/setup | bash -
#RUN      apt-get install -y nodejs

# App
ADD . /web
# Install app dependencies
RUN cd /web; npm install

EXPOSE  8080
CMD ["node", "/web/index.js"]
