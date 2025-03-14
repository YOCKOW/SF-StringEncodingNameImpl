import Foundation

private extension Unicode.Scalar {
  var _isASCIINumeric: Bool {
    return ("0"..."9").contains(self)
  }

  var _asciiNumericValue: Int {
    assert(_isASCIINumeric)
    return Int(self.value - 0x30)
  }

  /// Returns the Boolean value that indicates whether or not `self` is "ASCII whitespace".
  ///
  /// Reference: https://infra.spec.whatwg.org/#ascii-whitespace
  var _isASCIIWhitespace: Bool {
    switch self.value {
    case 0x09, 0x0A, 0x0C, 0x0D, 0x20: true
    default: false
    }
  }
}

private extension String {
  var _trimmed: Substring.UnicodeScalarView {
    let scalars = self.unicodeScalars
    let isNonWhitespace: (Unicode.Scalar) -> Bool = { !$0._isASCIIWhitespace }
    guard let firstIndexOfNonWhitespace = scalars.firstIndex(where: isNonWhitespace),
          let lastIndexOfNonWhitespace = scalars.lastIndex(where: isNonWhitespace) else {
      return Substring.UnicodeScalarView()
    }
    return scalars[firstIndexOfNonWhitespace...lastIndexOfNonWhitespace]
  }
}


/// A type that holds a `Unicode.Scalar` where its value is compared case-insensitively with others'
/// _if the value is within ASCII range_.
package struct ASCIICaseInsensitiveUnicodeScalar: Equatable, ExpressibleByUnicodeScalarLiteral {
  package typealias UnicodeScalarLiteralType = Unicode.Scalar.UnicodeScalarLiteralType

  let scalar: Unicode.Scalar

  @inlinable
  init(_ scalar: Unicode.Scalar) {
    assert(scalar.isASCII)
    self.scalar = scalar
  }

  package init(unicodeScalarLiteral value: Unicode.Scalar.UnicodeScalarLiteralType) {
    self.init(Unicode.Scalar(unicodeScalarLiteral: value))
  }

  @inlinable
  package static func ==(
    lhs: ASCIICaseInsensitiveUnicodeScalar,
    rhs: ASCIICaseInsensitiveUnicodeScalar
  ) -> Bool {
    if lhs.scalar == rhs.scalar {
      return true
    } else if ("A"..."Z").contains(lhs.scalar) {
      return lhs.scalar.value + 0x20 == rhs.scalar.value
    } else if ("a"..."z").contains(lhs.scalar) {
      return lhs.scalar.value - 0x20 == rhs.scalar.value
    }
    return false
  }
}

package protocol StringEncodingNameTokenizer: ~Copyable {
  associatedtype Token: Equatable
  init(name: String)
  mutating func nextToken() throws -> Token?
}

extension StringEncodingNameTokenizer {
  mutating func hasEqualTokens(with other: consuming Self) throws -> Bool {
    while let myToken = try self.nextToken() {
      guard let otherToken = try other.nextToken(),
            myToken == otherToken else {
        return false
      }
    }
    return try other.nextToken() == nil
  }
}

/// ICU-independent parser that follows [Charset Alias Matching](https://www.unicode.org/reports/tr22/tr22-8.html#Charset_Alias_Matching).
package struct UTS22Tokenizer: StringEncodingNameTokenizer {
  package enum Token: Equatable {
    case numeric(Int)
    case alphabet(ASCIICaseInsensitiveUnicodeScalar)
  }

  enum Error: Swift.Error {
    case tooLargeNumericValue
  }

  let scalars: String.UnicodeScalarView

  private var _currentIndex: String.UnicodeScalarView.Index

  package init(name: String) {
    self.scalars = name.unicodeScalars
    self._currentIndex = scalars.startIndex
  }

  package mutating func nextToken() throws -> Token? {
    guard _currentIndex < scalars.endIndex else {
      return nil
    }

    let scalar = scalars[_currentIndex]
    switch scalar {
    case "0"..."9":
      // Parse a numeric value ignoring leading zeros.
      //
      // NOTE: To prevent the value from overflow, a threhold is set here.
      //       The max number of digits to be expected is 8 as of now: i.g. `csISO42JISC62261978`.
      //       It wouldn't matter to throw an error in practice when the value is too large.

      let threshold: Int = 999_999_999
      var value = scalar._asciiNumericValue
      scalars.formIndex(after: &_currentIndex)
      while _currentIndex < scalars.endIndex {
        let currentScalar = scalars[_currentIndex]
        guard currentScalar._isASCIINumeric else {
          break
        }
        value = value * 10 + currentScalar._asciiNumericValue
        if value > threshold {
          throw Error.tooLargeNumericValue
        }
        scalars.formIndex(after: &_currentIndex)
      }
      return .numeric(value)
    case "A"..."Z", "a"..."z":
      scalars.formIndex(after: &_currentIndex)
      return .alphabet(ASCIICaseInsensitiveUnicodeScalar(scalar))
    default:
      scalars.formIndex(after: &_currentIndex)
      if _currentIndex < scalars.endIndex {
        return try nextToken()
      }
      return nil
    }
  }
}


/// A parser that tokenizes a string into `ASCIICaseInsensitiveUnicodeScalar`s.
package struct ASCIICaseInsensitiveTokenizer: StringEncodingNameTokenizer {
  package typealias Token = ASCIICaseInsensitiveUnicodeScalar

  enum Error: Swift.Error {
    case nonASCII
  }

  let scalars: Substring.UnicodeScalarView

  private var _currentIndex: Substring.UnicodeScalarView.Index

  package init(name: String) {
    self.scalars = name._trimmed
    self._currentIndex = scalars.startIndex
  }

  package mutating func nextToken() throws -> Token? {
    guard _currentIndex < scalars.endIndex else {
      return nil
    }
    let scalar = scalars[_currentIndex]
    guard scalar.isASCII else { throw Error.nonASCII }
    defer {
      scalars.formIndex(after: &_currentIndex)
    }
    return  ASCIICaseInsensitiveUnicodeScalar(scalar)
  }
}


extension String {
  func isEqual<T>(
    to other: String,
    tokenizedBy tokenizer: T.Type
  ) -> Bool where T: StringEncodingNameTokenizer {
    do {
      var myTokenizer = T(name: self)
      let otherTokenizer = T(name: other)
      return try myTokenizer.hasEqualTokens(with: otherTokenizer)
    } catch {
      // Any errors imply that `self` or `other` contains invalid characters.
      return false
    }
  }
}
