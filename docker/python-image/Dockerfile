### to build container: docker build -t myimage .

# set base image (host OS)
FROM python:3.10.14

# set the working directory in the container
WORKDIR Z:/people/gritti/code/nextflow-basics/exercises/docker/python-image

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt
# RUN pip install "napari[all]"
# RUN pip install napari-ome-zarr

# # copy the content of the local src directory to the working directory
# COPY src/ .
