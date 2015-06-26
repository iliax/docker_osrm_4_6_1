FROM ubuntu:14.04.1
MAINTAINER iliax <i.kuramshin@gradoservice.com>

RUN apt-get update

RUN apt-get -y install build-essential git cmake pkg-config libprotoc-dev libprotobuf8 \
protobuf-compiler libprotobuf-dev libosmpbf-dev libpng12-dev \
libbz2-dev libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev \
libzip-dev libboost-all-dev lua5.1 liblua5.1-0-dev libluabind-dev libluajit-5.1-dev libtbb-dev wget

RUN mkdir -p /osrm
RUN git clone https://github.com/Project-OSRM/osrm-backend.git /osrm/project-osrm
RUN cd /osrm/project-osrm && git checkout v4.6.1

RUN mkdir -p /osrm/project-osrm/build

WORKDIR /osrm/project-osrm/build
RUN cmake ..
RUN make
RUN cp ../profiles/car.lua profile.lua
RUN ln -s ../profiles/lib/

RUN echo "disk=/tmp/stxxl,20000,mmap" > .stxxl

VOLUME /srv/data
VOLUME /tmp

EXPOSE 5000 # maybe run osrm server here
