Demo
---
The first run will be really slow while it downloads and generates the debian image snapshot.

Note: repeatr requires root to fire up containers.
```
./diffoscope.sh
```

Customize
---
Modify `diffoscope.frm`.


```
action:
	command:
    - "/usr/bin/diffoscope"
    - "</first/path/to/diff>"
    - "</second/path/to/diff>"
  escapes:
    mounts:
      "/<first/path/to/diff": "<//path/on/your/filesystem>"
      "/<second/path/to/diff": "</path/on/your/filesystem>"

```

Dependencies
----
- [repeatr](https://github.com/polydawn/repeatr)
- [reppl](https://github.com/polydawn/reppl)

