// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tube Status",
    products: [
        .library(
            name: "TubeKit",
            targets: ["TubeKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TubeKit"),
        .testTarget(
            name: "TubeKitTests",
            dependencies: ["TubeKit"]),
    ]
)
