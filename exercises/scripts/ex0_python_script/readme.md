A collection of nextflow scripts using basic python scripts

# `ex0.nf`

Collects the files in a filder, and uses the `print` function in a python script as stdout output (always `Ciao`).

Learn how to use a python script in the nextflow `script`.

# `ex1.nf`

Collects the files in a filder, and uses the `open` function in a python script as path output. That is, creates a txt file always called `output.txt`.

Note: Observe where are the output files stored: in the corresponding work directory!

# `ex2.nf`

Collects file names from folder and uses the Channel as input of the python script, which then creates a txt file with the same name as input.

# `ex3.nf`

Same as `ex2`, except this time the input is a FilePairs. The python script creates 2 txt files.

Note: Observe the difference between the output of `ex2` (a simple Channel) and `ex3` (a Channel of pairs).
