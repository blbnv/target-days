// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    products: [
        .library(name: "DateUtilities", targets: ["DateUtilities"]),
        .library(name: "Storage", targets: ["Storage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "DateUtilities", dependencies: []),
        .target(name: "Storage", dependencies: []),
    ]
)
