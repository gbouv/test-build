# test-build

To build and exec manually:

```bash
cargo build --release
./target/release/hello_world
```

To build on Docker, extract binary and exec:

```bash
docker build -t gbouv/test-build:latest .
docker cp $(docker container create gbouv/test-build:latest):/app/hello_world ./
./hello_world
```
