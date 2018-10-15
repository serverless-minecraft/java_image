#!/bin/bash -exu

serverName=$(curl http://169.254.170.2/v2/metadata | jq '.family')

players=$(rcon-cli list | head -1 | cut -d' ' -f3)
[ $players == '' ] && players=0

aws cloudwatch put-metric-data \
  --namespace minecraft \
  --dimensions server=${serverName} \
  --metric-name playerCount \
  --value ${players}