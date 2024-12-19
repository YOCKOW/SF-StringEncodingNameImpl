# String Encoding Names

* Proposal: Not assigned yet <!-- [FOU-NNNN](NNNN-filename.md) -->
* Author(s): [YOCKOW](https://GitHub.com/YOCKOW)
* Review Manager: TBD
* Status: Pitch <!-- **Awaiting implementation** or **Awaiting review** -->
<!-- * Bug: *if applicable* [apple/swift#NNNN](https://github.com/apple/swift-foundation/issues/NNNNN) -->
* Implementation: [StringEncodingNameImpl/StringEncodingName.swift](https://github.com/YOCKOW/SF-StringEncodingNameImpl/blob/main/Sources/StringEncodingNameImpl/StringEncodingName.swift)
<!-- * Previous Proposal: *if applicable* [FOU-XXXX](XXXX-filename.md) -->
<!-- * Previous Revision: *if applicable* [1](https://github.com/apple/swift-evolution/blob/...commit-ID.../proposals/NNNN-filename.md) -->
* Review: ([Pitch](https://forums.swift.org/t/pitch-foundation-string-encoding-names/74623))


## Introduction

This proposal lets `String.Encoding` be converted to/from _various_ names.

For example:

```swift
// Based on IANA registry
print(String.Encoding.utf8.charsetName!) // Prints "UTF-8"
print(String.Encoding(charsetName: "ISO_646.irv:1991") == .ascii) // Prints "true"

// Based on WHATWG Living Standard
print(String.Encoding.macOSRoman.standardName!) // Prints "macintosh"
print(String.Encoding(standardName: "us-ascii") == .windowsCP1252) // Prints "true"
```


## Motivation

The names for string encodings are commonly used certainly in computer networking and in other areas.
You will often find them, for instance, in HTTP headers such as `Content-Type: text/plain; charset=UTF-8` ("UTF-8" is the one). You will also find them in XML documents such as `<?xml version="1.0" encoding="Shift_JIS" ?>` ("Shift_JIS" is the one).

As a natural consequence, it is necessary to parse and to generate such names.


### Current solution

Swift is missing such APIs, therefore we have to use functions defined in `CoreFoundation` (hereinafter called "CF") described as below.

```swift
extension String.Encoding {
  var nameInLegacyWay: String? {
    // 1. Convert `String.Encoding` value to the `CFStringEncoding` value.
    //    NOTE: The raw value of `String.Encoding` is the same with the value of `NSStringEncoding`,
    //          while it is not equal to the value of `CFStringEncoding`.
    let cfStrEncValue: CFStringEncoding = CFStringConvertNSStringEncodingToEncoding(self.rawValue)

    // 2. Convert it to the name where its type is `CFString?`
    let cfStrEncName: CFString? = CFStringConvertEncodingToIANACharSetName(cfStrEncValue)

    // 3. Convert `CFString` to Swift's `String`.
    //    NOTE: Unfortunately they can not be implicitly casted on Linux.
    let charsetName: String? = cfStrEncName.flatMap {
      let bufferSize = CFStringGetMaximumSizeForEncoding(
        CFStringGetLength($0),
        kCFStringEncodingASCII
      ) + 1
      let buffer = UnsafeMutablePointer<CChar>.allocate(capacity: bufferSize)
      defer {
        buffer.deallocate()
      }
      guard CFStringGetCString($0, buffer, bufferSize, kCFStringEncodingASCII) else {
        return nil
      }
      return String(utf8String: buffer)
    }
    return charsetName
  }

  init?(fromNameInLegacyWay charsetName: String) {
    // 1. Convert `String` to `CFString`
    let cfStrEncName: CFString = charsetName.withCString { (cString: UnsafePointer<CChar>) -> CFString in
      return CFStringCreateWithCString(nil, cString, kCFStringEncodingASCII)
    }

    // 2. Convert it to `CFStringEncoding`
    let cfStrEncValue: CFStringEncoding = CFStringConvertIANACharSetNameToEncoding(cfStrEncName)

    // 3. Check whether or not it's valid
    guard cfStrEncValue != kCFStringEncodingInvalidId else {
      return nil
    }

    // 4. Convert `CFStringEncoding` value to `String.Encoding` value
    self.init(rawValue: CFStringConvertEncodingToNSStringEncoding(cfStrEncValue))
  }
}
```


### What's the problem of the current solution?

- It is complicated to use multiple CF-functions to get a simple value. That's not *Swifty*.
- CF-functions are legacy APIs that don't sometimes fit with the times.
- CF APIs are officially unavailable from Swift on non-Darwin platforms.


## Proposed solution

Solution is simple.
We introduce computed properties that return the name, and initializers that create an instance from the name as below.

```swift
extension String.Encoding {
  /// Returns the name of the IANA registry "charset" that is the closest mapping to this string
  /// encoding.
  public var charsetName: String? { get }

  /// Creates an instance from the name of the IANA registry "charset".
  public init?(charsetName: String)

  /// Returns the name of the WHATWG encoding that is the closest mapping to this string encoding.
  public var standardName: String? { get }

  /// Creates an instance from the name of the WHATWG encoding.
  public init?(standardName: String)
}
```

## Detailed design

This proposal refers to "[Character Sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml)" published by IANA and to "[The Encoding Standard](https://encoding.spec.whatwg.org/)" published by WHATWG. While the latter may claim the former could be replaced with it, it entirely focuses on Web browsers (and their JavaScript APIs).

As shown by the graph of `String.Encoding`-Name conversions below, they are incompatible and it is difficult to compromise. Although you may want to ask which is better, the answer is that it depends on your purpose[^your-purpose]. Since Swift APIs should be a little more universal, here we consult both.

[^your-purpose]: You may just want to parse an old XML document on local.

![Graph of Encodings ↔︎ Names](./NNNN-String-Encoding-Names_Mapping.svg) [^utf-16-foundation]

[^utf-16-foundation]: Foundation assumes UTF-16 without BOM is big endian when decoding.


### `String.Encoding` to Name

- Upper-case letters may be used unlike CF.
  * `charsetName` returns *Preferred MIME Name* or *Name* of the encoding defined in "IANA Character Sets".
  * `standardName` returns *Name* of the encoding defined by "The Encoding Standard".
- `String.Encoding.shiftJIS.charsetName[standardName]` returns "Shift_JIS" since "CP932" is no longer available for a name of any encodings.


### Name to `String.Encoding`

- `init(charsetName:)` adopts "Charset Alias Matching" defined in [UTX#22](https://www.unicode.org/reports/tr22/tr22-8.html#Charset_Alias_Matching).
  * i.g., "u.t.f-008" is recognized as "UTF-8".
- `init(charsetName:)` behaves consistently about ISO-8859-*.
  + For example, CF has inconsistency between "ISO-8859-1-Windows-3.1-Latin-1" and "csWindows31Latin1".
- `init(standardName:)` adopts case-insensitive comparison described in [§4.2. Names and labels](https://encoding.spec.whatwg.org/#names-and-labels) of The Encoding Standard.




## Source compatibility

These changes proposed here are only additive. However, care must be taken if migrating from CF APIs.


## Implications on adoption

This feature can be freely adopted and un-adopted in source code with no deployment constraints and without affecting source compatibility.


## Future directions

`String.init(data:encoding:)` and `String.data(using:)` will be implemented more appropriately[^string-data-regression].

[^string-data-regression]: https://github.com/swiftlang/swift-foundation/issues/1015


## Alternatives considered

### Expose APIs only for the IANA Character Sets

Modern Web browsers have unfortunately deviated from the IANA's charset list. That means that it is better to adhere to the WHATWG Encoding Standard if you handle mainly web contents. We may often require some APIs for it.


### Expose APIs only for the WHATWG Encoding Standard

As mentioned above, the WHATWG Encoding Standard focuses on latest Web browsers. Therefore some problems occur in some cases.

Imagine handling an XML 1.1 file which declares that its encoding is "ISO-8859-1": `<?xml version="1.1" encoding="ISO-8859-1"?>`.   What if that file contains a byte `0x85`? `0x85` is recognized as `U+0085`(`NEL`) in ISO-8859-1 which is a valid end-of-line character in XML 1.1[^U+0085-in-xml].

[^U+0085-in-xml]: https://www.w3.org/TR/xml11/#sec-line-ends

On the other hand, the WHATWG Encoding Standard argues that "ISO-8859-1" label must be resolved as "windows-1252". A byte `0x85` is decoded to `U+2026`(`Horizontal Ellipsis`) in windows-1252 and that may cause fatal error to parse the XML file.

We have to consult the IANA registry in that case.


### Consolidate them

We might be able to consolidate them in one kind of API like this:

```swift
extension String.Encoding {
  public var name: String? { get }
  public init?(name: String)
}
```

However, that will be too arbitrary to implement such API and too hard to maintain consistent behavior.


### Follow `Locale` as the precedent

`Locale` has an enum named [`IdentifierType`](https://developer.apple.com/documentation/foundation/locale/identifiertype) to specify which kind of identifier should be used.
We can apply that way to `String.Encoding`:

```swift
extension String.Encoding {
  public enum NameType {
    case iana
    case whatwg
  }
  public var name(_ type: NameType) -> String?
  public init?(name: String, _ type: NameType)
}
```


## Acknowledgments

Thanks to everyone who gave me advices on the pitch thread; especially to [@benrimmington](https://github.com/benrimmington) and [@xwu](https://github.com/xwu) who could channel their concerns into this proposal in the very early stage.