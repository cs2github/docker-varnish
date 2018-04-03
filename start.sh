#!/bin/bash

# Start varnish
varnishd -F -f /etc/varnish/default.vcl -S /etc/varnish/secret -s ${VARNISH_STORAGE} ${VARNISH_PARAMS} -a 0.0.0.0:${VARNISH_PORT} -T 0.0.0.0:6082

