ARG BUILD_FROM
FROM $BUILD_FROM

# Install base dependencies
RUN apk add --no-cache \
    bash \
    perl \
    perl-app-cpanminus \
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
    perl-archive-zip \
    ca-certificates \
    wget \
    tar \
    gzip \
    make \
    gcc \
    musl-dev \
    perl-dev \
    libxml2-dev \
    zlib-dev

# Install XML::LibXML via CPAN
RUN cpanm --notest XML::LibXML XML::TreePP

# Install XMLTV 1.4.0 (latest release, Oct 2024) - UPDATED 2025-12-07
WORKDIR /tmp
RUN wget -q https://github.com/XMLTV/xmltv/archive/refs/tags/v1.4.0.tar.gz && \
    tar xzf v1.4.0.tar.gz && \
    cd xmltv-1.4.0 && \
    perl Makefile.PL --yes && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/*

# Set PERL5LIB environment variable permanently
ENV PERL5LIB=/usr/local/lib/perl5/site_perl:/usr/local/share/perl5/site_perl

# Verify tv_grab_zz_sdjson is installed and show version
RUN tv_grab_zz_sdjson --version

# Create data directory
RUN mkdir -p /share/xmltv

# Copy rootfs
COPY rootfs /

# Ensure scripts are executable
RUN chmod +x /etc/services.d/xmltv-grabber/run && \
    chmod +x /etc/services.d/xmltv-grabber/finish