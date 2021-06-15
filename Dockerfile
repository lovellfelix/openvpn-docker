# Smallest base image
FROM alpine:3.14

LABEL maintainer Lovell Felix<hello@lovellfelix.com>
LABEL org.label-schema.build-date $BUILD_DATE
LABEL org.label-schema.name openvpn
LABEL org.label-schema.description Openvpn server in docker
LABEL org.label-schema.url https://github.com/lovellfelix/openvpn-docker
LABEL org.label-schema.vcs-url https://github.com/lovellfelix/openvpn-docker
LABEL org.label-schema.version 2.4.0

# Install needed packages
RUN apk update
RUN apk add openssl easy-rsa openvpn iptables bash
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Configure tun
RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 

