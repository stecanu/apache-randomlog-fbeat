#!/bin/bash
python apache-fake-log-gen.py -n 0 -s 5 -o LOG -p WEB${HOSTNAME} &
if [ -z "${ELK_HOST}" ]; then
    export ELK_HOST="127.0.0.1"
    echo "${ELK_HOST}"
fi
echo  "${ELK_HOST} elk" >> /etc/hosts

if [ -z "${NODE_NAME}" ]; then
    export NODE_NAME="Node$((RANDOM%10000))"
    echo "${NODE_NAME}"
fi

sed -i "s/apache-node/apache-$NODE_NAME/g"  /usr/share/filebeat/filebeat.yml
filebeat run   -v  -e -c /usr/share/filebeat/filebeat.yml &