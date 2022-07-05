// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestAppIOSDK",
    platforms: [.iOS("11.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "TestAppIOSDK", type: .dynamic, targets: ["TestAppIOSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "20.0.0"),
        .package(url: "https://github.com/tus/TUSKit.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "TestAppIOSDKWrapper",
                dependencies: [
                    .target(name: "TestAppIOSDK"),
                    .product(name: "TinyConstraints", package: "TinyConstraints"),
                    .product(name: "KeychainSwift", package: "keychain-swift"),
                    .product(name: "TUSKit", package: "TUSKit")
                ]
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "TestAppIOSDK", path: "TestAppIOSDK.xcframework"),
//        .binaryTarget(
//            name: "TestAppIOSDK",
//            url: "https://drive.google.com/file/d/172Cpg_GJzC_MdFVJ_84hKoiKEmZWaMjK/view?usp=sharing",
//            checksum: "f34d9d60f9ddb20e452300433307df7360b1c0d782a48160abf0341f72ac3956"
//        ),
    ]
)
