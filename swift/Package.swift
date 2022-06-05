// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "grpc-example-rust-swift",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.11.0"),

    ],
    targets: [
        .target(name: "Model", dependencies: [
            .product(name: "GRPC", package: "grpc-swift"),
        ],
        exclude: [
            "helloworld.proto",
        ]),
        .executableTarget(
            name: "Client",
            dependencies: [
                "Model",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "GRPC", package: "grpc-swift"),
            ]
        ),
    ]
)
