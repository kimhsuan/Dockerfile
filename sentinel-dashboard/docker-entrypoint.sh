#!/bin/bash
java -Dserver.port=9019 \
    -Dcsp.sentinel.dashboard.server=localhost:9019 \
    -Dproject.name=sentinel-dashboard \
    -jar ${SENTINEL_HOME}/sentinel-dashboard.jar
