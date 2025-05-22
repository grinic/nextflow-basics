For a quickstart on how to create a docker container, see:

https://github.com/nextflow-io/crg-course-nov16

Briefly:
- Install Docker Desktop
- Create a Dockerfile
- Build the image: `docker build -t <my-image> .`
- Login into dockerhub account: `docker login`
- Tag the image: `docker tag my-image <user-name>/<my-image>`
- Push the image to dockerhub: `docker push <user-name>/<my-image>`

To run a bash shell within docker image: `docker run -it <my-image> bash`

To run a software within the container: `docker run <my-image> <software> --version`

# Run Docker with GUI app

### Linux

GUI apps are easier to run in Docker containers on Linux because:

- X11 is the standard windowing system for GUI on Linux.

- Docker containers can reuse the host’s X11 server with a simple -v /tmp/.X11-unix:/tmp/.X11-unix volume mount.

- No extra software or configuration is needed on the host — it's just Unix socket sharing + DISPLAY env var.

1. **Prerequisites**

You must have X11 installed (standard on most Linux desktops).

Allow X11 connections from Docker:

```
xhost +local:docker
```

2. **Run the Docker container**

Assuming the container runs a GUI app (e.g., PyQt5), start it like this:

```
docker run -it \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "<LOCAL_PATH_OF_INTEREST>:/g/documents" \
  your-image-name
```

Where `<LOCAL_PATH_OF_INTEREST>` is the path to documents/images on the local drive or the server (e.g. in **MOrgAna**).

`DISPLAY=$DISPLAY` forwards GUI to your local X session.

The volume mount shares the X socket.

3. **Security tip: Afterward, revoke access with:**

```
xhost -local:docker
```

### Windows (Docker Desktop + X server)

Docker Desktop runs containers in a Linux virtual machine, and GUI apps inside the container use X11 (a Linux windowing system) to display windows. But:

- Windows does not support X11 natively.

- There’s no built-in X server in Windows CMD or PowerShell.

- Docker Desktop doesn’t emulate a GUI layer for containers.

Therefore, to run Linux GUI apps in Windows via Docker Desktop, you need to siulate an X server using external software such as **VcXsrv**.


1. **Install an X Server on Windows**

You need VcXsrv (free) or X410 (paid) to receive the GUI output.

Option A: VcXsrv (recommended)
Install from: https://sourceforge.net/projects/vcxsrv/

Launch `XLaunch` with:

- Multiple windows

- Start no client

- Disable access control (or configure IP access manually)

2. **Run the Docker Container with DISPLAY Set**

```
docker run -it \
  --rm \
  -e DISPLAY=host.docker.internal:0 \
  -v "<LOCAL_PATH_OF_INTEREST>:/g/documents"
  your-image-name
```

Where `<LOCAL_PATH_OF_INTEREST>` is the path to documents/images on the local drive or the server (e.g. in **MOrgAna**).

# Installation notes

To use a Docker image in Nextflow, the best option is to run with Singularity.

To install Singularity, general instructions can be found [here](https://docs.sylabs.io/guides/4.3/admin-guide/installation.html#install-from-source).

**NOTE:** when compiling Singularity, use the `--without-libsubid` glag, as this is not supported for Ubuntu <=23.10 (see [here](https://github.com/sylabs/singularity/blob/main/INSTALL.md)).
