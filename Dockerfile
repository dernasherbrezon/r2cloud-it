FROM balenalib/armv7hf-debian:bullseye-20230502

ENV INITSYSTEM=on

COPY modprobe /usr/bin/

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys A5A70917 \
    && gpg --armor --export A5A70917 | sudo apt-key add - \
    && bash -c "echo 'deb http://s3.amazonaws.com/r2cloud bullseye main' > /etc/apt/sources.list.d/r2cloud.list" \
    && apt-get update && apt-get install systemd sox r2cloud-jdk=17.0.5-3 wxtoimg=2.11.2-1 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/modprobe

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;    
