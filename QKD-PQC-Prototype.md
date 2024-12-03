# Commands to build BoringSSL for QKD+PQC Prototype

1. Build a docker container in this directory using `docker build -t m-boringssl .`
2. Run the docker container using `docker run it m-boringssl`. This will open up a terminal.
3. Within this terminal run the QKD Module using `python3 QKDFetch.py`, that will fetch the QKD Keys from predefined QKD APIs.
4. Next, open two more terminals within the docker container.
5. On one terminal navigate to `/boringssl/build/tool/` and run `./bssl server -accept 4500 -curves X25519Kyber768Draft00`. This will start the boringssl server.
5. On the other terminal navigate to `/boringssl/build/tool/` and run `./bssl client -connect localhost:4500 -curves X25519Kyber768Draft00`. This will initiate a TLS Handshake with the server that got started.