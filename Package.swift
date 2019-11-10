// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ZippyJSON",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "ZippyJSON",
            targets: ["ZippyJSON"]),
    ],
    dependencies: [
        .package(url: "https://github.com/michaeleisel/JJLISO8601DateFormatter", .upToNextMajor(from: "0.1.2")),
        .package(url: "https://github.com/michaeleisel/ZippyJSONCFamily", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "ZippyJSON",
            dependencies: ["ZippyJSONCFamily", "JJLISO8601DateFormatter"]),
        .testTarget(
            name: "ZippyJSONTests",
            path: "Tests",
            dependencies: ["ZippyJSON"]),
    ]
)
