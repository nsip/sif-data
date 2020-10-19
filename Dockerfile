# docker build -t nsip/sif-data:latest -t nsip/sif-data:v0.1.0 .
# docker run -it -p8080:8080 nsip/sif-data:latest
# docker push nsip/sif-data:v0.1.0
# docker push nsip/sif-data:latest
FROM perl:5.26

RUN cpanm HTTP::Server::Simple::CGI
RUN cpanm Text::CSV
RUN cpanm Data::UUID
RUN cpanm Data::RandomPerson
RUN cpanm Data::Random
RUN cpanm YAML
RUN cpanm DBI
RUN cpanm DBD::mysql

#RUN cpanm Carton \
#    && mkdir -p /usr/src/app
#WORKDIR /usr/src/app

#ONBUILD COPY cpanfile* /usr/src/myapp
#ONBUILD RUN carton install

#ONBUILD COPY . /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app
CMD [ "perl", "bin/server.pl" ]
