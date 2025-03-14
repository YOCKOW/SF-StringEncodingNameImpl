/// Info about IANA Charset.
package struct IANACharset {
  /// Preferred MIME Name
  package let preferredMIMEName: String?

  /// The name of this charset
  package let name: String

  /// The aliases of this charset
  package let aliases: Array<String>

  package var representativeName: String {
    return preferredMIMEName ?? name
  }

  package init(preferredMIMEName: String?, name: String, aliases: Array<String>) {
    self.preferredMIMEName = preferredMIMEName
    self.name = name
    self.aliases = aliases
  }

  package func matches<T>(
    _ string: String,
    tokenizedBy tokenizer: T.Type
  ) -> Bool where T: StringEncodingNameTokenizer {
    if let preferredMIMEName = self.preferredMIMEName,
       preferredMIMEName.isEqual(to: string, tokenizedBy: tokenizer) {
      return true
    }
    if name.isEqual(to: string, tokenizedBy: tokenizer) {
      return true
    }
    for alias in aliases {
      if alias.isEqual(to: string, tokenizedBy: tokenizer) {
        return true
      }
    }
    return false
  }
}
