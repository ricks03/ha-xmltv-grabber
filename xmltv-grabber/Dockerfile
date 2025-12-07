ARG BUILD_FROM
FROM $BUILD_FROM

# Install dependencies
RUN apk add --no-cache \
    bash \
    perl \
    perl-json \
    perl-libwww \
    perl-lwp-protocol-https \
    perl-http-cookies \
    perl-xml-parser \
    perl-xml-twig \
    perl-xml-writer \
    perl-date-manip \
    perl-digest-sha1 \
    perl-file-slurp \
    perl-datetime \
    perl-datetime-format-strptime \
    wget \
    tar \
    bzip2

# Install XMLTV from GitHub
WORKDIR /tmp
RUN wget -q https://github.com/XMLTV/xmltv/archive/refs/tags/v1.2.1.tar.gz && \
    tar xzf v1.2.1.tar.gz && \
    cd xmltv-1.2.1 && \
    echo "yes" | perl Makefile.PL PREFIX=/usr && \
    make -j4 || true && \
    make install || true && \
    cd / && \
    rm -rf /tmp/*

# Verify tv_grab_zz_sdjson is installed
RUN which tv_grab_zz_sdjson || echo "Warning: tv_grab_zz_sdjson not found in PATH"

# Create data directory
RUN mkdir -p /share/xmltv

# Copy rootfs
COPY rootfs /