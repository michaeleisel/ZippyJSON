// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "ZippyJSON",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "ZippyJSON",
            targets: ["ZippyJSON"]),
    ],
    dependencies: [
        .package(url: "https://github.com/michaeleisel/JJLISO8601DateFormatter", from: "0.1.7"),
        .package(url: "https://github.com/michaeleisel/ZippyJSONCFamily", exact: "1.2.14"),
    ],
    targets: [
        .target(
            name: "ZippyJSON",
            dependencies: ["ZippyJSONCFamily", "JJLISO8601DateFormatter"]),
        .testTarget(
            name: "ZippyJSONTests",
            dependencies: ["ZippyJSON"],
            resources: [
                .copy("Models/apache_builds.json"),
                .copy("Models/canada.json"),
                .copy("Models/entities.json"),
                .copy("Models/github_events.json"),
                .copy("Models/marine_ik.json"),
                .copy("Models/mesh.json"),
                .copy("Models/numbers.json"),
                .copy("Models/random.json"),
                .copy("Models/twitter.json"),
                .copy("Models/twitter2.json"),
                .copy("Models/twitterescaped.json")
            ])
    ]
)
