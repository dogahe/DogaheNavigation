// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "GoogleNavigation",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GoogleNavigation",
      targets: ["GoogleNavigationTarget"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/dogahe/DogaheMaps", revision: "1.0.13"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .binaryTarget(name: "GoogleNavigation", url: "https://github.com/dogahe/DogaheNavigation/releases/download/1.0.1/GoogleNavigation_3p.xcframework.zip", checksum: "724948ab2e1f78c9e71b102350da689d6dc600d9af400e0a5c4b31d6f961a4a5"),
    .target(
      name: "GoogleNavigationTarget",
      dependencies: ["GoogleNavigation"],
      path: "GoogleNavigation",
      sources: ["dummy.m"],
      resources: [
        .copy("Resources/GoogleNavigation.bundle")
      ],
      publicHeadersPath: "Sources"
    ),
  ]
)
