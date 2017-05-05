inputs:
	"/":
		tag:  "diffoscope-image"
		silo:
			- "file+ca://./wares/"
action:
	command:
    - "/usr/bin/diffoscope"
    - "/task/fileA.txt"
    - "/task/fileB.txt"
  escapes:
    mounts:
      "/task": "./demo"
