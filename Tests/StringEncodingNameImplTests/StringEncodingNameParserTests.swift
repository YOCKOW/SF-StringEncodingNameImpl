import Testing
@testable import StringEncodingNameImpl

@Suite struct StringEncodingNameParserTests {
  @Test func test_IANACharsetTokens() throws {
    var tokenizer = IANACharsetNameTokenizer(name: "u.t.f-008")
    #expect(try tokenizer.nextToken() == .alphabet("U"))
    #expect(try tokenizer.nextToken() == .alphabet("T"))
    #expect(try tokenizer.nextToken() == .alphabet("F"))
    #expect(try tokenizer.nextToken() == .numeric(8))
    #expect(try tokenizer.nextToken() == nil)
    #expect(try tokenizer.nextToken() == nil)
  }

  @Test func test_StringEncodingNameEquality() {
    #expect("UTF-8".isEqual(to: "utf8", tokenizedBy: IANACharsetNameTokenizer.self))
    #expect("utf8".isEqual(to: "U@t!F%%%008", tokenizedBy: IANACharsetNameTokenizer.self))
    #expect(!"utf-8".isEqual(to: "utf-80", tokenizedBy: IANACharsetNameTokenizer.self))
    #expect(!"euc-jp".isEqual(to: "euc-jp1234567890123456", tokenizedBy: IANACharsetNameTokenizer.self))
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
}

@Suite struct StringEncodingNameTests {
  @Test func test_toCharsetName() {
    #expect(String.Encoding.ascii.name == "US-ASCII")
    #expect(String.Encoding.nextstep.name == nil)
    #expect(String.Encoding.japaneseEUC.name == "EUC-JP")
    #expect(String.Encoding.utf8.name == "UTF-8")
    #expect(String.Encoding.isoLatin1.name == "ISO-8859-1")
    #expect(String.Encoding.symbol.name == nil)
    #expect(String.Encoding.nonLossyASCII.name == nil)
    #expect(String.Encoding.shiftJIS.name == "Shift_JIS")
    #expect(String.Encoding.isoLatin2.name == "ISO-8859-2")
    #expect(String.Encoding.unicode.name == "UTF-16")
    #expect(String.Encoding.windowsCP1251.name == "windows-1251")
    #expect(String.Encoding.windowsCP1252.name == "windows-1252")
    #expect(String.Encoding.windowsCP1253.name == "windows-1253")
    #expect(String.Encoding.windowsCP1254.name == "windows-1254")
    #expect(String.Encoding.windowsCP1250.name == "windows-1250")
    #expect(String.Encoding.iso2022JP.name == "ISO-2022-JP")
    #expect(String.Encoding.macOSRoman.name == "macintosh")
    #expect(String.Encoding.utf16BigEndian.name == "UTF-16BE")
    #expect(String.Encoding.utf16LittleEndian.name == "UTF-16LE")
    #expect(String.Encoding.utf32.name == "UTF-32")
    #expect(String.Encoding.utf32BigEndian.name == "UTF-32BE")
    #expect(String.Encoding.utf32LittleEndian.name == "UTF-32LE")
    #expect(String.Encoding(rawValue: .max).name == nil)
  }

  @Test func test_fromCharsetName() {
    #expect(String.Encoding(name: "us-ascii") == .ascii)
    #expect(String.Encoding(name: "iso-ir-2") == nil)
    #expect(String.Encoding(name: "x-nextstep") == nil)
    #expect(String.Encoding(name: "euc-jp") == .japaneseEUC)
    #expect(String.Encoding(name: "CP51932") == nil)
    #expect(String.Encoding(name: "utf-8") == .utf8)
    #expect(String.Encoding(name: "iso_8859-1") == .isoLatin1)
    #expect(String.Encoding(name: "x-mac-symbol") == nil)
    #expect(String.Encoding(name: "Adobe-symbol-encoding") == .symbol)
    #expect(String.Encoding(name: "cp932") == nil)
    #expect(String.Encoding(name: "shift_jis") == .shiftJIS)
    #expect(String.Encoding(name: "windows-31j") == .shiftJIS)
    #expect(String.Encoding(name: "iso_8859-2") == .isoLatin2)
    #expect(String.Encoding(name: "utf-16") == .utf16)
    #expect(String.Encoding(name: "iso-10646-ucs-2") == .utf16)
    #expect(String.Encoding(name: "unicode-1-1") == .utf16)
    #expect(String.Encoding(name: "windows-1251") == .windowsCP1251)
    #expect(String.Encoding(name: "windows-1252") == .windowsCP1252)
    #expect(String.Encoding(name: "ISO-8859-1-Windows-3.0-Latin-1") == .windowsCP1252)
    #expect(String.Encoding(name: "ISO-8859-1-Windows-3.1-Latin-1") == .windowsCP1252)
    #expect(String.Encoding(name: "windows-1253") == .windowsCP1253)
    #expect(String.Encoding(name: "windows-1254") == .windowsCP1254)
    #expect(String.Encoding(name: "iso-8859-9-windows-Latin-5") == .windowsCP1254)
    #expect(String.Encoding(name: "windows-1250") == .windowsCP1250)
    #expect(String.Encoding(name: "iso-8859-2-windows-Latin-2") == .windowsCP1250)
    #expect(String.Encoding(name: "iso-2022-jp") == .iso2022JP)
    #expect(String.Encoding(name: "macintosh") == .macOSRoman)
    #expect(String.Encoding(name: "utf-16be") == .utf16BigEndian)
    #expect(String.Encoding(name: "utf-16le") == .utf16LittleEndian)
    #expect(String.Encoding(name: "utf-32") == .utf32)
    #expect(String.Encoding(name: "iso-10646-ucs-4") == .utf32)
    #expect(String.Encoding(name: "utf-32be") == .utf32BigEndian)
    #expect(String.Encoding(name: "utf-32le") == .utf32LittleEndian)
    #expect(String.Encoding(name: "foo-bar-baz") == nil)
  }
}
