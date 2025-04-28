A collection of nextflow scripts using basic python scripts.

**Note:** `params.yaml` contains all params that can be used in the `.nf` file with `params.NAME-OF-PARAM`. Just make sure to run the code with `nextflow run ex0.nf -params_file params.yaml -with-docker`.

# `ex0.nf`

In this example, we try using an image from docker to run the process using `scikit-image` and `numpy`.
We print out the mean of the image as stdout.

