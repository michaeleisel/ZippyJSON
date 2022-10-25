// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ZippyJSON",
    platforms: [
        .iOS(.v11),
        .tvOS(.v10),
        .macOS(.v10_12),
    ],
    products: [
        .library(
            name: "ZippyJSON",
            targets: ["ZippyJSON"]),
    ],
    dependencies: [
        .package(url: "https://github.com/michaeleisel/JJLISO8601DateFormatter", .upToNextMajor(from: "0.1.5")),
        .package(url: "https://github.com/michaeleisel/ZippyJSONCFamily", .exact("1.2.5")),
    ],
    targets: [
        .target(
            name: "ZippyJSON",
            dependencies: ["ZippyJSONCFamily", "JJLISO8601DateFormatter"]),
    ]
)
