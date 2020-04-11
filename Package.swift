// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ZippyJSON",
    platforms: [
        .iOS(.v11),
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "ZippyJSON",
            targets: ["ZippyJSON"]),
    ],
    dependencies: [
        .package(url: "https://github.com/michaeleisel/JJLISO8601DateFormatter", .upToNextMajor(from: "0.1.2")),
        .package(url: "https://github.com/michaeleisel/ZippyJSONCFamily", .exact("1.1.1")),
    ],
    targets: [
        .target(
            name: "ZippyJSON",
            dependencies: ["ZippyJSONCFamily", "JJLISO8601DateFormatter"]),
    ]
)
