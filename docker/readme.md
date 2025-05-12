For a quickstart on how to create a docker container, see:

https://github.com/nextflow-io/crg-course-nov16

# Installation notes

To use a Docker image in Nextflow, the best option is to run with Singularity.

To install Singularity, general instructions can be found [here](https://docs.sylabs.io/guides/4.3/admin-guide/installation.html#install-from-source).

**NOTE:** when compiling Singularity, use the `--without-libsubid` glag, as this is not supported for Ubuntu <=23.10 (see [here](https://github.com/sylabs/singularity/blob/main/INSTALL.md)).
