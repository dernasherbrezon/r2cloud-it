FROM resin/armv7hf-debian:stretch

ENV INITSYSTEM=on
ENV JAVA_VERSION=8u141-b15-1~deb9u1

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 129E7CDE \
    && gpg --armor --export 129E7CDE | sudo apt-key add - \
    && bash -c "echo 'deb [arch=armhf] http://s3.amazonaws.com/r2cloud r2cloud main' > /etc/apt/sources.list.d/r2cloud.list" \
    && apt-get update && apt -f install sox=14.4.1-5+b2 openjdk-8-jdk-headless=${JAVA_VERSION} openjdk-8-jre=${JAVA_VERSION} openjdk-8-jdk=${JAVA_VERSION} \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
