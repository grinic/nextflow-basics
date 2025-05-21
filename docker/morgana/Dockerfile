### to build container: docker build -t myimage --data-root Z:/people/gritti/code/nextflow-basics/docker/python-image .

# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /g/

# copy the dependencies file to the working directory
COPY requirements.txt .
ADD morgana /g/morgana

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN cd /g/morgana && \
    pip install -e .
RUN apt-get update
RUN apt-get update && apt-get install -y \
    python3-pyqt5 \
    qt5dxcb-plugin \
    qt5ct \
    libgl1 \
    libx11-xcb1 \
    libxcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxcb-xinput0 \
    libxcb-randr0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    && apt-get clean