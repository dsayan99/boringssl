# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install necessary dependencies for BoringSSL and building C++ programs
RUN apt-get update && apt-get install -y \
    cmake \
    ninja-build \
    golang \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /boringssl
RUN mkdir boringssl
WORKDIR /boringssl

# Copy the contents of the current directory to /boringssl in the container
COPY . /boringssl

# Build BoringSSL
RUN cmake -GNinja -B build && \
    ninja -C build

# Compile the server.cpp file
RUN g++ -o server server.cpp -L/boringssl/build/crypto -I/boringssl/include -lcrypto -lpthread

# Expose port 8080
EXPOSE 8080

# Run the compiled server by default
CMD ["bash"]
