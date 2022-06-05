# gRPC example with Rust and Swift

A simple example using gRPC between Rust and Swift.

## Setup

`brew install swift-protobuf grpc-swift`

`cd rust && cargo build`

`cd swift && swift build`

## Usage

While there is more than just this, this is the key example.

1. Start the gRPC server: `cd rust && cargo run --bin helloworld-server`
2. Send a message from the Swift client: `cd swift && swift run Client <name>`
