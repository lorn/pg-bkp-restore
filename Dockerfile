FROM postgres:9.6
MAINTAINER Lindolfo Rodrigues <lorn @ github>

# add config files
ADD . /
RUN rm /Dockerfile

ENTRYPOINT ["/opt/pg_copy.sh"]
