#!/usr/bin/env bash

REPO_ROOT="/git"

if [ -d "${REPO_ROOT}/camel" ] && [ -d "${REPO_ROOT}/camel-karaf" ] && [ -d "${REPO_ROOT}/camel-spring-boot" ]; then
    echo "Camel repositories already present"
else
    mkdir -p ${REPO_ROOT}/camel ${REPO_ROOT}/camel-karaf ${REPO_ROOT}/camel-spring-boot
    git clone https://gitbox.apache.org/repos/asf/camel.git ${REPO_ROOT}/camel
    git clone https://gitbox.apache.org/repos/asf/camel-karaf.git ${REPO_ROOT}/camel-karaf && \
    git clone https://gitbox.apache.org/repos/asf/camel-spring-boot.git ${REPO_ROOT}/camel-spring-boot
fi
