#!/usr/bin/env sh

# Set proxy
PROXY_URL=web-proxy.seclab.local:8088
export http_proxy=$PROXY_URL
export https_proxy=$PROXY_URL

# Download last LTS JDK
JAVA_BASE=~/.local/share/jvm
AMAZON_CORRETTO_URL=https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz
mkdir -p $JAVA_BASE
curl -L $AMAZON_CORRETTO_URL | tar -xz -C $JAVA_BASE

# Collect JDK info
jdirs=($(ls -DtU ${JAVA_BASE} | grep amazon-))
last_jdk=${jdirs[-1]}
# java_vers=$(sed 's/.*etto-\(.*\)-lin.*/\1/' <<< "$last_jdk")
# echo $java_vers

# Configure Java env variables
BASHRC=~/.bash_profile
echo -e "export JAVA_HOME=$JAVA_BASE/$last_jdk" | tee -a $BASHRC
echo -e "export PATH=\$JAVA_HOME/bin:\$PATH" | tee -a $BASHRC

# Unset proxy
unset http_proxy
unset https_proxy
