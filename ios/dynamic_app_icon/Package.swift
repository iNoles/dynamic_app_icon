// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dynamic-app-icon",  // Your plugin name
    platforms: [
        .iOS("12.0"),  // Minimum supported iOS version
    ],
    products: [
        .library(
            name: "dynamic-app-icon",  // Your library name
            targets: ["dynamic-app-icon"]  // The name of your target
        ),
    ],
    dependencies: [],  // You can add any dependencies your plugin needs here
    targets: [
        .target(
            name: "dynamic-app-icon",  // Name of the plugin target
            dependencies: [],
            resources: [
                // Add any resources your plugin might require here (e.g., images, config files)
            ]
        ),
    ]
)
