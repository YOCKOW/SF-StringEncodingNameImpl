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
    let parser = StringEncodingNameParser("UTF-8", variant: .whatwgStandard)
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("u"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("t"))
    #expect(parser.nextToken() == .caseInsensitiveASCIIAlphabet("f"))
    #expect(parser.nextToken() == .other("-"))
    #expect(parser.nextToken() == .numeric(8))
    #expect(parser.nextToken() == nil)
    #expect(parser.nextToken() == nil)
  }
}
