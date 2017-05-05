#!/bin/bash
set -euo pipefail

[ "$#" == "2" ] || {
	>&2 echo 'requires two paths to diff'
}

PATH_A=$1
PATH_B=$2

./gen-image.sh

WARE=$(cat .reppl | jq -r '.["Tags"]["diffoscope-image"]["Ware"]')
KIND=$(echo ${WARE} | jq -r '.type')
HASH=$(echo ${WARE} | jq -r '.hash')

>&2 echo "${WARE}"
FORMULA="$(cat <<EOF
inputs:
	"/":
		type: "${KIND}"
		hash: "${HASH}"
		silo: "file+ca://./wares/"
action:
	command:
		- "/usr/bin/diffoscope"
		- "/task/A"
		- "/task/B"
	escapes:
		mounts:
			"/task/A": "${PATH_A}"
			"/task/B": "${PATH_B}"
EOF
)"
>&2 echo "${FORMULA}"
repeatr run <(echo "${FORMULA}")