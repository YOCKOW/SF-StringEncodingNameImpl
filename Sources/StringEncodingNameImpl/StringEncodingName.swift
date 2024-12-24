public import Foundation

extension String.Encoding {
  /// A type that indicates the standard that defines an encoding's name.
  public enum NameType {
    /// The type of names that are registered by IANA (Internet Assigned Numbers Authority).
    case iana

    /// The type of names that are provided by WHATWG (Web Hypertext Application Technology Working Group)
    case whatwg
  }

  private var _ianaCharset: IANACharset? {
    switch self {
    case .utf8: .utf8
    case .ascii: .usASCII
    case .japaneseEUC: .eucJP
    case .isoLatin1: .iso8859_1
    case .shiftJIS: .shiftJIS
    case .isoLatin2: .iso8859_2
    case .unicode: .utf16
    case .windowsCP1251: .windows1251
    case .windowsCP1252: .windows1252
    case .windowsCP1253: .windows1253
    case .windowsCP1254: .windows1254
    case .windowsCP1250: .windows1250
    case .iso2022JP: .iso2022JP
    case .macOSRoman: .macintosh
    case .utf16BigEndian: .utf16BE
    case .utf16LittleEndian: .utf16LE
    case .utf32: .utf32
    case .utf32BigEndian: .utf32BE
    case .utf32LittleEndian: .utf32LE
    default: nil
    }
  }

  private var _whatwgEncoding: WHATWGEncoding? {
    switch self {
    case .utf8: .utf8
    case .japaneseEUC: .eucJP
    case .shiftJIS: .shiftJIS
    case .isoLatin2: .iso8859_2
    case .windowsCP1251: .windows1251
    case .windowsCP1252: .windows1252
    case .windowsCP1253: .windows1253
    case .windowsCP1254: .windows1254
    case .windowsCP1250: .windows1250
    case .iso2022JP: .iso2022JP
    case .macOSRoman: .macintosh
    case .utf16BigEndian: .utf16BE
    case .utf16LittleEndian: .utf16LE
    default: nil
    }
  }

  /// Returns the encoding name specified by the given `type`.
  public func name(_ type: NameType) -> String? {
    switch type {
    case .iana: _ianaCharset?.representativeName
    case .whatwg: _whatwgEncoding?.name
    }
  }

  /// Creates an instance from the name of the IANA registry "charset".
  public init?(iana charsetName: String) {
    func __determineEncoding() -> String.Encoding? {
      func __matches(_ charsets: IANACharset...) -> Bool {
        assert(!charsets.isEmpty)
        for charset in charsets {
          if charset.matches(charsetName) {
            return true
          }
        }
        return false
      }

      return if __matches(.utf8) {
        .utf8
      } else if __matches(.usASCII, .iso646Irv1983) {
        .ascii
      } else if __matches(.eucJP) {
        .japaneseEUC
      } else if __matches(.iso8859_1) {
        .isoLatin1
      } else if __matches(.adobeSymbolEncoding) {
        .symbol
      } else if __matches(.shiftJIS, .windows31J) {
        .shiftJIS
      } else if __matches(.iso8859_2) {
        .isoLatin2
      } else if __matches(.utf16, .iso10646UCS2, .unicode1_1) {
        .utf16
      } else if __matches(.windows1251) {
        .windowsCP1251
      } else if __matches(.windows1252, .iso8859_1Windows3_0Latin1, .iso8859_1Windows3_1Latin1) {
        .windowsCP1252
      } else if __matches(.windows1253) {
        .windowsCP1253
      } else if __matches(.windows1254, .iso8859_9WindowsLatin5) {
        .windowsCP1254
      } else if __matches(.windows1250, .iso8859_2WindowsLatin2) {
        .windowsCP1250
      } else if __matches(.iso2022JP) {
        .iso2022JP
      } else if __matches(.macintosh) {
        .macOSRoman
      } else if __matches(.utf16BE) {
        .utf16BigEndian
      } else if __matches(.utf16LE) {
        .utf16LittleEndian
      } else if __matches(.utf32, .iso10646UCS4) {
        .utf32
      } else if __matches(.utf32BE) {
        .utf32BigEndian
      } else if __matches(.utf32LE) {
        .utf32LittleEndian
      } else {
        nil
      }
    }

    guard let encoding = __determineEncoding() else {
      return nil
    }
    self = encoding
  }

  /// Creates an instance from the name of the WHATWG encoding.
  public init?(whatwg standardEncodingName: String) {
    func __determineEncoding() -> String.Encoding? {
      func __matches(_ whatwgEncoding: WHATWGEncoding) -> Bool {
        return whatwgEncoding.matches(standardEncodingName)
      }

      return if __matches(.utf8) {
        .utf8
      } else if __matches(.eucJP) {
        .japaneseEUC
      } else if __matches(.shiftJIS) {
        .shiftJIS
      } else if __matches(.iso8859_2) {
        .isoLatin2
      } else if __matches(.windows1251) {
        .windowsCP1251
      } else if __matches(.windows1252) {
        .windowsCP1252
      } else if __matches(.windows1253) {
        .windowsCP1253
      } else if __matches(.windows1254) {
        .windowsCP1254
      } else if __matches(.windows1250) {
        .windowsCP1250
      } else if __matches(.iso2022JP) {
        .iso2022JP
      } else if __matches(.macintosh) {
        .macOSRoman
      } else if __matches(.utf16BE) {
        .utf16BigEndian
      } else if __matches(.utf16LE) {
        .utf16LittleEndian
      } else {
        nil
      }
    }

    guard let encoding = __determineEncoding() else {
      return nil
    }
    self = encoding
  }
}
