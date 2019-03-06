FROM resin/armv7hf-debian:stretch

ENV INITSYSTEM=on

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys A5A70917 \
    && gpg --armor --export A5A70917 | sudo apt-key add - \
    && bash -c "echo 'deb [arch=armhf] http://s3.amazonaws.com/r2cloud r2cloud main' > /etc/apt/sources.list.d/r2cloud.list" \
    && apt-get update && apt-get install sox=14.4.1-5+b2 r2cloud-jdk=20190305232021 wxtoimg=2.11.2 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
