### to build container: docker build -t myimage --data-root Z:/people/gritti/code/nextflow-basics/docker/python-image .

# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /g/

# copy the dependencies file to the working directory
COPY requirements.txt .
ADD morgana /g/morgana

# install dependencies
RUN apt-get update && apt-get install -y \
    libx11-xcb1 \
    libxcb1 \
    libxcb-glx0 \
    libxcb-keysyms1 \
    libxcb-image0 \
    libxcb-shm0 \
    libxcb-icccm4 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-shape0 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxrender1 \
    libxi6 \
    libxtst6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxss1 \
    libxrandr2 \
    libglib2.0-0 \
    libgl1-mesa-glx \
    libegl1-mesa \
    libdbus-1-3 \
    libfontconfig1 \
    libfreetype6 \
    libxext6 \
    libsm6 \
    libice6
RUN apt-get update && apt-get install -y libgl1
RUN pip install --no-cache-dir -r requirements.txt
RUN cd /g/morgana && \
    pip install -e .
    