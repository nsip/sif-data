# docker build -t nsip/sif-data:latest -t nsip/sif-data:v0.1.0 .
# docker push nsip/sif-data:v0.1.0
# docker push nsip/sif-data:latest
FROM perl:5.26

RUN cpanm Carton \
    && mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY cpanfile* /usr/src/myapp
ONBUILD RUN carton install

ONBUILD COPY . /usr/src/app
