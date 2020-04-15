#!/bin/bash

docker run --restart=always --name squid-privoxy \
    -p 3128:3128 \
    -p 3129:3129 \
    -p 8118:8118 \
    synopsis8/squid-privoxy:arm32v7
