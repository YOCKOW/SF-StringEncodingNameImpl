# What is `SF-StringEncodingNameImpl` repository?

This repository contains some documentations and implementations for [Pitch(Foundation): String Encoding Names](https://forums.swift.org/t/pitch-foundation-string-encoding-names/74623).


This repository is also a Swift package[^dependencies], accordingly you can try it out easily:

```swift
// Package.swift
let package = Package(
  ...
  dependencies: [
    .package(url: "https://github.com/YOCKOW/SF-StringEncodingNameImpl.git", from: "0.4.0"),
  ],
  ...
)
```

```swift
// YourProjectSource.swift
import StringEncodingNameImpl

// Based on IANA registry
print(String.Encoding.utf8.ianaName!) // Prints "UTF-8"
print(String.Encoding(ianaName: "ISO_646.irv:1991") == .ascii) // Prints "true"
```

[^dependencies]: This package depends on other packages which are required for the code generator. `StringEncodingNameImpl` itself has no dependencies.
