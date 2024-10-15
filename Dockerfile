# Use Ubuntu as the base image
FROM debian:12-slim

# Set the maintainer (optional)
LABEL maintainer="jgil@mpe.mpg.de"

# Install necessary packages for building C++ with CMake
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cmake \
    build-essential \
    gfortran \
    git \
    libopenblas-dev \
    libopenmpi-dev \
    openmpi-bin 

# https://github.com/keponk/MultiNest.git
# Set the working directory in the container
WORKDIR /workspace

# Copy the source code into the container
COPY . /workspace

# RUN wget https://cmake.org/files/v2.8/cmake-2.8.12.2-Linux-i386.sh -O cmake && chmod +x cmake

# Create a build directory and compile the C++ code
RUN ls -l && mkdir -p build && \
    cd /workspace/build && \
    # cmake  -DCMAKE_INSTALL_PREFIX=./ .. && \
    cmake .. && \
    make && \
    make install


# At this point, the binary is built and located in /app/build

# Use the output of the build (the binary)
# You can export it later using `docker cp` command after building the container

# Optional: define the entry point for the container (useful for testing the binary inside the container)
# ENTRYPOINT ["/app/build/your_binary_file"]


