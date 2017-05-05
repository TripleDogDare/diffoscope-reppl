#!/bin/bash
set -euo pipefail
./gen-image.sh
reppl eval './demo.frm'
