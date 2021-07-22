ARG ARCH=
FROM ${ARCH}alpine:3.14.0
MAINTAINER Max Kueng (https://maxkueng.com/contact)

RUN apk --no-cache --virtual deps add git && \
    git clone https://github.com/50ButtonsEach/fliclib-linux-hci /tmp/src && \
    cp /tmp/src/bin/armv6l/flicd /usr/bin/flicd && \
    chmod +x /usr/bin/flicd && \
    mkdir /data && \
    rm -rf /tmp/src && \
    apk del deps

WORKDIR /data
VOLUME [ "/data" ]
EXPOSE 5551
CMD [ "/usr/bin/flicd", \
      "--db-file", "/data/flic.sqlite", \
      "--server-addr", "0.0.0.0", \
      "--server-port", "5551" \
    ]
