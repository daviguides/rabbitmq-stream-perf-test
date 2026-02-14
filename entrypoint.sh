#!/bin/bash
set -e

# Montar URI dinamicamente
URI="rabbitmq-stream://${RABBITMQ_ROOT_USER:-guest}:${RABBITMQ_ROOT_PASSWORD:-guest}@${RABBITMQ_HOST:-rabbitmq}:${RABBITMQ_STREAMS_PORT:-5552}/${RABBITMQ_VHOST:-%2f}"

# Executar o perf-test com parâmetros
exec java -Dio.netty.processId=1 -jar stream-perf-test.jar \
  --uris "$URI" \
  --max-length-bytes "${RABBITMQ_MAX_LENGTH_BYTES:-100mb}" \
  --rate "${RABBITMQ_RATE:-100}" \
  --producers "${RABBITMQ_PRODUCERS:-1}" \
  --consumers "${RABBITMQ_CONSUMERS:-1}" \
  "$@"