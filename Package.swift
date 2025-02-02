// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tube Status",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "TubeKit", targets: ["TubeKit"]),
        .library(name: "TubeUI", targets: ["TubeUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danielctull/PublisherView", .branch("main")),
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

        .target(
            name: "TubeUI",
            dependencies: [
                "PublisherView",
                "Resourceful",
                "Tagged",
                "TubeKit",
            ]),
    ]
)
