FROM python:alpine3.15

USER root
WORKDIR /root

COPY ENTRYPOINT.sh alt_install.sh /

RUN apk update && apk add \
    curl \
    iproute2 \
    iputils \
    net-tools \
    openvswitch \
    tcpdump \
    vim \
    libx11 \
    xterm \
    git \
    bash \
 && chmod +x /ENTRYPOINT.sh

RUN git clone https://github.com/mininet/mininet.git && \
    mv /alt_install.sh /root/mininet/util/ && \
    /bin/bash /root/mininet/util/alt_install.sh 

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
