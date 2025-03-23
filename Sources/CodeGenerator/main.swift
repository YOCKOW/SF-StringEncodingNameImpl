import Foundation
import StringComposition
import StringEncodingNameImpl
import yExtensions

let repoRoot = URL(
  fileURLWithPath: #filePath
).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
let assetsDir = repoRoot.appendingPathComponent("assets")
let ianaJSONPath = assetsDir.appendingPathComponent("ianaCharacterSets.json")
let sourcesDir = repoRoot.appendingPathComponent("Sources")
let implSourceDir = sourcesDir.appendingPathComponent("StringEncodingNameImpl")
let ianaSwiftPath = implSourceDir.appendingPathComponent("IANACharsetNames.swift")

guard ianaJSONPath.isExistingLocalFile else {
  fatalError("Missing required files. Run `utils/get-assets` first.")
}

let doWrite = CommandLine.arguments.contains("--write")

func printToStderr(_ message: String) {
  var stderr = FileHandle.standardError
  print(message, to: &stderr)
}

let requiredIANACharsets: [String] = [
  "UTF-8",
  "US-ASCII",
  "EUC-JP",
  "ISO-8859-1",
  // "Adobe-Symbol-Encoding",
  "Shift_JIS", // "Windows-31J",
  "ISO-8859-2",
  "UTF-16", // "ISO-10646-UCS-2", "UNICODE-1-1",
  "windows-1251",
  "windows-1252", // "ISO-8859-1-Windows-3.0-Latin-1", "ISO-8859-1-Windows-3.1-Latin-1",
  "windows-1253",
  "windows-1254", // "ISO-8859-9-Windows-Latin-5",
  "windows-1250", // "ISO-8859-2-Windows-Latin-2",
  "ISO-2022-JP",
  "macintosh",
  "UTF-16BE",
  "UTF-16LE",
  "UTF-32", // "ISO-10646-UCS-4",
  "UTF-32BE",
  "UTF-32LE",
]
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

  var isRequired: Bool {
    for req in requiredIANACharsets {
      if self.matches(req, tokenizedBy: UTS22Tokenizer.self) {
        return true
      }
    }
    return false
  }
}

let ianaCharsetInfoList: [IANACharset] = try JSONDecoder().decode(
  Array<IANACharset>.self,
  from: Data(contentsOf: ianaJSONPath)
)

// Generate code for IANA charsets
var ianaCharsetCode = String.Composition()
ianaCharsetCode.omitSpacesInEmptyPayloadLine = true
for charset in ianaCharsetInfoList {
  guard charset.isRequired else {
    ianaCharsetCode.append("// SKIPPED: IANA Character Set `\(charset.representativeName)`")
    ianaCharsetCode.appendEmptyLine()
    continue
  }

  let identifier = charset.representativeName.lowerCamelCase
  ianaCharsetCode.append("/// IANA Characater Set `\(charset.representativeName)`")
  ianaCharsetCode.append("static let \(identifier) = IANACharset(")
  ianaCharsetCode.append("preferredMIMEName: \(charset.preferredMIMEName.map(\.debugDescription) ?? "nil"),", indentLevel: 1)
  ianaCharsetCode.append("name: \(charset.name.debugDescription),", indentLevel: 1)
  ianaCharsetCode.append("aliases: [", indentLevel: 1)
  for alias in charset.aliases {
    ianaCharsetCode.append("\(alias.debugDescription),", indentLevel: 2)
  }
  ianaCharsetCode.append("]", indentLevel: 1)
  ianaCharsetCode.append(")")
  ianaCharsetCode.appendEmptyLine()
}
ianaCharsetCode.shiftRight()
ianaCharsetCode.insert("extension IANACharset {", at: 0)
ianaCharsetCode.append("}")
if doWrite {
  printToStderr("Writing to \(ianaSwiftPath.absoluteString)")
  try Data(ianaCharsetCode.description.utf8).write(to: ianaSwiftPath)
} else {
  print(ianaCharsetCode)
}

if doWrite {
  printToStderr("Done.")
}
