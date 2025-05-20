### to build container: docker build -t myimage --data-root Z:/people/gritti/code/nextflow-basics/docker/python-image .

# set base image (host OS)
FROM python:3.10-slim

# set the working directory in the container
WORKDIR /g/

ARG ilastik_binary

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir ilastik-release
RUN apt-get update
# RUN apt-get install -y wget bzip2 libglu1-mesa-dev qt5-default libgl1-mesa-glx
RUN wget https://files.ilastik.org/ilastik-1.4.1-Linux.tar.bz2
RUN tar xjvf ilastik-1.*-Linux.tar.bz2 -C ilastik-release
RUN rm ilastik-1.*-Linux.tar.bz2

    