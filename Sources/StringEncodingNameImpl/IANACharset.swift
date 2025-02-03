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

  package func matches(_ string: String) -> Bool {
    if let preferredMIMEName = self.preferredMIMEName,
       preferredMIMEName.isEqual(to: string, tokenizedBy: IANACharsetNameTokenizer.self) {
      return true
    }
    if name.isEqual(to: string, tokenizedBy: IANACharsetNameTokenizer.self) {
      return true
    }
    for alias in aliases {
      if alias.isEqual(to: string, tokenizedBy: IANACharsetNameTokenizer.self) {
        return true
      }
    }
    return false
  }
}
