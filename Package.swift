// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccessibilitySnapshot",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Core + SnapshotTesting for image comparison
        .library(
            name: "AccessibilitySnapshot",
            targets: ["AccessibilitySnapshot"]
        ),

        .library(
            name: "AccessibilitySnapshotCore",
            targets: ["AccessibilitySnapshotCore"]
        ),
    ],
    dependencies: [
        .package(
            name: "SnapshotTesting",
            url: "https://github.com/pimms/swift-snapshot-testing.git",
            .revision("0efeef44df913fe60ea868f037f271ac927a8e8c")
        )
    ],
    targets: [
        .target(
            name: "AccessibilitySnapshotCore-ObjC",
            path: "Sources/AccessibilitySnapshot/Core/ObjC"
        ),
        .target(
            name: "AccessibilitySnapshotCore",
            dependencies: ["AccessibilitySnapshotCore-ObjC"],
            path: "Sources/AccessibilitySnapshot/Core/Swift"
        ),
        .target(
            name: "AccessibilitySnapshot",
            dependencies: ["AccessibilitySnapshotCore", "SnapshotTesting"],
            path: "Sources/AccessibilitySnapshot/SnapshotTesting"
        )
    ]
)
