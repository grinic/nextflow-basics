A collection of nextflow scripts using basic python scripts.

**Note:** `params.yaml` contains all params that can be used in the `.nf` file with `params.NAME-OF-PARAM`. Just make sure to run the code with `nextflow run ex0.nf -params_file params.yaml`.

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

# `ex4.nf`

In this case, we activate a conda environment to process the input images with `scikit-image` and `numpy`, and we print out the mean of the image as stdout.

# `ex5.nf`

In this example, we use the output of one process as input of the next one.

Also, we use publishdir to place the ouput of the last process in the projectdir.
