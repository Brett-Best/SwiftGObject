// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "GLibObject",
    products: [
        .library(name: "GLibObject", targets: ["GLibObject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Brett-Best/SwiftGLib.git", .branch("bb-pkg-dev"))
    ],
    targets: [
        .target(name: "GLibObject", dependencies: ["GLib"]),
        .testTarget(name: "GLibObjectTests", dependencies: ["GLibObject"]),
    ]
)
