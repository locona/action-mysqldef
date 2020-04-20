FROM alpine

ENV GO111MODULE=on

ENV MYSQLDEF_VERSION=v0.5.14

RUN apk --no-cache add git bash && \
    wget https://github.com/k0kubun/sqldef/releases/download/$MYSQLDEF_VERSION/mysqldef_linux_amd64.tar.gz && \
    tar -C /usr/local/bin -xzvf mysqldef_linux_amd64.tar.gz && \
    rm mysqldef_linux_amd64.tar.gz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
