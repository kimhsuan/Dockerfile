FROM openjdk:11-jre-buster

ARG SENTINEL_VERSION=1.7.2
ENV SENTINEL_HOME=/opt/sentinel-dashboard

RUN     DEBIAN_FRONTEND=noninteractive apt-get -qq update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        telnet \
        vim \
        procps \
        net-tools \
        iproute2 \
        iputils-ping \
    &&  apt-get -y autoremove \
    &&  apt-get -y clean \
    &&  rm -rf /var/lib/apt/lists/*

RUN     mkdir -p ${SENTINEL_HOME} \
    &&  wget "https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar" \
        -O "${SENTINEL_HOME}/sentinel-dashboard.jar"

WORKDIR ${SENTINEL_HOME}

EXPOSE 8719
EXPOSE 9019

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
STOPSIGNAL SIGQUIT