import Foundation

private extension Unicode.Scalar {
  /// Returns the Boolean value that indicates whether `self` and `other` are equal to each other
  /// case-insensitively.
  ///
  /// - Note: Both `self` and `other` must be ASCII.
  func _isCaseInsensitivelyEqual(to other: Unicode.Scalar) -> Bool {
    assert(self.isASCII && other.isASCII)
    if self == other {
      return true
    } else if ("A"..."Z").contains(self) {
      return self.value + 0x20 == other.value
    } else if ("a"..."z").contains(self) {
      return self.value - 0x20 == other.value
    }
    return false
  }

  var _asciiNumericValue: Int {
    assert(("0"..."9").contains(self))
    return Int(self.value - 0x30)
  }
}

private extension String {
  var _trimmed: Substring {
    guard let firstIndexOfNonWhitespace = firstIndex(where: { !$0.isWhitespace }),
          let lastIndexOfNonWhitespace = lastIndex(where: { !$0.isWhitespace }) else {
      return ""
    }
    return self[firstIndexOfNonWhitespace...lastIndexOfNonWhitespace]
  }
}

/// ICU-independent String Encoding Name Parser.
class StringEncodingNameParser {
  enum Token: Equatable {
    case numeric(Int)
    case caseInsensitiveASCIIAlphabet(Unicode.Scalar)
    case other(Unicode.Scalar)

    static func ==(lhs: Token, rhs: Token) -> Bool {
      switch (lhs, rhs) {
      case (.numeric(let lN), .numeric(let rN)):
        return lN == rN
      case (.caseInsensitiveASCIIAlphabet(let lA), .caseInsensitiveASCIIAlphabet(let rA)):
        return lA._isCaseInsensitivelyEqual(to: rA)
      case (.other(let lO), .other(let rO)):
        return lO == rO
      default:
        return false
      }
    }
  }

  enum Variant: Equatable {
    case ianaCharset
    case whatwgEncoding
  }

  let scalars: Substring.UnicodeScalarView

  var currentIndex: Substring.UnicodeScalarView.Index

  let variant: Variant

  init(_ name: String, variant: Variant) {
    self.scalars = name._trimmed.unicodeScalars
    self.currentIndex = scalars.startIndex
    self.variant = variant
  }

  /// Returns the next token.
  ///
  /// If `variant` is
  ///  - `ianaCharset`: this parser follows ["Charset Alias Matching"](https://www.unicode.org/reports/tr22/tr22-8.html#Charset_Alias_Matching)
  ///                   rule defined in UTS#22.
  ///  - `whatwgEncoding`: this parser uses just ASCII case-insensitive match.
  func nextToken() -> Token? {
    guard currentIndex < scalars.endIndex else {
      return nil
    }

    func __advance() {
      currentIndex = scalars.index(after: currentIndex)
    }

    /// Parse the string as IANA charset.
    func __nextIANACharsetToken() -> Token? {
      func __parseNumeric() -> Int {
        var value: Int = 0
        while currentIndex < scalars.endIndex {
          let currentScalar = scalars[currentIndex]
          guard ("0"..."9").contains(currentScalar) else {
            break
          }
          value = value * 10 + currentScalar._asciiNumericValue
          __advance()
        }
        return value
      }

      let scalar = scalars[currentIndex]
      switch scalar {
      case "0"..."9":
        return .numeric(__parseNumeric())
      case "A"..."Z", "a"..."z":
        __advance()
        return .caseInsensitiveASCIIAlphabet(scalar)
      default:
        __advance()
        if currentIndex < scalars.endIndex {
          return __nextIANACharsetToken()
        }
        return nil
      }
    }

    /// Parse the string as WHATWG Encoding Standard.
    func __nextWHATWGStandardToken() -> Token? {
      let scalar = scalars[currentIndex]
      __advance()
      switch scalar {
      case "0"..."9":
        return .numeric(scalar._asciiNumericValue)
      case "A"..."Z", "a"..."z":
        return .caseInsensitiveASCIIAlphabet(scalar)
      default:
        return .other(scalar)
      }
    }

    switch variant {
    case .ianaCharset:
      return __nextIANACharsetToken()
    case .whatwgEncoding:
      return __nextWHATWGStandardToken()
    }
  }
}

extension String {
  func isEqual(
    to other: String,
    asStringEncodingNameOf variant: StringEncodingNameParser.Variant
  ) -> Bool {
    let myParser = StringEncodingNameParser(self, variant: variant)
    let otherParser = StringEncodingNameParser(other, variant: variant)
    while true {
      let myToken = myParser.nextToken()
      let otherToken = otherParser.nextToken()
      guard myToken == otherToken else {
        return false
      }
      if myToken == nil { // End of the strings.
        return true
      }
    }
  }
}
