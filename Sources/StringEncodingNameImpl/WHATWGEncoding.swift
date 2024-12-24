/// Info about WHATWG Encoding.
package struct WHATWGEncoding {
  /// The name of this encoding
  package let name: String

  /// String lables of this encoding
  package let labels: Array<String>

  package init(name: String, labels: Array<String>) {
    self.name = name
    self.labels = labels
  }

  package func matches(_ string: String) -> Bool {
    for label in labels {
      if label.isEqual(to: string, asStringEncodingNameOf: .whatwg) {
        return true
      }
    }
    return false
  }
}
