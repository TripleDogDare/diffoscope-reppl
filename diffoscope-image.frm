inputs:
	"/":
		tag:  "staid-debian"
		silo:
			- "file+ca://./wares/"
			- "http+ca://repeatr.s3.amazonaws.com/assets/"
action:
  policy: governor ## needed for apt
	command:
		- "/bin/bash"
		- "-c"
		- |
        set -euo pipefail
        apt-get update
        packages=()
        packages+=("diffoscope")
        packages+=("python")
        apt-get install -y "${packages[@]}"

        /usr/bin/apt-zero  # kill apt caches and such
outputs:
	"/":
		tag: "diffoscope-image"
		type: "tar"
		silo: "file+ca://./wares/"
