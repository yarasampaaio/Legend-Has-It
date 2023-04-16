// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "WWDC2023",
    platforms: [
        .iOS("16")
    ],
    products: [
        .iOSApplication(
            name: "WWDC2023",
            targets: ["AppModule"],
            bundleIdentifier: "CBL.WWDC2023",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bicycle),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)