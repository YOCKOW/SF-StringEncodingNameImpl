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

protocol StringEncodingNameTokenizer {
  associatedtype Token: Equatable

  /// Returns the next token advancing the index.
  func nextToken(
    of scalars: Substring.UnicodeScalarView,
    fromIndex index: inout Substring.UnicodeScalarView.Index
  ) -> Token?
}

struct IANACharsetNameTokenizer: StringEncodingNameTokenizer {
  enum Token: Equatable {
    case numeric(Int)
    case alphabet(Unicode.Scalar)

    static func ==(lhs: Token, rhs: Token) -> Bool {
      switch (lhs, rhs) {
      case (.numeric(let lN), .numeric(let rN)):
        return lN == rN
      case (.alphabet(let lA), .alphabet(let rA)):
        return lA._isCaseInsensitivelyEqual(to: rA)
      default:
        return false
      }
    }
  }

  @inlinable
  func nextToken(
    of scalars: Substring.UnicodeScalarView,
    fromIndex index: inout Substring.UnicodeScalarView.Index
  ) -> Token? {
    assert(index < scalars.endIndex)

    func __parseNumeric() -> Int {
      var value: Int = 0
      while index < scalars.endIndex {
        let currentScalar = scalars[index]
        guard ("0"..."9").contains(currentScalar) else {
          break
        }
        value = value * 10 + currentScalar._asciiNumericValue
        scalars.formIndex(after: &index)
      }
      return value
    }

    let scalar = scalars[index]
    switch scalar {
    case "0"..."9":
      return .numeric(__parseNumeric())
    case "A"..."Z", "a"..."z":
      scalars.formIndex(after: &index)
      return .alphabet(scalar)
    default:
      scalars.formIndex(after: &index)
      if index < scalars.endIndex {
        return nextToken(of: scalars, fromIndex: &index)
      }
      return nil
    }
  }
}

struct WHATWGEncodingNameTokenizer: StringEncodingNameTokenizer {
  enum Token: Equatable {
    case alphabet(Unicode.Scalar)
    case other(Unicode.Scalar)

    static func ==(lhs: Token, rhs: Token) -> Bool {
      switch (lhs, rhs) {
      case (.alphabet(let lA), .alphabet(let rA)):
        return lA._isCaseInsensitivelyEqual(to: rA)
      case (.other(let lO), .other(let rO)):
        return lO == rO
      default:
        return false
      }
    }
  }

  @inlinable
  func nextToken(
    of scalars: Substring.UnicodeScalarView,
    fromIndex index: inout Substring.UnicodeScalarView.Index
  ) -> Token? {
    assert(index < scalars.endIndex)

    defer {
      scalars.formIndex(after: &index)
    }

    let scalar = scalars[index]
    switch scalar {
    case "A"..."Z", "a"..."z":
      return .alphabet(scalar)
    default:
      return .other(scalar)
    }
  }
}



/// ICU-independent String Encoding Name Parser.
class StringEncodingNameParser<Tokenizer> where Tokenizer: StringEncodingNameTokenizer {
  let scalars: Substring.UnicodeScalarView

  private(set) var currentIndex: Substring.UnicodeScalarView.Index

  let tokenizer: Tokenizer

  init(name: String, tokenizer: Tokenizer) {
    self.scalars = name._trimmed.unicodeScalars
    self.currentIndex = scalars.startIndex
    self.tokenizer = tokenizer
  }

  @inlinable
  func nextToken() -> Tokenizer.Token? {
    guard currentIndex < scalars.endIndex else {
      return nil
    }
    return tokenizer.nextToken(of: scalars, fromIndex: &currentIndex)
  }
}

extension String {
  func isEqual(
    to other: String,
    asStringEncodingNameOf type: String.Encoding.NameType
  ) -> Bool {
    func __equalTokens<T>(
      _ leftParser: StringEncodingNameParser<T>,
      _ rightParser: StringEncodingNameParser<T>
    ) -> Bool where T: StringEncodingNameTokenizer {
      while true {
        let leftToken = leftParser.nextToken()
        let rightToken = rightParser.nextToken()
        guard leftToken == rightToken else {
          return false
        }
        if leftToken == nil { // End of the strings.
          assert(rightToken == nil)
          return true
        }
      }
    }

    switch type {
    case .iana:
      let tokenizer = IANACharsetNameTokenizer()
      return __equalTokens(
        StringEncodingNameParser(name: self, tokenizer: tokenizer),
        StringEncodingNameParser(name: other, tokenizer: tokenizer)
      )
    case .whatwg:
      let tokenizer = WHATWGEncodingNameTokenizer()
      return __equalTokens(
        StringEncodingNameParser(name: self, tokenizer: tokenizer),
        StringEncodingNameParser(name: other, tokenizer: tokenizer)
      )
    }
  }
}
