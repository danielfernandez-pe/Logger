// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lumberjack",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Lumberjack",
            targets: ["Lumberjack"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Lumberjack",
            dependencies: [],
            path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "LumberjackTests",
            dependencies: ["Lumberjack"]),
    ]
)
