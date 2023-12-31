#!/usr/bin/env sh

# Set proxy
PROXY_URL=web-proxy.seclab.local:8088
export http_proxy=$PROXY_URL
export https_proxy=$PROXY_URL

# Install Java 17 Corretto
# yum -y update
rpm --import https://yum.corretto.aws/corretto.key
curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
yum install -y java-17-amazon-corretto-devel

# Unset proxy
unset http_proxy
unset https_proxy
