# Exercises

A collection of example nextflow scripts arranged by topic (more or less).

`test_data` contains some tif and txt files to play around with.

1. **NOTE:** if using VSCode on Windows, remember to change the file encoding to LF so that the shebang `#!/usr/bin/env python` is properly recognized (that is, no line ending character added). See [here](https://stackoverflow.com/questions/66038334/how-to-disable-m-line-endings-in-vs-code) for instructions.

1. **NOTE:** remember to do `git update-index --chmod=+x exercises/scripts/ex0_python_script/bin/*.py` to change file permission to +x in github repo. Then commit with `git commit -m "changed permission to all .py in python ex"` and push to origin. This way, next time the repo is pulled in the `/home` dorectory of the ba-training, the file permissions will be sent over.
