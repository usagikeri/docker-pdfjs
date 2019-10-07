FROM httpd

WORKDIR /usr/local/apache2/htdocs
COPY ./httpd.conf /usr/local/apache2/conf/

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install wget unzip -y &&\
    wget https://github.com/mozilla/pdf.js/releases/download/v2.0.943/pdfjs-2.0.943-dist.zip &&\
    unzip pdfjs-2.0.943-dist.zip &&\
    rm -rf pdfjs-2.0.943-dist.zip &&\
    apt remove wget --purge -y &&\
    apt remove unzip --purge -y &&\
    apt-get clean &&\ 
    rm -rf /var/lib/apt/lists/*
