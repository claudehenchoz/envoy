FROM        debian:unstable-slim
MAINTAINER  Claude Henchoz  <https://claude.io>

ENV DEBIAN_FRONTEND noninteractive

# Update/Upgrade/Cleansing
RUN apt-get update && \
    apt-get install -yq --no-install-recommends python-bottle python-gnupg python-rstr python-paste gnupg2 ca-certificates && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

ADD envoy envoy

EXPOSE 62266

WORKDIR envoy
CMD ["python", "envoy.py"]
