#!/bin/bash

URL=$(cat /etc/monit/slack-url)
MESSAGE="Worker is recovery"

TEXT=$(echo -e "$MONIT_DATE $MONIT_HOST $MESSAGE" | python3 -c "import json,sys;print(json.dumps(sys.stdin.read()))")

PAYLOAD="{
  \"attachments\": [
    {
      \"text\": $TEXT,
      \"mrkdwn_in\": [\"text\"],
    }
  ]
}"

curl -s -X POST --data-urlencode "payload=$PAYLOAD" $URL
