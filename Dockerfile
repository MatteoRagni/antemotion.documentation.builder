FROM python:3.7-buster

LABEL maintainer="Matteo Ragni <matteo.ragni@antemotion.com>"
LABEL version="1.0"
LABEL description="Image for building documentation"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        build-essential \ 
        epubcheck \
        git \
        graphviz \
        imagemagick \
        make \
        lmodern \
        libxml2-dev \
        libxmlsec1-dev \
        doxygen \
        git \
        libxslt1-dev \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-luatex \
        texlive-xetex \
        latexmk \
 && apt-get autoremove \
 && apt-get clean

RUN pip install -U -e git+https://github.com/sphinx-doc/sphinx.git@3.x#egg=sphinx
RUN pip install -U -e git+https://github.com/michaeljones/breathe.git@v4.14.1#egg=breathe
RUN pip install -U \
        sphinx-rtd-theme \
        recommonmark \
        sphinx-fontawesome \
        exhale \
        sphinxcontrib-matlabdomain \
        sphinxcontrib-mermaid

CMD ["/bin/sh"]