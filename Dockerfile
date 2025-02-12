FROM alpine:3.3 AS builder

RUN apk add --no-cache \
    gcc \
    make \
    musl-dev \
    curl \
    linux-headers \
    libc-dev \
    build-base \
    tar

ARG NETPERF_VERSION=2.7.0
RUN curl -L https://github.com/HewlettPackard/netperf/archive/refs/tags/netperf-${NETPERF_VERSION}.tar.gz | tar xz \
    && mv netperf-netperf-${NETPERF_VERSION} /netperf-src

WORKDIR /netperf-src
RUN ./configure \
    --enable-static=yes \
    --enable-shared=no \
    CFLAGS="-static" \
    LDFLAGS="-static" \
    && make \
    && strip -s /netperf-src/src/netperf /netperf-src/src/netserver

#-------------------------------------------
FROM nicolaka/netshoot:latest

COPY --from=builder /netperf-src/src/netperf /usr/local/bin/
COPY --from=builder /netperf-src/src/netserver /usr/local/bin/

RUN chmod +x /usr/local/bin/netperf /usr/local/bin/netserver 

ENTRYPOINT ["/bin/bash"]
