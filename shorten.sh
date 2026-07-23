#!/bin/bash
# Usage: ./shorten.sh <reel-or-video-url>
# Wraps the link in the redirect page, then shortens it via TinyURL.

if [ -z "$1" ]; then
  echo "Usage: ./shorten.sh <reel-or-video-url>"
  exit 1
fi

REEL_URL="$1"
ENCODED=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1], safe=''))" "$REEL_URL")
FULL_URL="https://sushandristi.github.io/relationship/?url=$ENCODED"
SHORT=$(curl -s "https://tinyurl.com/api-create.php?url=$FULL_URL")

echo "$SHORT"
