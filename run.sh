#!/bin/bash

docker run --rm -ti --name tor \
    --rm \
    -p 3128:3128 \
    -p 3129:3129 \
    synopsis8/squid-privoxy
