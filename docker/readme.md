For a quickstart on how to create a docker container, see:

https://github.com/nextflow-io/crg-course-nov16

Briefly:
- Create a Dockerfile
- Build the image: `docker build -t <my-image> .`
- Login into dockerhub account: `docker login`
- Tag the image: `docker tag my-image <user-name>/<my-image>`
- Push the image to dockerhub: `docker push <user-name>/<my-image>`

To run a bash shell within docker image: `docker run -it <my-image> bash`
To run a software within the container: `docker run <my-image> <software> --version`

# Installation notes

To use a Docker image in Nextflow, the best option is to run with Singularity.

To install Singularity, general instructions can be found [here](https://docs.sylabs.io/guides/4.3/admin-guide/installation.html#install-from-source).

**NOTE:** when compiling Singularity, use the `--without-libsubid` glag, as this is not supported for Ubuntu <=23.10 (see [here](https://github.com/sylabs/singularity/blob/main/INSTALL.md)).
