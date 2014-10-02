# Rsync
#
# VERSION               0.0.1

FROM debian:jessie
MAINTAINER Urs Breu <ubreu@gleisdrei.ch>

RUN apt-get update
RUN apt-get install -y ssh rsync

RUN mkdir -p /root/.ssh/
ONBUILD ADD target-ssh-key /root/.ssh/
ONBUILD RUN chmod 600 /root/.ssh/target-ssh-key

ENTRYPOINT ["/usr/bin/rsync"]
CMD ["--help"]
