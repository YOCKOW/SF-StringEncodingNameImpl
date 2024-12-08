import Foundation
import StringComposition
import StringEncodingNameImpl
import yExtensions

let repoRoot = URL(
  fileURLWithPath: #filePath
).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
let assetsDir = repoRoot.appendingPathComponent("assets")
let ianaJSONPath = assetsDir.appendingPathComponent("ianaCharacterSets.json")
let whatwgJSONPath = assetsDir.appendingPathComponent("whatwgEncodings.json")

guard ianaJSONPath.isExistingLocalFile && whatwgJSONPath.isExistingLocalFile else {
  fatalError("Missing required files. Run `get-assets.zsh` first.")
}

extension IANACharset: Decodable {
  enum Key: String, CodingKey {
    case preferredMIMEName = "Preferred MIME Name"
    case name = "Name"
    case aliases = "Aliases"
  }

  package init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: Key.self)
    let preferredMIMEName = try container.decodeIfPresent(String.self, forKey: .preferredMIMEName)
    let name = try container.decode(String.self, forKey: .name)
    let aliases = try container.decodeIfPresent(String.self, forKey: .aliases).map({
      $0.split(separator: "\n", omittingEmptySubsequences: true).map(String.init).filter {
        !$0.hasPrefix("(") // Amiga-1251
      }
    }) ?? []
    self.init(preferredMIMEName: preferredMIMEName, name: name, aliases: aliases)
  }
}

extension WHATWGEncoding: Decodable {
  enum Key: String, CodingKey {
    case name
    case labels
  }

  package init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: Key.self)
    let name = try container.decode(String.self, forKey: .name)
    let labels = try container.decode(Array<String>.self, forKey: .labels)
    self.init(name: name, labels: labels)
  }
}

struct WHATWGEncodingCategorizedList: Decodable {
  let heading: String
  let encodings: Array<WHATWGEncoding>
}

let ianaCharsetInfoList: [IANACharset] = try JSONDecoder().decode(
  Array<IANACharset>.self,
  from: Data(contentsOf: ianaJSONPath)
)

let whatwgEncodingInfoList: [WHATWGEncodingCategorizedList] = try JSONDecoder().decode(
  Array<WHATWGEncodingCategorizedList>.self,
  from: Data(contentsOf: whatwgJSONPath)
)


// Generate code for IANA charsets
var ianaCharsetCode = String.Composition()
for charset in ianaCharsetInfoList {
  let identifier = charset.representativeName.lowerCamelCase
  ianaCharsetCode.append("/// IANA Characater Set `\(charset.representativeName)`")
  ianaCharsetCode.append("static let \(identifier) = IANACharset(")
  ianaCharsetCode.append("preferredMIMEName: \(charset.preferredMIMEName.map(\.debugDescription) ?? "nil"),", indentLevel: 1)
  ianaCharsetCode.append("name: \(charset.name.debugDescription),", indentLevel: 1)
  ianaCharsetCode.append("aliases: [", indentLevel: 1)
  for alias in charset.aliases {
    ianaCharsetCode.append("\(alias.debugDescription), ", indentLevel: 2)
  }
  ianaCharsetCode.append("]", indentLevel: 1)
  ianaCharsetCode.append(")")
  ianaCharsetCode.appendEmptyLine()
}
ianaCharsetCode.shiftRight()
ianaCharsetCode.insert("extension IANACharset {", at: 0)
ianaCharsetCode.append("}")
print(ianaCharsetCode)


// Generate code for WHATWG encodings
var whatwgEncodingCode = String.Composition()
for encoding in whatwgEncodingInfoList.flatMap(\.encodings) where encoding.name != "x-user-defined" {
  let identifier = encoding.name.lowerCamelCase
  whatwgEncodingCode.append("/// WHATWG Encoding `\(encoding.name)`")
  whatwgEncodingCode.append("static let \(identifier) = WHATWGEncoding(")
  whatwgEncodingCode.append("name: \(encoding.name.debugDescription),", indentLevel: 1)
  whatwgEncodingCode.append("labels: [", indentLevel: 1)
  for label in encoding.labels {
    whatwgEncodingCode.append("\(label.debugDescription),", indentLevel: 2)
  }
  whatwgEncodingCode.append("]", indentLevel: 1)
  whatwgEncodingCode.append(")")
  whatwgEncodingCode.appendEmptyLine()
}
whatwgEncodingCode.shiftRight()
whatwgEncodingCode.insert("extension WHATWGEncoding {", at: 0)
whatwgEncodingCode.append("}")
print(whatwgEncodingCode)
