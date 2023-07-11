# Node Dockerfile for testing Pisound install

# Use official debian image, but pull the armhf (v7+) image explicitly because
# Docker currently has a bug where armel is used instead when relying on
# multiarch manifest: https://github.com/moby/moby/issues/34875
# When this is fixed, thpisound_install_noSUDO.shis can be changed to just `FROM debian:stretch-slim`
FROM arm32v7/debian:buster-slim
MAINTAINER Orcasound <orcanode-devs@orcasound.net>

# Upgrade OS
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Set default command to bash as a placeholder
CMD ["/bin/bash"]

# Make sure we're the root user
USER root

WORKDIR /root

# Install required libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg

RUN echo Importing Blokas GPG public key...
RUN curl -s -k https://blokas.io/blokas-archive-keyring.gpg | dd status=none of=/usr/share/keyrings/blokas-archive-keyring.gpg
RUN echo Adding Blokas apt repository...
RUN echo "deb [signed-by=/usr/share/keyrings/blokas-archive-keyring.gpg] http://blokas.io/apt/ rpi main" | dd status=none of=/etc/apt/sources.list.d/blokas.list

RUN echo -------------- Updating package list...
RUN apt-get update
RUN apt-get -y upgrade
RUN echo -------------- Installing Pisound software...
RUN apt-get -y install pisound

RUN arecord -l

RUN echo
