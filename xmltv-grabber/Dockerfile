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
    perl-archive-zip \
    ca-certificates \
    wget \
    tar \
    gzip \
    make \
    gcc \
    musl-dev \
    perl-dev

# Install XMLTV to standard Perl location
WORKDIR /tmp
RUN wget -q https://github.com/XMLTV/xmltv/archive/refs/tags/v1.2.1.tar.gz && \
    tar xzf v1.2.1.tar.gz && \
    cd xmltv-1.2.1 && \
    perl Makefile.PL --yes && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/*

# Set PERL5LIB environment variable permanently
ENV PERL5LIB=/usr/local/lib/perl5/site_perl:/usr/local/share/perl5/site_perl

# Verify tv_grab_zz_sdjson is installed and works
RUN tv_grab_zz_sdjson --version || (echo "ERROR: tv_grab_zz_sdjson not found!" && exit 1)

# Create data directory
RUN mkdir -p /share/xmltv

# Copy rootfs
COPY rootfs /

# Ensure scripts are executable
RUN chmod +x /etc/services.d/xmltv-grabber/run && \
    chmod +x /etc/services.d/xmltv-grabber/finish