// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FXImageTextView",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "FXImageTextView", targets: ["FXImageTextView"])
    ],
    targets: [
        .target(
            name: "FXImageTextView",
            path: "Sources/FXImageTextView",
            publicHeadersPath: "."),
    ]
)
