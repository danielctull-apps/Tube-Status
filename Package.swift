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
        .package(url: "https://github.com/danielctull/Resourceful", from: "1.0.0"),
        .package(name: "Tagged", url: "https://github.com/pointfreeco/swift-tagged", from: "0.5.0"),
    ],
    targets: [

        .target(
            name: "TubeKit",
            dependencies: [
                "Resourceful",
                "Tagged",
            ]),

        .testTarget(
            name: "TubeKitTests",
            dependencies: [
                "Resourceful",
                "TubeKit",
            ],
            resources: [
                .copy("Responses"),
            ]),
    ]
)
