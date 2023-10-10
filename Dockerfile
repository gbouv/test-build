FROM rust:latest AS builder

RUN apt update && apt upgrade -y 
RUN apt install -y g++-aarch64-linux-gnu libc6-dev-arm64-cross

WORKDIR /app/
COPY ./src/ ./src/
COPY Cargo.toml ./
COPY Cargo.lock ./
RUN rustup target add aarch64-apple-darwin
RUN cargo build --release


FROM alpine

WORKDIR /app/
COPY --from=builder /app/target/release/hello_world ./
CMD ["./hello_world"]
