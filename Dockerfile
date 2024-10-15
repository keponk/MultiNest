# Use Ubuntu as the base image
FROM ubuntu:24.04

# Set the maintainer (optional)
LABEL maintainer="jgil@mpe.mpg.de"

# Install necessary packages for building C++ with CMake
RUN apt-get update && \
    apt-get install -y \
    cmake \
    build-essential \
    gfortran \
    git \
    libopenblas-dev \
    openmpi-bin \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY . /app

# RUN wget https://cmake.org/files/v2.8/cmake-2.8.12.2-Linux-i386.sh -O cmake && chmod +x cmake

# Create a build directory and compile the C++ code
RUN mkdir -p build && \
    cd build && \
    cmake .. && \
    make

# At this point, the binary is built and located in /app/build

# Use the output of the build (the binary)
# You can export it later using `docker cp` command after building the container

# Optional: define the entry point for the container (useful for testing the binary inside the container)
# ENTRYPOINT ["/app/build/your_binary_file"]


