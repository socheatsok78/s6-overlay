ARG OUTPUT=output

# s6-overlay-noarch.tar.xz
FROM scratch AS s6-overlay-noarch
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-noarch.tar.xz /

# s6-overlay-i686.tar.xz
FROM s6-overlay-noarch AS s6-overlay-386
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-i686.tar.xz /

# s6-overlay-x86_64.tar.xz
FROM s6-overlay-noarch AS s6-overlay-amd64
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-x86_64.tar.xz /

# s6-overlay-armhf.tar.xz
FROM s6-overlay-noarch AS s6-overlay-armv6
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-armhf.tar.xz /

# s6-overlay-arm.tar.xz
FROM s6-overlay-noarch AS s6-overlay-armv7
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-arm.tar.xz /

# s6-overlay-aarch64.tar.xz
FROM s6-overlay-noarch AS s6-overlay-arm64
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-aarch64.tar.xz /

# s6-overlay-riscv64.tar.xz
FROM s6-overlay-noarch AS s6-overlay-riscv64
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-riscv64.tar.xz /

# s6-overlay-s390x.tar.xz
FROM s6-overlay-noarch AS s6-overlay-s390x
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-s390x.tar.xz /

# s6-overlay-symlinks-noarch.tar.xz & s6-overlay-symlinks-arch.tar.xz
FROM scratch AS s6-overlay-symlinks
ARG OUTPUT
ADD ${OUTPUT}/s6-overlay-symlinks-noarch.tar.xz /
ADD ${OUTPUT}/s6-overlay-symlinks-arch.tar.xz /

# syslogd-overlay-noarch.tar.xz
FROM scratch AS s6-overlay-syslogd
ARG OUTPUT
ADD ${OUTPUT}/syslogd-overlay-noarch.tar.xz /

# s6-overlay
FROM s6-overlay-${TARGETARCH}${TARGETVARIANT} AS s6-overlay
FROM s6-overlay
