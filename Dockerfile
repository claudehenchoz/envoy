FROM        debian:unstable-slim
MAINTAINER  Claude Henchoz  <https://claude.io>

ENV DEBIAN_FRONTEND noninteractive

# Update/Upgrade/Cleansing
RUN apt-get update && \
    apt-get install -yq --no-install-recommends python-flask python-gnupg python-rstr python-paste gnupg2 ca-certificates && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

ADD envoy envoy

EXPOSE 5000

ENV FLASK_APP=envoy.py

WORKDIR envoy

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
