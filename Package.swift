// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitExtensions",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13),
	],
    products: [
        .library(
            name: "DSUIKitExtensions",
            targets: ["DSUIKitExtensions"]),
    ],
    dependencies: [
		.package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.50.3"),
    ],
    targets: [
        .target(
            name: "DSUIKitExtensions",
            dependencies: []),
        .testTarget(
            name: "DSUIKitExtensionsTests",
            dependencies: ["DSUIKitExtensions"]),
    ]
)
