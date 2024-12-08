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
}
