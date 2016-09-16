#!/bin/bash

CONSOLE=$(puppet config print server)

curl -X GET \
  --tlsv1 \
  --cert   $(puppet config print hostcert) \
  --key    $(puppet config print hostprivkey) \
  --cacert $(puppet config print localcacert) \
  https://"${CONSOLE}":4433/status/v1/services | python -m json.tool
