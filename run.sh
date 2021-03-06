#!/bin/sh

echo "Mode -> $1"

set -e

case "$1" in
  'replicate_crypto')
   python -u manage.py replicate_post_status
   while true ; do
        python -u manage.py replicate_crypto
        sleep 60
   done
;;
  'replicate_stocks')
   python -u manage.py replicate_post_status
   while true ; do
        python -u manage.py replicate_stocks
        sleep 600
   done
;;
  'server')
    python -u server.py
;;
  *)
    echo 'unexpected $RUN_MODE'; exit 1
;;
esac