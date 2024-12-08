// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StringEncodingNameImpl",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "StringEncodingNameImpl",
      targets: [
        "StringEncodingNameImpl"
      ]
    ),
  ],
  dependencies: [
    .package(url:"https://github.com/YOCKOW/ySwiftExtensions.git", from: "1.11.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "StringEncodingNameImpl"
    ),
    .testTarget(
      name: "StringEncodingNameImplTests",
      dependencies: [
        "StringEncodingNameImpl"
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)

import Foundation
if ProcessInfo.processInfo.environment["YOCKOW_USE_LOCAL_PACKAGES"] != nil {
  func localPath(with url: String) -> String {
    guard let url = URL(string: url) else { fatalError("Unexpected URL.") }
    let dirName = url.deletingPathExtension().lastPathComponent
    return "../\(dirName)"
  }
  package.dependencies = package.dependencies.map {
    guard case .sourceControl(_, let location, _) = $0.kind else { fatalError("Unexpected dependency.") }
    return .package(path: localPath(with: location))
  }
}
