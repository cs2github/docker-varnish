#!/bin/bash

# Start varnish
varnishd -f /etc/varnish/default.vcl -S /etc/varnish/secret -s ${VARNISH_STORAGE} ${VARNISH_PARAMS} -a 0.0.0.0:${VARNISH_PORT} -T 0.0.0.0:6082
# Somehow required, otherwise it fails to start...
sleep 1
# Start varnishlog and keep container running
varnishlog
