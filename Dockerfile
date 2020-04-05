FROM python:3.7-alpine

LABEL maintainer="Matteo Ragni <matteo.ragni@antemotion.com>"
LABEL version="1.0"
LABEL description="Image for building documentation"

RUN apk add --no-cache --virtual .doxy-build-deps \
        alpine-sdk \ 
        libxml2-dev \
        xmlsec-dev

RUN apk add --no-cache \
        doxygen \
        git

RUN pip install -U -e git+https://github.com/sphinx-doc/sphinx.git@3.x#egg=sphinx
RUN pip install -U -e git+https://github.com/michaeljones/breathe.git@v4.14.1#egg=breathe
RUN pip install -U \
        sphinx-rtd-theme \
        recommonmark \
        sphinx-fontawesome \
        exhale \
        sphinxcontrib-matlabdomain

RUN apk del --no-network .doxy-build-deps