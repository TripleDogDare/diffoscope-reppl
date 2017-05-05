#!/bin/bash
set -euo pipefail
mkdir -p wares
mkdir -p debug
./gen-image.sh
# reppl  put hash 'objectA' --warehouse='file://./demo/fileA' --kind='file'
# reppl  put hash 'objectB' --warehouse='file://./demo/fileB' --kind='file'
reppl eval './diffoscope.frm'
