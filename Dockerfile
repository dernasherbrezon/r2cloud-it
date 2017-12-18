FROM resin/armv7hf-debian:stretch

ENV INITSYSTEM=on
ENV JAVA_VERSION=8u141-b15-1~deb9u1

RUN curl -s https://packagecloud.io/install/repositories/dernasherbrezon/r2cloud/script.deb.sh | sudo bash \
    && apt-get update && apt -f install r2cloud-ui sox=14.4.1-5+b2 openjdk-8-jre-headless=${JAVA_VERSION} openjdk-8-jdk-headless=${JAVA_VERSION} openjdk-8-jre=${JAVA_VERSION} openjdk-8-jdk=${JAVA_VERSION} \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
