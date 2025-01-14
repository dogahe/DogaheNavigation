// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "GoogleNavigation", platforms: [.iOS(.v15)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GoogleNavigation",
      targets: ["GoogleNavigationTarget"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "9.2.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .binaryTarget(
      name: "GoogleNavigation",
      url: "https://dl.google.com/geosdk/swiftpm/9.2.0/GoogleNavigation_3p.xcframework.zip",
      checksum: "e3bbaeefa48e32181819519ffac7f763cca4cb532ffa4e5f259b79dc56feee46"
    ),
    .target(
      name: "GoogleNavigationTarget",
      dependencies: [
        "GoogleNavigation",
        .product(name: "GoogleMaps", package: "ios-maps-sdk"),
      ],
      path: "GoogleNavigation",
      sources: ["GMSEmpty.m"],
      resources: [
        .copy("Resources/GoogleNavigationResources/GoogleNavigation.bundle")
      ],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("xml2"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CarPlay"),
        .linkedFramework("MapKit"),
        .linkedFramework("Metal"),
        .linkedFramework("WebKit"),
        .linkedFramework("UserNotifications"),
      ]
    ),
  ]
)
