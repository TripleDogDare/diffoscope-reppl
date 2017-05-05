#!/bin/bash
set -euo pipefail
mkdir -p wares
mkdir -p debug

reppl init
reppl  put hash 'base'       'aLMH4qK1EdlPDavdhErOs0BPxqO0i6lUaeRE4DuUmnNMxhHtF56gkoeSulvwWNqT'  --warehouse='http+ca://repeatr.s3.amazonaws.com/assets/' --kind='tar'
reppl eval 'staid-debian.frm'
reppl eval 'diffoscope-image.frm'
# reppl unpack staid-debian debug/staid-debian
# reppl unpack diffoscope-image debug/diffoscope-image
