import Testing
@testable import StringEncodingNameImpl

@Suite struct StringEncodingNameParserTests {
  @Test func test_IANACharsetTokens() throws {
    var tokenizer = UTS22Tokenizer(name: "u.t.f-008")
    #expect(try tokenizer.nextToken() == .alphabet("U"))
    #expect(try tokenizer.nextToken() == .alphabet("T"))
    #expect(try tokenizer.nextToken() == .alphabet("F"))
    #expect(try tokenizer.nextToken() == .numeric(8))
    #expect(try tokenizer.nextToken() == nil)
    #expect(try tokenizer.nextToken() == nil)
  }

  @Test func test_StringEncodingNameEquality() {
    #expect("UTF-8".isEqual(to: "utf8", tokenizedBy: UTS22Tokenizer.self))
    #expect("utf8".isEqual(to: "U@t!F%%%008", tokenizedBy: UTS22Tokenizer.self))
    #expect(!"utf-8".isEqual(to: "utf-80", tokenizedBy: UTS22Tokenizer.self))
    #expect(!"euc-jp".isEqual(to: "euc-jp1234567890123456", tokenizedBy: UTS22Tokenizer.self))

    #expect("uTf-8".isEqual(to: "UTF-8", tokenizedBy: ASCIICaseInsensitiveTokenizer.self))
    #expect(!"UTF_8".isEqual(to: "UTF-8", tokenizedBy: ASCIICaseInsensitiveTokenizer.self))
  }

  @Test func test_IANACharsetMatching() {
    #expect(IANACharset.usASCII.matches("us-ascii", tokenizedBy: ASCIICaseInsensitiveTokenizer.self))
    #expect(IANACharset.usASCII.matches("iso646irv1991", tokenizedBy: UTS22Tokenizer.self))
    #expect(IANACharset.usASCII.matches("us", tokenizedBy: ASCIICaseInsensitiveTokenizer.self))
    #expect(!IANACharset.usASCII.matches("USA", tokenizedBy: UTS22Tokenizer.self))

    #expect(IANACharset.eucJP.matches("EuC-Jp", tokenizedBy: ASCIICaseInsensitiveTokenizer.self))
    #expect(IANACharset.eucJP.matches("Extended_UNIX_Code_Packed_Format_for_Japanese", tokenizedBy: UTS22Tokenizer.self))
    #expect(!IANACharset.eucJP.matches("EUC-KR", tokenizedBy: UTS22Tokenizer.self))
  }
}

@Suite struct StringEncodingNameTests {
  @Test func test_toCharsetName() {
    #expect(String.Encoding.ascii.ianaName == "US-ASCII")
    #expect(String.Encoding.nextstep.ianaName == nil)
    #expect(String.Encoding.japaneseEUC.ianaName == "EUC-JP")
    #expect(String.Encoding.utf8.ianaName == "UTF-8")
    #expect(String.Encoding.isoLatin1.ianaName == "ISO-8859-1")
    #expect(String.Encoding.symbol.ianaName == nil)
    #expect(String.Encoding.nonLossyASCII.ianaName == nil)
    #expect(String.Encoding.shiftJIS.ianaName == "Shift_JIS")
    #expect(String.Encoding.isoLatin2.ianaName == "ISO-8859-2")
    #expect(String.Encoding.unicode.ianaName == "UTF-16")
    #expect(String.Encoding.windowsCP1251.ianaName == "windows-1251")
    #expect(String.Encoding.windowsCP1252.ianaName == "windows-1252")
    #expect(String.Encoding.windowsCP1253.ianaName == "windows-1253")
    #expect(String.Encoding.windowsCP1254.ianaName == "windows-1254")
    #expect(String.Encoding.windowsCP1250.ianaName == "windows-1250")
    #expect(String.Encoding.iso2022JP.ianaName == "ISO-2022-JP")
    #expect(String.Encoding.macOSRoman.ianaName == "macintosh")
    #expect(String.Encoding.utf16BigEndian.ianaName == "UTF-16BE")
    #expect(String.Encoding.utf16LittleEndian.ianaName == "UTF-16LE")
    #expect(String.Encoding.utf32.ianaName == "UTF-32")
    #expect(String.Encoding.utf32BigEndian.ianaName == "UTF-32BE")
    #expect(String.Encoding.utf32LittleEndian.ianaName == "UTF-32LE")
    #expect(String.Encoding(rawValue: .max).ianaName == nil)
  }

  @Test func test_fromCharsetName() {
    #expect(String.Encoding(ianaName: "us-ascii") == .ascii)
    #expect(String.Encoding(ianaName: "iso-ir-2") == nil)
    #expect(String.Encoding(ianaName: "x-nextstep") == nil)
    #expect(String.Encoding(ianaName: "euc-jp") == .japaneseEUC)
    #expect(String.Encoding(ianaName: "CP51932") == nil)
    #expect(String.Encoding(ianaName: "utf-8") == .utf8)
    #expect(String.Encoding(ianaName: "iso_8859-1") == .isoLatin1)
    #expect(String.Encoding(ianaName: "x-mac-symbol") == nil)
    #expect(String.Encoding(ianaName: "Adobe-symbol-encoding") == nil)
    #expect(String.Encoding(ianaName: "cp932") == nil)
    #expect(String.Encoding(ianaName: "shift_jis") == .shiftJIS)
    #expect(String.Encoding(ianaName: "windows-31j") == nil)
    #expect(String.Encoding(ianaName: "iso_8859-2") == .isoLatin2)
    #expect(String.Encoding(ianaName: "utf-16") == .utf16)
    #expect(String.Encoding(ianaName: "iso-10646-ucs-2") == nil)
    #expect(String.Encoding(ianaName: "unicode-1-1") == nil)
    #expect(String.Encoding(ianaName: "windows-1251") == .windowsCP1251)
    #expect(String.Encoding(ianaName: "windows-1252") == .windowsCP1252)
    #expect(String.Encoding(ianaName: "ISO-8859-1-Windows-3.0-Latin-1") == nil)
    #expect(String.Encoding(ianaName: "ISO-8859-1-Windows-3.1-Latin-1") == nil)
    #expect(String.Encoding(ianaName: "windows-1253") == .windowsCP1253)
    #expect(String.Encoding(ianaName: "windows-1254") == .windowsCP1254)
    #expect(String.Encoding(ianaName: "iso-8859-9-windows-Latin-5") == nil)
    #expect(String.Encoding(ianaName: "windows-1250") == .windowsCP1250)
    #expect(String.Encoding(ianaName: "iso-8859-2-windows-Latin-2") == nil)
    #expect(String.Encoding(ianaName: "iso-2022-jp") == .iso2022JP)
    #expect(String.Encoding(ianaName: "macintosh") == .macOSRoman)
    #expect(String.Encoding(ianaName: "utf-16be") == .utf16BigEndian)
    #expect(String.Encoding(ianaName: "utf-16le") == .utf16LittleEndian)
    #expect(String.Encoding(ianaName: "utf-32") == .utf32)
    #expect(String.Encoding(ianaName: "iso-10646-ucs-4") == nil)
    #expect(String.Encoding(ianaName: "utf-32be") == .utf32BigEndian)
    #expect(String.Encoding(ianaName: "utf-32le") == .utf32LittleEndian)
    #expect(String.Encoding(ianaName: "foo-bar-baz") == nil)
  }
}
