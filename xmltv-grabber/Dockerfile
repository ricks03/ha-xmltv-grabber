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
    wget \
    make \
    gcc \
    musl-dev \
    perl-dev

# Install XMLTV
WORKDIR /tmp
RUN wget -q -O xmltv.tar.bz2 https://sourceforge.net/projects/xmltv/files/xmltv/1.0.0/xmltv-1.0.0.tar.bz2/download && \
    tar xjf xmltv.tar.bz2 && \
    cd xmltv-* && \
    yes | perl Makefile.PL && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/*

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]