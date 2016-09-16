#!/bin/bash

PUPPETDB=$(puppet config print server)
curl -X GET \
  --tlsv1 \
  --cert   $(puppet config print hostcert) \
  --key    $(puppet config print hostprivkey) \
  --cacert $(puppet config print localcacert) \
  https://"${PUPPETDB}":8081/status/v1/services/puppetdb-status | python -m json.tool
