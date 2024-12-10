import Testing
@testable import StringEncodingNameImpl

@Suite struct StringEncodingNameParserTests {
  @Test func test_IANACharsetTokens() {
    let parser = StringEncodingNameParser("u.t.f-008", variant: .ianaCharset)
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("U"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("T"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("F"))
    #expect(parser.nextToken() == .numeric(8))
    #expect(parser.nextToken() == nil)
    #expect(parser.nextToken() == nil)
  }

  @Test func test_WHATWGEncodingStandard() {
    let parser = StringEncodingNameParser("UTF-8", variant: .whatwgEncoding)
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("u"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("t"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("f"))
    #expect(parser.nextToken() == .other("-"))
    #expect(parser.nextToken() == .numeric(8))
    #expect(parser.nextToken() == nil)
    #expect(parser.nextToken() == nil)
  }

  @Test func test_StringEncodingNameEquality() {
    #expect("UTF-8".isEqual(to: "utf8", asStringEncodingNameOf: .ianaCharset))
    #expect("utf8".isEqual(to: "U@t!F%%%008", asStringEncodingNameOf: .ianaCharset))
    #expect(!"utf-8".isEqual(to: "utf-80", asStringEncodingNameOf: .ianaCharset))

    #expect("UTF-8".isEqual(to: "uTf-8", asStringEncodingNameOf: .whatwgEncoding))
    #expect(!"UTF-8".isEqual(to: "utf8", asStringEncodingNameOf: .whatwgEncoding))
    #expect(!"UTF-8".isEqual(to: "utf-08", asStringEncodingNameOf: .whatwgEncoding))
    #expect(!"UTF-8".isEqual(to: "utf-80", asStringEncodingNameOf: .whatwgEncoding))
  }

  @Test func test_IANACharsetMatching() {
    #expect(IANACharset.usASCII.matches("us-ascii"))
    #expect(IANACharset.usASCII.matches("iso_0646irv1991"))
    #expect(IANACharset.usASCII.matches("us"))
    #expect(!IANACharset.usASCII.matches("USA"))

    #expect(IANACharset.eucJP.matches("EuC-Jp"))
    #expect(IANACharset.eucJP.matches("Extended_UNIX_Code_Packed_Format_for_Japanese"))
    #expect(!IANACharset.eucJP.matches("EUC-KR"))
  }

  @Test func test_WHATWGEncodingMatching() {
    #expect(WHATWGEncoding.utf8.matches("UTF-8"))
    #expect(WHATWGEncoding.utf8.matches("UTF8"))
    #expect(WHATWGEncoding.utf8.matches("x-unicode20utf8"))
    #expect(!WHATWGEncoding.utf8.matches("UTF-81"))

    #expect(WHATWGEncoding.windows1252.matches("US-ASCII"))
    #expect(WHATWGEncoding.windows1252.matches("ISO_8859-1"))
    #expect(!WHATWGEncoding.windows1252.matches("windows-1251"))
  }
}

@Suite struct StringEncodingNameTests {
  @Test func test_toCharsetName() {
    #expect(String.Encoding.ascii.charsetName == "US-ASCII")
    #expect(String.Encoding.nextstep.charsetName == nil)
    #expect(String.Encoding.japaneseEUC.charsetName == "EUC-JP")
    #expect(String.Encoding.utf8.charsetName == "UTF-8")
    #expect(String.Encoding.isoLatin1.charsetName == "ISO-8859-1")
    #expect(String.Encoding.symbol.charsetName == nil)
    #expect(String.Encoding.nonLossyASCII.charsetName == nil)
    #expect(String.Encoding.shiftJIS.charsetName == "Shift_JIS")
    #expect(String.Encoding.isoLatin2.charsetName == "ISO-8859-2")
    #expect(String.Encoding.unicode.charsetName == "UTF-16")
    #expect(String.Encoding.windowsCP1251.charsetName == "windows-1251")
    #expect(String.Encoding.windowsCP1252.charsetName == "windows-1252")
    #expect(String.Encoding.windowsCP1253.charsetName == "windows-1253")
    #expect(String.Encoding.windowsCP1254.charsetName == "windows-1254")
    #expect(String.Encoding.windowsCP1250.charsetName == "windows-1250")
    #expect(String.Encoding.iso2022JP.charsetName == "ISO-2022-JP")
    #expect(String.Encoding.macOSRoman.charsetName == "macintosh")
    #expect(String.Encoding.utf16BigEndian.charsetName == "UTF-16BE")
    #expect(String.Encoding.utf16LittleEndian.charsetName == "UTF-16LE")
    #expect(String.Encoding.utf32.charsetName == "UTF-32")
    #expect(String.Encoding.utf32BigEndian.charsetName == "UTF-32BE")
    #expect(String.Encoding.utf32LittleEndian.charsetName == "UTF-32LE")
    #expect(String.Encoding(rawValue: .max).charsetName == nil)
  }

  @Test func test_fromCharsetName() {
    #expect(String.Encoding(charsetName: "us-ascii") == .ascii)
    #expect(String.Encoding(charsetName: "euc-jp") == .japaneseEUC)
    #expect(String.Encoding(charsetName: "utf-8") == .utf8)
    #expect(String.Encoding(charsetName: "iso_8859-1") == .isoLatin1)
    #expect(String.Encoding(charsetName: "shift_jis") == .shiftJIS)
    #expect(String.Encoding(charsetName: "iso_8859-2") == .isoLatin2)
    #expect(String.Encoding(charsetName: "utf-16") == .utf16)
    #expect(String.Encoding(charsetName: "windows-1251") == .windowsCP1251)
    #expect(String.Encoding(charsetName: "windows-1252") == .windowsCP1252)
    #expect(String.Encoding(charsetName: "windows-1253") == .windowsCP1253)
    #expect(String.Encoding(charsetName: "windows-1254") == .windowsCP1254)
    #expect(String.Encoding(charsetName: "windows-1250") == .windowsCP1250)
    #expect(String.Encoding(charsetName: "iso-2022-jp") == .iso2022JP)
    #expect(String.Encoding(charsetName: "macintosh") == .macOSRoman)
    #expect(String.Encoding(charsetName: "utf-16be") == .utf16BigEndian)
    #expect(String.Encoding(charsetName: "utf-16le") == .utf16LittleEndian)
    #expect(String.Encoding(charsetName: "utf-32") == .utf32)
    #expect(String.Encoding(charsetName: "utf-32be") == .utf32BigEndian)
    #expect(String.Encoding(charsetName: "utf-32le") == .utf32LittleEndian)
    #expect(String.Encoding(charsetName: "foo-bar-baz") == nil)
  }
}
