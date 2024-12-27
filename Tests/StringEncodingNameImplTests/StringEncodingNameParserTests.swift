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

  @Test func test_WHATWGEncodingStandard() throws {
    var tokenizer = WHATWGEncodingNameTokenizer(name: "UTF-8")
    #expect(try tokenizer.nextToken() == "u")
    #expect(try tokenizer.nextToken() == "t")
    #expect(try tokenizer.nextToken() == "f")
    #expect(try tokenizer.nextToken() == "-")
    #expect(try tokenizer.nextToken() == "8")
    #expect(try tokenizer.nextToken() == nil)
    #expect(try tokenizer.nextToken() == nil)
  }

  @Test func test_StringEncodingNameEquality() {
    #expect("UTF-8".isEqual(to: "utf8", asStringEncodingNameOf: .iana))
    #expect("utf8".isEqual(to: "U@t!F%%%008", asStringEncodingNameOf: .iana))
    #expect(!"utf-8".isEqual(to: "utf-80", asStringEncodingNameOf: .iana))
    #expect(!"euc-jp".isEqual(to: "euc-jp1234567890123456", asStringEncodingNameOf: .iana))

    #expect("UTF-8".isEqual(to: "uTf-8", asStringEncodingNameOf: .whatwg))
    #expect(!"UTF-8".isEqual(to: "utf8", asStringEncodingNameOf: .whatwg))
    #expect(!"UTF-8".isEqual(to: "utf-08", asStringEncodingNameOf: .whatwg))
    #expect(!"UTF-8".isEqual(to: "utf-80", asStringEncodingNameOf: .whatwg))
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
    #expect(String.Encoding.ascii.name(.iana) == "US-ASCII")
    #expect(String.Encoding.nextstep.name(.iana) == nil)
    #expect(String.Encoding.japaneseEUC.name(.iana) == "EUC-JP")
    #expect(String.Encoding.utf8.name(.iana) == "UTF-8")
    #expect(String.Encoding.isoLatin1.name(.iana) == "ISO-8859-1")
    #expect(String.Encoding.symbol.name(.iana) == nil)
    #expect(String.Encoding.nonLossyASCII.name(.iana) == nil)
    #expect(String.Encoding.shiftJIS.name(.iana) == "Shift_JIS")
    #expect(String.Encoding.isoLatin2.name(.iana) == "ISO-8859-2")
    #expect(String.Encoding.unicode.name(.iana) == "UTF-16")
    #expect(String.Encoding.windowsCP1251.name(.iana) == "windows-1251")
    #expect(String.Encoding.windowsCP1252.name(.iana) == "windows-1252")
    #expect(String.Encoding.windowsCP1253.name(.iana) == "windows-1253")
    #expect(String.Encoding.windowsCP1254.name(.iana) == "windows-1254")
    #expect(String.Encoding.windowsCP1250.name(.iana) == "windows-1250")
    #expect(String.Encoding.iso2022JP.name(.iana) == "ISO-2022-JP")
    #expect(String.Encoding.macOSRoman.name(.iana) == "macintosh")
    #expect(String.Encoding.utf16BigEndian.name(.iana) == "UTF-16BE")
    #expect(String.Encoding.utf16LittleEndian.name(.iana) == "UTF-16LE")
    #expect(String.Encoding.utf32.name(.iana) == "UTF-32")
    #expect(String.Encoding.utf32BigEndian.name(.iana) == "UTF-32BE")
    #expect(String.Encoding.utf32LittleEndian.name(.iana) == "UTF-32LE")
    #expect(String.Encoding(rawValue: .max).name(.iana) == nil)
  }

  @Test func test_fromCharsetName() {
    #expect(String.Encoding(iana: "us-ascii") == .ascii)
    #expect(String.Encoding(iana: "iso-ir-2") == nil)
    #expect(String.Encoding(iana: "x-nextstep") == nil)
    #expect(String.Encoding(iana: "euc-jp") == .japaneseEUC)
    #expect(String.Encoding(iana: "CP51932") == nil)
    #expect(String.Encoding(iana: "utf-8") == .utf8)
    #expect(String.Encoding(iana: "iso_8859-1") == .isoLatin1)
    #expect(String.Encoding(iana: "x-mac-symbol") == nil)
    #expect(String.Encoding(iana: "Adobe-symbol-encoding") == .symbol)
    #expect(String.Encoding(iana: "cp932") == nil)
    #expect(String.Encoding(iana: "shift_jis") == .shiftJIS)
    #expect(String.Encoding(iana: "windows-31j") == .shiftJIS)
    #expect(String.Encoding(iana: "iso_8859-2") == .isoLatin2)
    #expect(String.Encoding(iana: "utf-16") == .utf16)
    #expect(String.Encoding(iana: "iso-10646-ucs-2") == .utf16)
    #expect(String.Encoding(iana: "unicode-1-1") == .utf16)
    #expect(String.Encoding(iana: "windows-1251") == .windowsCP1251)
    #expect(String.Encoding(iana: "windows-1252") == .windowsCP1252)
    #expect(String.Encoding(iana: "ISO-8859-1-Windows-3.0-Latin-1") == .windowsCP1252)
    #expect(String.Encoding(iana: "ISO-8859-1-Windows-3.1-Latin-1") == .windowsCP1252)
    #expect(String.Encoding(iana: "windows-1253") == .windowsCP1253)
    #expect(String.Encoding(iana: "windows-1254") == .windowsCP1254)
    #expect(String.Encoding(iana: "iso-8859-9-windows-Latin-5") == .windowsCP1254)
    #expect(String.Encoding(iana: "windows-1250") == .windowsCP1250)
    #expect(String.Encoding(iana: "iso-8859-2-windows-Latin-2") == .windowsCP1250)
    #expect(String.Encoding(iana: "iso-2022-jp") == .iso2022JP)
    #expect(String.Encoding(iana: "macintosh") == .macOSRoman)
    #expect(String.Encoding(iana: "utf-16be") == .utf16BigEndian)
    #expect(String.Encoding(iana: "utf-16le") == .utf16LittleEndian)
    #expect(String.Encoding(iana: "utf-32") == .utf32)
    #expect(String.Encoding(iana: "iso-10646-ucs-4") == .utf32)
    #expect(String.Encoding(iana: "utf-32be") == .utf32BigEndian)
    #expect(String.Encoding(iana: "utf-32le") == .utf32LittleEndian)
    #expect(String.Encoding(iana: "foo-bar-baz") == nil)
  }

  @Test func test_toStandardName() {
    #expect(String.Encoding.ascii.name(.whatwg) == nil)
    #expect(String.Encoding.nextstep.name(.whatwg) == nil)
    #expect(String.Encoding.japaneseEUC.name(.whatwg) == "EUC-JP")
    #expect(String.Encoding.utf8.name(.whatwg) == "UTF-8")
    #expect(String.Encoding.isoLatin1.name(.whatwg) == nil)
    #expect(String.Encoding.symbol.name(.whatwg) == nil)
    #expect(String.Encoding.nonLossyASCII.name(.whatwg) == nil)
    #expect(String.Encoding.shiftJIS.name(.whatwg) == "Shift_JIS")
    #expect(String.Encoding.isoLatin2.name(.whatwg) == "ISO-8859-2")
    #expect(String.Encoding.unicode.name(.whatwg) == nil)
    #expect(String.Encoding.windowsCP1251.name(.whatwg) == "windows-1251")
    #expect(String.Encoding.windowsCP1252.name(.whatwg) == "windows-1252")
    #expect(String.Encoding.windowsCP1253.name(.whatwg) == "windows-1253")
    #expect(String.Encoding.windowsCP1254.name(.whatwg) == "windows-1254")
    #expect(String.Encoding.windowsCP1250.name(.whatwg) == "windows-1250")
    #expect(String.Encoding.iso2022JP.name(.whatwg) == "ISO-2022-JP")
    #expect(String.Encoding.macOSRoman.name(.whatwg) == "macintosh")
    #expect(String.Encoding.utf16BigEndian.name(.whatwg) == "UTF-16BE")
    #expect(String.Encoding.utf16LittleEndian.name(.whatwg) == "UTF-16LE")
    #expect(String.Encoding.utf32.name(.whatwg) == nil)
    #expect(String.Encoding.utf32BigEndian.name(.whatwg) == nil)
    #expect(String.Encoding.utf32LittleEndian.name(.whatwg) == nil)
    #expect(String.Encoding(rawValue: .max).name(.whatwg) == nil)
  }

  @Test func test_fromStandardName() {
    #expect(String.Encoding(whatwg: "us-ascii") == .windowsCP1252)
    #expect(String.Encoding(whatwg: "x-nextstep") == nil)
    #expect(String.Encoding(whatwg: "euc-jp") == .japaneseEUC)
    #expect(String.Encoding(whatwg: "utf-8") == .utf8)
    #expect(String.Encoding(whatwg: "iso_8859-1") == .windowsCP1252)
    #expect(String.Encoding(whatwg: "x-mac-symbol") == nil)
    #expect(String.Encoding(whatwg: "cp932") == nil)
    #expect(String.Encoding(whatwg: "shift_jis") == .shiftJIS)
    #expect(String.Encoding(whatwg: "windows-31j") == .shiftJIS)
    #expect(String.Encoding(whatwg: "iso_8859-2") == .isoLatin2)
    #expect(String.Encoding(whatwg: "utf-16") == .utf16LittleEndian)
    #expect(String.Encoding(whatwg: "iso-10646-ucs-2") == .utf16LittleEndian)
    #expect(String.Encoding(whatwg: "windows-1251") == .windowsCP1251)
    #expect(String.Encoding(whatwg: "windows-1252") == .windowsCP1252)
    #expect(String.Encoding(whatwg: "windows-1253") == .windowsCP1253)
    #expect(String.Encoding(whatwg: "windows-1254") == .windowsCP1254)
    #expect(String.Encoding(whatwg: "windows-1250") == .windowsCP1250)
    #expect(String.Encoding(whatwg: "iso-2022-jp") == .iso2022JP)
    #expect(String.Encoding(whatwg: "macintosh") == .macOSRoman)
    #expect(String.Encoding(whatwg: "utf-16be") == .utf16BigEndian)
    #expect(String.Encoding(whatwg: "utf-16le") == .utf16LittleEndian)
    #expect(String.Encoding(whatwg: "utf-32") == nil)
    #expect(String.Encoding(whatwg: "utf-32be") == nil)
    #expect(String.Encoding(whatwg: "utf-32le") == nil)
    #expect(String.Encoding(whatwg: "foo-bar-baz") == nil)
  }
}
