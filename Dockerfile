FROM balenalib/armv7hf-debian:stretch-20201211

ENV INITSYSTEM=on

COPY modprobe /usr/bin/
COPY systemctl /usr/bin/
COPY systemd-tmpfiles /usr/bin/

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys A5A70917 \
    && gpg --armor --export A5A70917 | sudo apt-key add - \
    && bash -c "echo 'deb http://s3.amazonaws.com/r2cloud stretch main' > /etc/apt/sources.list.d/r2cloud.list" \
    && apt-get update && apt-get install sox r2cloud-jdk=20210221101106 wxtoimg=2.11.2 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/systemd-tmpfiles \
    && chmod +x /usr/bin/systemctl \
    && chmod +x /usr/bin/modprobe
    
