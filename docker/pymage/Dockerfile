### to build container: docker build -t myimage --data-root Z:/people/gritti/code/nextflow-basics/docker/python-image .

# set base image (host OS)
FROM python:3.10-slim

# set the working directory in the container
WORKDIR /g/mif/people/gritti/code/nextflow-basics

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt
# RUN apt-get install libgl1-mesa-glx
# RUN pip install "napari[all]"
# RUN pip install napari-ome-zarr==0.6.1
# RUN pip install napari-animation

# # copy the content of the local src directory to the working directory
# COPY 
