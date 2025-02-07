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


## Revision History

### [Pitch#1](https://gist.github.com/YOCKOW/f5a385e3c9e2d0c97f3340a889f57a16/d76651bf4375164f6a46df792fccd74955a4733a)

- Features
  * Fully compatible with CoreFoundation.
    + Planned to add static properties corresponding to `kCFStringEncoding*`.
  * Spelling of getter/initializer was `ianaCharacterSetName`.
- Pros
  * Easy to migrate from CoreFoundation.
- Cons
  * Propagating undesirable legacy conversions into current Swift Foundation.
  * Including string encodings which might not be supported by Swift Foundation.


### [Pitch#2](https://gist.github.com/YOCKOW/f5a385e3c9e2d0c97f3340a889f57a16/215404d620b41119a8a03ec1a51e725eb09be4b6)

- Features
  * Consulting both [IANA Character Sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml) and [WHATWG Encoding Standard](https://encoding.spec.whatwg.org/).
    + Making a compromise between them.
  * Spelling of getter/initializer was `name`.
- Pros
  * Easy to communicate with API.
- Cons
  * Hard for users to comprehend conversions.
  * Difficult to maintain the API in a consistant way.

### [Pitch#3](https://github.com/YOCKOW/SF-StringEncodingNameImpl/blob/0.1.0/proposal/NNNN-String-Encoding-Names.md), [Pitch#4](https://github.com/YOCKOW/SF-StringEncodingNameImpl/blob/0.2.1/proposal/NNNN-String-Encoding-Names.md)

- Features
  * Consulting both [IANA Character Sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml) and [WHATWG Encoding Standard](https://encoding.spec.whatwg.org/).
  * Separated getters/initializers for them.
    + #3: `charsetName` and `standardName` respectively.
    + #4: `name(.iana)` and `name(.whatwg)` for getters; `init(iana:)` and `init(whatwg:)` for initializers.
- Pros
  * Users can recognize what kind of conversions is used.
- Cons
  * Not reflecting the fact that WHATWG's Encoding Standard doesn't provide only string encoding names but also implementations to encode/decode data.

### Pitch#5

This pitch.



## Introduction

This proposal allows `String.Encoding` to be converted to and from various names.

For example:

```swift
print(String.Encoding.utf8.name!) // Prints "UTF-8"
print(String.Encoding(name: "ISO_646.irv:1991") == .ascii) // Prints "true"
```


## Motivation

String encoding names are widely used in computer networking and other areas. For instance, you often see them in HTTP headers such as `Content-Type: text/plain; charset=UTF-8` or in XML documents with declarations such as `<?xml version="1.0" encoding="Shift_JIS"?>`.

Therefore, it is necessary to parse and generate such names.


### Current solution

Swift lacks the necessary APIs, requiring the use of `CoreFoundation` (hereinafter called "CF") as described below.

```swift
extension String.Encoding {
  var nameInLegacyWay: String? {
    // 1. Convert `String.Encoding` value to the `CFStringEncoding` value.
    //    NOTE: The raw value of `String.Encoding` is the same as the value of `NSStringEncoding`,
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

- It is complicated to use multiple CF functions to get a simple value. That's not *Swifty*.
- CF functions are legacy APIs that do not always meet modern requirements.
- CF APIs are not officially intended to be called directly from Swift on non-Darwin platforms.


## Proposed solution

The solution is straightforward.
We introduce a computed property that returns the name, and the initializer that creates an instance from a name as shown below.

```swift
extension String.Encoding {
  /// The name of this encoding that is compatible with the one of the IANA registry "charset".
  public var name: String?

  /// Creates an instance from the name of the IANA registry "charset".
  public init?(name: String)
}
```

## Detailed design

This proposal refers to "[Character Sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml)" published by IANA because CF APIs do so.
However, as mentioned above, CF APIs are sometimes out of step with the times.
Therefore, we need to adjust it to some extent:

![Graph of Encodings ↔︎ Names](./NNNN-String-Encoding-Names_Mapping.svg)
*The graph of `String.Encoding`-Name conversions*


### `String.Encoding` to Name

- Upper-case letters may be used unlike CF.
  * `var name` returns *Preferred MIME Name* or *Name* of the encoding defined in "IANA Character Sets".


### Name to `String.Encoding`

- `init(name:)` adopts "Charset Alias Matching" defined in [UTX#22](https://www.unicode.org/reports/tr22/tr22-8.html#Charset_Alias_Matching).
  * i.g., "u.t.f-008" is recognized as "UTF-8".
- `init(name:)` behaves consistently about ISO-8859-*.
  * For example, CF inconsistently handles "ISO-8859-1-Windows-3.1-Latin-1" and "csWindows31Latin1".
  * "ISO-8859-1-Windows-3.0-Latin-1" is a subset of "windows-1252", not of "ISO-8859-1".[^win3.0-latin-1]
  * "ISO-8859-1-Windows-3.1-Latin-1" is a subset of "windows-1252", not of "ISO-8859-1".[^win3.1-latin-1]
  * "ISO-8859-2-Windows-Latin-2" is a subset of "windows-1250", not of "ISO-8859-2".[^win-latin-2]
  * "ISO-8859-9-Windows-Latin-5" is a subset of "windows-1254", not of "ISO-8859-9".[^win-latin-5]

[^win3.0-latin-1]: https://www.pclviewer.com/resources/symbolset/pcl_9u.pdf
[^win3.1-latin-1]: https://www.pclviewer.com/resources/symbolset/pcl_19u_V2.pdf
[^win-latin-2]: https://www.pclviewer.com/resources/symbolset/pcl_9e.pdf
[^win-latin-5]: https://www.pclviewer.com/resources/symbolset/pcl_5t.pdf


### Rationales for controversial points

- While "ISO_646.irv:1983"(a.k.a. "Code page 1009") is resolved into `.ascii` by CF, it is, strictly speaking, incompatible with "US-ASCII".
  This proposal decides that `String.Encoding` can't be initialized from "ISO_646.irv:1983".
- "CP51932" was regarded as a variant of "EUC-JP" formulated by Microsoft.
  It was, however, intended to be used mainly by web browsers (i.e. Internet Explorer considering the historical background) on Windows.
  As a result, it is incompatible with the original "EUC-JP" widely used on UNIX.
  Consequently, "CP51932" should not be associated with `.japaneseEUC`.
- "CP932" is no longer available for a name of any encodings. Consequently, `String.Encoding.shiftJIS.name` returns "Shift_JIS".
- "Windows-31J" is a variant of "Shift_JIS" extended by Microsoft.
  For historical reasons, `String.Encoding.shiftJIS` is an encoding equivalent to `kCFStringEncodingDOSJapanese` in CF (not to `kCFStringEncodingShiftJIS`), which means that `.shiftJIS` should be created from the name "Windows-31J" as well.


## Source compatibility

These changes proposed here are only additive. However, care must be taken if migrating from CF APIs.


## Implications on adoption

This feature can be freely adopted and un-adopted in source code with no deployment constraints and without affecting source compatibility.


## Future directions

`String.init(data:encoding:)` and `String.data(using:)` will be implemented more appropriately[^string-data-regression].

[^string-data-regression]: https://github.com/swiftlang/swift-foundation/issues/1015


Hopefully, happening some cascades like below might be expected in the longer term.

- General string decoders/encoders and their protocols (for example, as suggested in "[Unicode Processing APIs](https://forums.swift.org/t/pitch-unicode-processing-apis/69294)") could be implemented.

- Some types which provide their names and decoders/encoders could be implemented for the purpose of tightness between names and implementations.
  * There would be a type for WHATWG Encoding Standard which defines both names and implementations.

<details><summary>They would look like...</summary><div>

```swift
public protocol StrawmanStringEncodingProtocol {
  static func encoding(for name: String) -> Self?
  var name: String? { get }
  var encoder: (any StringToByteStreamEncoder)? { get }
  var decoder: (any ByteStreamToUnicodeScalarsDecoder)? { get }
}

public struct WHATWGEncoding: StrawmanStringEncodingProtocol {
  public static let utf8: WHATWGEncoding = ...
  public static let eucJP: WHATWGEncoding = ...
  :
  :
}
```

</div></details>

- `String.Encoding` might be deprecated as a natural course in the distant future??


## Alternatives considered

### Adopting the WHATWG Encoding Standard (as well)

There is another standard for string encodings which is published by WHATWG: "[Encoding Standard](https://encoding.spec.whatwg.org/)".
While it may claim the IANA's Character Sets could be replaced with it, it entirely focuses on Web browsers and their JavaScript APIs.
Furthermore it binds tightly names with implementations.
Since `String.Encoding` is just a `RawRepresentable` type where its `RawValue` is `UInt`, it is more universal but is more loosely bound to implementations.
As a result, WHATWG Encoding Standard doesn't easily align with `String.Encoding`. So it is just mentioned in "Future Directions".


## Acknowledgments

Thanks to everyone who gave me advices on the pitch thread; especially to [@benrimmington](https://github.com/benrimmington) and [@xwu](https://github.com/xwu) who could channel their concerns into this proposal in the very early stage.
