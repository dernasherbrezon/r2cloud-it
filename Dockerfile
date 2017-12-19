FROM resin/armv7hf-debian:stretch

ENV INITSYSTEM=on

RUN curl -s https://packagecloud.io/install/repositories/dernasherbrezon/r2cloud/script.deb.sh | sudo bash \
    && apt-get update && apt -f install sox=14.4.1-5+b2 ejdk-8-full=20171217161916 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
