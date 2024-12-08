extension IANACharset {
  /// IANA Characater Set `US-ASCII`
  static let usASCII = IANACharset(
    preferredMIMEName: "US-ASCII",
    name: "US-ASCII",
    aliases: [
      "iso-ir-6",
      "ANSI_X3.4-1968",
      "ANSI_X3.4-1986",
      "ISO_646.irv:1991",
      "ISO646-US",
      "US-ASCII",
      "us",
      "IBM367",
      "cp367",
      "csASCII",
    ]
  )

  /// IANA Characater Set `ISO-8859-1`
  static let iso88591 = IANACharset(
    preferredMIMEName: "ISO-8859-1",
    name: "ISO_8859-1:1987",
    aliases: [
      "iso-ir-100",
      "ISO_8859-1",
      "ISO-8859-1",
      "latin1",
      "l1",
      "IBM819",
      "CP819",
      "csISOLatin1",
    ]
  )

  /// IANA Characater Set `ISO-8859-2`
  static let iso88592 = IANACharset(
    preferredMIMEName: "ISO-8859-2",
    name: "ISO_8859-2:1987",
    aliases: [
      "iso-ir-101",
      "ISO_8859-2",
      "ISO-8859-2",
      "latin2",
      "l2",
      "csISOLatin2",
    ]
  )

  /// IANA Characater Set `ISO-8859-3`
  static let iso88593 = IANACharset(
    preferredMIMEName: "ISO-8859-3",
    name: "ISO_8859-3:1988",
    aliases: [
      "iso-ir-109",
      "ISO_8859-3",
      "ISO-8859-3",
      "latin3",
      "l3",
      "csISOLatin3",
    ]
  )

  /// IANA Characater Set `ISO-8859-4`
  static let iso88594 = IANACharset(
    preferredMIMEName: "ISO-8859-4",
    name: "ISO_8859-4:1988",
    aliases: [
      "iso-ir-110",
      "ISO_8859-4",
      "ISO-8859-4",
      "latin4",
      "l4",
      "csISOLatin4",
    ]
  )

  /// IANA Characater Set `ISO-8859-5`
  static let iso88595 = IANACharset(
    preferredMIMEName: "ISO-8859-5",
    name: "ISO_8859-5:1988",
    aliases: [
      "iso-ir-144",
      "ISO_8859-5",
      "ISO-8859-5",
      "cyrillic",
      "csISOLatinCyrillic",
    ]
  )

  /// IANA Characater Set `ISO-8859-6`
  static let iso88596 = IANACharset(
    preferredMIMEName: "ISO-8859-6",
    name: "ISO_8859-6:1987",
    aliases: [
      "iso-ir-127",
      "ISO_8859-6",
      "ISO-8859-6",
      "ECMA-114",
      "ASMO-708",
      "arabic",
      "csISOLatinArabic",
    ]
  )

  /// IANA Characater Set `ISO-8859-7`
  static let iso88597 = IANACharset(
    preferredMIMEName: "ISO-8859-7",
    name: "ISO_8859-7:1987",
    aliases: [
      "iso-ir-126",
      "ISO_8859-7",
      "ISO-8859-7",
      "ELOT_928",
      "ECMA-118",
      "greek",
      "greek8",
      "csISOLatinGreek",
    ]
  )

  /// IANA Characater Set `ISO-8859-8`
  static let iso88598 = IANACharset(
    preferredMIMEName: "ISO-8859-8",
    name: "ISO_8859-8:1988",
    aliases: [
      "iso-ir-138",
      "ISO_8859-8",
      "ISO-8859-8",
      "hebrew",
      "csISOLatinHebrew",
    ]
  )

  /// IANA Characater Set `ISO-8859-9`
  static let iso88599 = IANACharset(
    preferredMIMEName: "ISO-8859-9",
    name: "ISO_8859-9:1989",
    aliases: [
      "iso-ir-148",
      "ISO_8859-9",
      "ISO-8859-9",
      "latin5",
      "l5",
      "csISOLatin5",
    ]
  )

  /// IANA Characater Set `ISO-8859-10`
  static let iso885910 = IANACharset(
    preferredMIMEName: "ISO-8859-10",
    name: "ISO-8859-10",
    aliases: [
      "iso-ir-157",
      "l6",
      "ISO_8859-10:1992",
      "csISOLatin6",
      "latin6",
    ]
  )

  /// IANA Characater Set `ISO_6937-2-add`
  static let iso69372Add = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_6937-2-add",
    aliases: [
      "iso-ir-142",
      "csISOTextComm",
    ]
  )

  /// IANA Characater Set `JIS_X0201`
  static let jisX0201 = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_X0201",
    aliases: [
      "X0201",
      "csHalfWidthKatakana",
    ]
  )

  /// IANA Characater Set `JIS_Encoding`
  static let jisEncoding = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_Encoding",
    aliases: [
      "csJISEncoding",
    ]
  )

  /// IANA Characater Set `Shift_JIS`
  static let shiftJIS = IANACharset(
    preferredMIMEName: "Shift_JIS",
    name: "Shift_JIS",
    aliases: [
      "MS_Kanji",
      "csShiftJIS",
    ]
  )

  /// IANA Characater Set `EUC-JP`
  static let eucJP = IANACharset(
    preferredMIMEName: "EUC-JP",
    name: "Extended_UNIX_Code_Packed_Format_for_Japanese",
    aliases: [
      "csEUCPkdFmtJapanese",
      "EUC-JP",
    ]
  )

  /// IANA Characater Set `Extended_UNIX_Code_Fixed_Width_for_Japanese`
  static let extendedUNIXCodeFixedWidthForJapanese = IANACharset(
    preferredMIMEName: nil,
    name: "Extended_UNIX_Code_Fixed_Width_for_Japanese",
    aliases: [
      "csEUCFixWidJapanese",
    ]
  )

  /// IANA Characater Set `BS_4730`
  static let bs4730 = IANACharset(
    preferredMIMEName: nil,
    name: "BS_4730",
    aliases: [
      "iso-ir-4",
      "ISO646-GB",
      "gb",
      "uk",
      "csISO4UnitedKingdom",
    ]
  )

  /// IANA Characater Set `SEN_850200_C`
  static let sen850200C = IANACharset(
    preferredMIMEName: nil,
    name: "SEN_850200_C",
    aliases: [
      "iso-ir-11",
      "ISO646-SE2",
      "se2",
      "csISO11SwedishForNames",
    ]
  )

  /// IANA Characater Set `IT`
  static let it = IANACharset(
    preferredMIMEName: nil,
    name: "IT",
    aliases: [
      "iso-ir-15",
      "ISO646-IT",
      "csISO15Italian",
    ]
  )

  /// IANA Characater Set `ES`
  static let es = IANACharset(
    preferredMIMEName: nil,
    name: "ES",
    aliases: [
      "iso-ir-17",
      "ISO646-ES",
      "csISO17Spanish",
    ]
  )

  /// IANA Characater Set `DIN_66003`
  static let din66003 = IANACharset(
    preferredMIMEName: nil,
    name: "DIN_66003",
    aliases: [
      "iso-ir-21",
      "de",
      "ISO646-DE",
      "csISO21German",
    ]
  )

  /// IANA Characater Set `NS_4551-1`
  static let ns45511 = IANACharset(
    preferredMIMEName: nil,
    name: "NS_4551-1",
    aliases: [
      "iso-ir-60",
      "ISO646-NO",
      "no",
      "csISO60DanishNorwegian",
      "csISO60Norwegian1",
    ]
  )

  /// IANA Characater Set `NF_Z_62-010`
  static let nfZ62010 = IANACharset(
    preferredMIMEName: nil,
    name: "NF_Z_62-010",
    aliases: [
      "iso-ir-69",
      "ISO646-FR",
      "fr",
      "csISO69French",
    ]
  )

  /// IANA Characater Set `ISO-10646-UTF-1`
  static let iso10646UTF1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-UTF-1",
    aliases: [
      "csISO10646UTF1",
    ]
  )

  /// IANA Characater Set `ISO_646.basic:1983`
  static let iso646Basic1983 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_646.basic:1983",
    aliases: [
      "ref",
      "csISO646basic1983",
    ]
  )

  /// IANA Characater Set `INVARIANT`
  static let invariant = IANACharset(
    preferredMIMEName: nil,
    name: "INVARIANT",
    aliases: [
      "csINVARIANT",
    ]
  )

  /// IANA Characater Set `ISO_646.irv:1983`
  static let iso646Irv1983 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_646.irv:1983",
    aliases: [
      "iso-ir-2",
      "irv",
      "csISO2IntlRefVersion",
    ]
  )

  /// IANA Characater Set `NATS-SEFI`
  static let natsSEFI = IANACharset(
    preferredMIMEName: nil,
    name: "NATS-SEFI",
    aliases: [
      "iso-ir-8-1",
      "csNATSSEFI",
    ]
  )

  /// IANA Characater Set `NATS-SEFI-ADD`
  static let natsSEFIADD = IANACharset(
    preferredMIMEName: nil,
    name: "NATS-SEFI-ADD",
    aliases: [
      "iso-ir-8-2",
      "csNATSSEFIADD",
    ]
  )

  /// IANA Characater Set `NATS-DANO`
  static let natsDANO = IANACharset(
    preferredMIMEName: nil,
    name: "NATS-DANO",
    aliases: [
      "iso-ir-9-1",
      "csNATSDANO",
    ]
  )

  /// IANA Characater Set `NATS-DANO-ADD`
  static let natsDANOADD = IANACharset(
    preferredMIMEName: nil,
    name: "NATS-DANO-ADD",
    aliases: [
      "iso-ir-9-2",
      "csNATSDANOADD",
    ]
  )

  /// IANA Characater Set `SEN_850200_B`
  static let sen850200B = IANACharset(
    preferredMIMEName: nil,
    name: "SEN_850200_B",
    aliases: [
      "iso-ir-10",
      "FI",
      "ISO646-FI",
      "ISO646-SE",
      "se",
      "csISO10Swedish",
    ]
  )

  /// IANA Characater Set `KS_C_5601-1987`
  static let ksC56011987 = IANACharset(
    preferredMIMEName: nil,
    name: "KS_C_5601-1987",
    aliases: [
      "iso-ir-149",
      "KS_C_5601-1989",
      "KSC_5601",
      "korean",
      "csKSC56011987",
    ]
  )

  /// IANA Characater Set `ISO-2022-KR`
  static let iso2022KR = IANACharset(
    preferredMIMEName: "ISO-2022-KR",
    name: "ISO-2022-KR",
    aliases: [
      "csISO2022KR",
    ]
  )

  /// IANA Characater Set `EUC-KR`
  static let eucKR = IANACharset(
    preferredMIMEName: "EUC-KR",
    name: "EUC-KR",
    aliases: [
      "csEUCKR",
    ]
  )

  /// IANA Characater Set `ISO-2022-JP`
  static let iso2022JP = IANACharset(
    preferredMIMEName: "ISO-2022-JP",
    name: "ISO-2022-JP",
    aliases: [
      "csISO2022JP",
    ]
  )

  /// IANA Characater Set `ISO-2022-JP-2`
  static let iso2022JP2 = IANACharset(
    preferredMIMEName: "ISO-2022-JP-2",
    name: "ISO-2022-JP-2",
    aliases: [
      "csISO2022JP2",
    ]
  )

  /// IANA Characater Set `JIS_C6220-1969-jp`
  static let jisC62201969Jp = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6220-1969-jp",
    aliases: [
      "JIS_C6220-1969",
      "iso-ir-13",
      "katakana",
      "x0201-7",
      "csISO13JISC6220jp",
    ]
  )

  /// IANA Characater Set `JIS_C6220-1969-ro`
  static let jisC62201969Ro = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6220-1969-ro",
    aliases: [
      "iso-ir-14",
      "jp",
      "ISO646-JP",
      "csISO14JISC6220ro",
    ]
  )

  /// IANA Characater Set `PT`
  static let pt = IANACharset(
    preferredMIMEName: nil,
    name: "PT",
    aliases: [
      "iso-ir-16",
      "ISO646-PT",
      "csISO16Portuguese",
    ]
  )

  /// IANA Characater Set `greek7-old`
  static let greek7Old = IANACharset(
    preferredMIMEName: nil,
    name: "greek7-old",
    aliases: [
      "iso-ir-18",
      "csISO18Greek7Old",
    ]
  )

  /// IANA Characater Set `latin-greek`
  static let latinGreek = IANACharset(
    preferredMIMEName: nil,
    name: "latin-greek",
    aliases: [
      "iso-ir-19",
      "csISO19LatinGreek",
    ]
  )

  /// IANA Characater Set `NF_Z_62-010_(1973)`
  static let nfZ620101973 = IANACharset(
    preferredMIMEName: nil,
    name: "NF_Z_62-010_(1973)",
    aliases: [
      "iso-ir-25",
      "ISO646-FR1",
      "csISO25French",
    ]
  )

  /// IANA Characater Set `Latin-greek-1`
  static let latinGreek1 = IANACharset(
    preferredMIMEName: nil,
    name: "Latin-greek-1",
    aliases: [
      "iso-ir-27",
      "csISO27LatinGreek1",
    ]
  )

  /// IANA Characater Set `ISO_5427`
  static let iso5427 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_5427",
    aliases: [
      "iso-ir-37",
      "csISO5427Cyrillic",
    ]
  )

  /// IANA Characater Set `JIS_C6226-1978`
  static let jisC62261978 = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6226-1978",
    aliases: [
      "iso-ir-42",
      "csISO42JISC62261978",
    ]
  )

  /// IANA Characater Set `BS_viewdata`
  static let bsViewdata = IANACharset(
    preferredMIMEName: nil,
    name: "BS_viewdata",
    aliases: [
      "iso-ir-47",
      "csISO47BSViewdata",
    ]
  )

  /// IANA Characater Set `INIS`
  static let inis = IANACharset(
    preferredMIMEName: nil,
    name: "INIS",
    aliases: [
      "iso-ir-49",
      "csISO49INIS",
    ]
  )

  /// IANA Characater Set `INIS-8`
  static let inis8 = IANACharset(
    preferredMIMEName: nil,
    name: "INIS-8",
    aliases: [
      "iso-ir-50",
      "csISO50INIS8",
    ]
  )

  /// IANA Characater Set `INIS-cyrillic`
  static let inisCyrillic = IANACharset(
    preferredMIMEName: nil,
    name: "INIS-cyrillic",
    aliases: [
      "iso-ir-51",
      "csISO51INISCyrillic",
    ]
  )

  /// IANA Characater Set `ISO_5427:1981`
  static let iso54271981 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_5427:1981",
    aliases: [
      "iso-ir-54",
      "ISO5427Cyrillic1981",
      "csISO54271981",
    ]
  )

  /// IANA Characater Set `ISO_5428:1980`
  static let iso54281980 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_5428:1980",
    aliases: [
      "iso-ir-55",
      "csISO5428Greek",
    ]
  )

  /// IANA Characater Set `GB_1988-80`
  static let gb198880 = IANACharset(
    preferredMIMEName: nil,
    name: "GB_1988-80",
    aliases: [
      "iso-ir-57",
      "cn",
      "ISO646-CN",
      "csISO57GB1988",
    ]
  )

  /// IANA Characater Set `GB_2312-80`
  static let gb231280 = IANACharset(
    preferredMIMEName: nil,
    name: "GB_2312-80",
    aliases: [
      "iso-ir-58",
      "chinese",
      "csISO58GB231280",
    ]
  )

  /// IANA Characater Set `NS_4551-2`
  static let ns45512 = IANACharset(
    preferredMIMEName: nil,
    name: "NS_4551-2",
    aliases: [
      "ISO646-NO2",
      "iso-ir-61",
      "no2",
      "csISO61Norwegian2",
    ]
  )

  /// IANA Characater Set `videotex-suppl`
  static let videotexSuppl = IANACharset(
    preferredMIMEName: nil,
    name: "videotex-suppl",
    aliases: [
      "iso-ir-70",
      "csISO70VideotexSupp1",
    ]
  )

  /// IANA Characater Set `PT2`
  static let pt2 = IANACharset(
    preferredMIMEName: nil,
    name: "PT2",
    aliases: [
      "iso-ir-84",
      "ISO646-PT2",
      "csISO84Portuguese2",
    ]
  )

  /// IANA Characater Set `ES2`
  static let es2 = IANACharset(
    preferredMIMEName: nil,
    name: "ES2",
    aliases: [
      "iso-ir-85",
      "ISO646-ES2",
      "csISO85Spanish2",
    ]
  )

  /// IANA Characater Set `MSZ_7795.3`
  static let msz77953 = IANACharset(
    preferredMIMEName: nil,
    name: "MSZ_7795.3",
    aliases: [
      "iso-ir-86",
      "ISO646-HU",
      "hu",
      "csISO86Hungarian",
    ]
  )

  /// IANA Characater Set `JIS_C6226-1983`
  static let jisC62261983 = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6226-1983",
    aliases: [
      "iso-ir-87",
      "x0208",
      "JIS_X0208-1983",
      "csISO87JISX0208",
    ]
  )

  /// IANA Characater Set `greek7`
  static let greek7 = IANACharset(
    preferredMIMEName: nil,
    name: "greek7",
    aliases: [
      "iso-ir-88",
      "csISO88Greek7",
    ]
  )

  /// IANA Characater Set `ASMO_449`
  static let asmo449 = IANACharset(
    preferredMIMEName: nil,
    name: "ASMO_449",
    aliases: [
      "ISO_9036",
      "arabic7",
      "iso-ir-89",
      "csISO89ASMO449",
    ]
  )

  /// IANA Characater Set `iso-ir-90`
  static let isoIr90 = IANACharset(
    preferredMIMEName: nil,
    name: "iso-ir-90",
    aliases: [
      "csISO90",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-a`
  static let jisC62291984A = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-a",
    aliases: [
      "iso-ir-91",
      "jp-ocr-a",
      "csISO91JISC62291984a",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-b`
  static let jisC62291984B = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-b",
    aliases: [
      "iso-ir-92",
      "ISO646-JP-OCR-B",
      "jp-ocr-b",
      "csISO92JISC62991984b",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-b-add`
  static let jisC62291984BAdd = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-b-add",
    aliases: [
      "iso-ir-93",
      "jp-ocr-b-add",
      "csISO93JIS62291984badd",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-hand`
  static let jisC62291984Hand = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-hand",
    aliases: [
      "iso-ir-94",
      "jp-ocr-hand",
      "csISO94JIS62291984hand",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-hand-add`
  static let jisC62291984HandAdd = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-hand-add",
    aliases: [
      "iso-ir-95",
      "jp-ocr-hand-add",
      "csISO95JIS62291984handadd",
    ]
  )

  /// IANA Characater Set `JIS_C6229-1984-kana`
  static let jisC62291984Kana = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_C6229-1984-kana",
    aliases: [
      "iso-ir-96",
      "csISO96JISC62291984kana",
    ]
  )

  /// IANA Characater Set `ISO_2033-1983`
  static let iso20331983 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_2033-1983",
    aliases: [
      "iso-ir-98",
      "e13b",
      "csISO2033",
    ]
  )

  /// IANA Characater Set `ANSI_X3.110-1983`
  static let ansiX31101983 = IANACharset(
    preferredMIMEName: nil,
    name: "ANSI_X3.110-1983",
    aliases: [
      "iso-ir-99",
      "CSA_T500-1983",
      "NAPLPS",
      "csISO99NAPLPS",
    ]
  )

  /// IANA Characater Set `T.61-7bit`
  static let t617Bit = IANACharset(
    preferredMIMEName: nil,
    name: "T.61-7bit",
    aliases: [
      "iso-ir-102",
      "csISO102T617bit",
    ]
  )

  /// IANA Characater Set `T.61-8bit`
  static let t618Bit = IANACharset(
    preferredMIMEName: nil,
    name: "T.61-8bit",
    aliases: [
      "T.61",
      "iso-ir-103",
      "csISO103T618bit",
    ]
  )

  /// IANA Characater Set `ECMA-cyrillic`
  static let ecmaCyrillic = IANACharset(
    preferredMIMEName: nil,
    name: "ECMA-cyrillic",
    aliases: [
      "iso-ir-111",
      "KOI8-E",
      "csISO111ECMACyrillic",
    ]
  )

  /// IANA Characater Set `CSA_Z243.4-1985-1`
  static let csaZ243419851 = IANACharset(
    preferredMIMEName: nil,
    name: "CSA_Z243.4-1985-1",
    aliases: [
      "iso-ir-121",
      "ISO646-CA",
      "csa7-1",
      "csa71",
      "ca",
      "csISO121Canadian1",
    ]
  )

  /// IANA Characater Set `CSA_Z243.4-1985-2`
  static let csaZ243419852 = IANACharset(
    preferredMIMEName: nil,
    name: "CSA_Z243.4-1985-2",
    aliases: [
      "iso-ir-122",
      "ISO646-CA2",
      "csa7-2",
      "csa72",
      "csISO122Canadian2",
    ]
  )

  /// IANA Characater Set `CSA_Z243.4-1985-gr`
  static let csaZ24341985Gr = IANACharset(
    preferredMIMEName: nil,
    name: "CSA_Z243.4-1985-gr",
    aliases: [
      "iso-ir-123",
      "csISO123CSAZ24341985gr",
    ]
  )

  /// IANA Characater Set `ISO-8859-6-E`
  static let iso88596E = IANACharset(
    preferredMIMEName: "ISO-8859-6-E",
    name: "ISO_8859-6-E",
    aliases: [
      "csISO88596E",
      "ISO-8859-6-E",
    ]
  )

  /// IANA Characater Set `ISO-8859-6-I`
  static let iso88596I = IANACharset(
    preferredMIMEName: "ISO-8859-6-I",
    name: "ISO_8859-6-I",
    aliases: [
      "csISO88596I",
      "ISO-8859-6-I",
    ]
  )

  /// IANA Characater Set `T.101-G2`
  static let t101G2 = IANACharset(
    preferredMIMEName: nil,
    name: "T.101-G2",
    aliases: [
      "iso-ir-128",
      "csISO128T101G2",
    ]
  )

  /// IANA Characater Set `ISO-8859-8-E`
  static let iso88598E = IANACharset(
    preferredMIMEName: "ISO-8859-8-E",
    name: "ISO_8859-8-E",
    aliases: [
      "csISO88598E",
      "ISO-8859-8-E",
    ]
  )

  /// IANA Characater Set `ISO-8859-8-I`
  static let iso88598I = IANACharset(
    preferredMIMEName: "ISO-8859-8-I",
    name: "ISO_8859-8-I",
    aliases: [
      "csISO88598I",
      "ISO-8859-8-I",
    ]
  )

  /// IANA Characater Set `CSN_369103`
  static let csn369103 = IANACharset(
    preferredMIMEName: nil,
    name: "CSN_369103",
    aliases: [
      "iso-ir-139",
      "csISO139CSN369103",
    ]
  )

  /// IANA Characater Set `JUS_I.B1.002`
  static let jusIB1002 = IANACharset(
    preferredMIMEName: nil,
    name: "JUS_I.B1.002",
    aliases: [
      "iso-ir-141",
      "ISO646-YU",
      "js",
      "yu",
      "csISO141JUSIB1002",
    ]
  )

  /// IANA Characater Set `IEC_P27-1`
  static let iecP271 = IANACharset(
    preferredMIMEName: nil,
    name: "IEC_P27-1",
    aliases: [
      "iso-ir-143",
      "csISO143IECP271",
    ]
  )

  /// IANA Characater Set `JUS_I.B1.003-serb`
  static let jusIB1003Serb = IANACharset(
    preferredMIMEName: nil,
    name: "JUS_I.B1.003-serb",
    aliases: [
      "iso-ir-146",
      "serbian",
      "csISO146Serbian",
    ]
  )

  /// IANA Characater Set `JUS_I.B1.003-mac`
  static let jusIB1003Mac = IANACharset(
    preferredMIMEName: nil,
    name: "JUS_I.B1.003-mac",
    aliases: [
      "macedonian",
      "iso-ir-147",
      "csISO147Macedonian",
    ]
  )

  /// IANA Characater Set `greek-ccitt`
  static let greekCcitt = IANACharset(
    preferredMIMEName: nil,
    name: "greek-ccitt",
    aliases: [
      "iso-ir-150",
      "csISO150",
      "csISO150GreekCCITT",
    ]
  )

  /// IANA Characater Set `NC_NC00-10:81`
  static let ncNC001081 = IANACharset(
    preferredMIMEName: nil,
    name: "NC_NC00-10:81",
    aliases: [
      "cuba",
      "iso-ir-151",
      "ISO646-CU",
      "csISO151Cuba",
    ]
  )

  /// IANA Characater Set `ISO_6937-2-25`
  static let iso6937225 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_6937-2-25",
    aliases: [
      "iso-ir-152",
      "csISO6937Add",
    ]
  )

  /// IANA Characater Set `GOST_19768-74`
  static let gost1976874 = IANACharset(
    preferredMIMEName: nil,
    name: "GOST_19768-74",
    aliases: [
      "ST_SEV_358-88",
      "iso-ir-153",
      "csISO153GOST1976874",
    ]
  )

  /// IANA Characater Set `ISO_8859-supp`
  static let iso8859Supp = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_8859-supp",
    aliases: [
      "iso-ir-154",
      "latin1-2-5",
      "csISO8859Supp",
    ]
  )

  /// IANA Characater Set `ISO_10367-box`
  static let iso10367Box = IANACharset(
    preferredMIMEName: nil,
    name: "ISO_10367-box",
    aliases: [
      "iso-ir-155",
      "csISO10367Box",
    ]
  )

  /// IANA Characater Set `latin-lap`
  static let latinLap = IANACharset(
    preferredMIMEName: nil,
    name: "latin-lap",
    aliases: [
      "lap",
      "iso-ir-158",
      "csISO158Lap",
    ]
  )

  /// IANA Characater Set `JIS_X0212-1990`
  static let jisX02121990 = IANACharset(
    preferredMIMEName: nil,
    name: "JIS_X0212-1990",
    aliases: [
      "x0212",
      "iso-ir-159",
      "csISO159JISX02121990",
    ]
  )

  /// IANA Characater Set `DS_2089`
  static let ds2089 = IANACharset(
    preferredMIMEName: nil,
    name: "DS_2089",
    aliases: [
      "DS2089",
      "ISO646-DK",
      "dk",
      "csISO646Danish",
    ]
  )

  /// IANA Characater Set `us-dk`
  static let usDk = IANACharset(
    preferredMIMEName: nil,
    name: "us-dk",
    aliases: [
      "csUSDK",
    ]
  )

  /// IANA Characater Set `dk-us`
  static let dkUs = IANACharset(
    preferredMIMEName: nil,
    name: "dk-us",
    aliases: [
      "csDKUS",
    ]
  )

  /// IANA Characater Set `KSC5636`
  static let ksc5636 = IANACharset(
    preferredMIMEName: nil,
    name: "KSC5636",
    aliases: [
      "ISO646-KR",
      "csKSC5636",
    ]
  )

  /// IANA Characater Set `UNICODE-1-1-UTF-7`
  static let unicode11UTF7 = IANACharset(
    preferredMIMEName: nil,
    name: "UNICODE-1-1-UTF-7",
    aliases: [
      "csUnicode11UTF7",
    ]
  )

  /// IANA Characater Set `ISO-2022-CN`
  static let iso2022CN = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-2022-CN",
    aliases: [
      "csISO2022CN",
    ]
  )

  /// IANA Characater Set `ISO-2022-CN-EXT`
  static let iso2022CNEXT = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-2022-CN-EXT",
    aliases: [
      "csISO2022CNEXT",
    ]
  )

  /// IANA Characater Set `UTF-8`
  static let utf8 = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-8",
    aliases: [
      "csUTF8",
    ]
  )

  /// IANA Characater Set `ISO-8859-13`
  static let iso885913 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-13",
    aliases: [
      "csISO885913",
    ]
  )

  /// IANA Characater Set `ISO-8859-14`
  static let iso885914 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-14",
    aliases: [
      "iso-ir-199",
      "ISO_8859-14:1998",
      "ISO_8859-14",
      "latin8",
      "iso-celtic",
      "l8",
      "csISO885914",
    ]
  )

  /// IANA Characater Set `ISO-8859-15`
  static let iso885915 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-15",
    aliases: [
      "ISO_8859-15",
      "Latin-9",
      "csISO885915",
    ]
  )

  /// IANA Characater Set `ISO-8859-16`
  static let iso885916 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-16",
    aliases: [
      "iso-ir-226",
      "ISO_8859-16:2001",
      "ISO_8859-16",
      "latin10",
      "l10",
      "csISO885916",
    ]
  )

  /// IANA Characater Set `GBK`
  static let gbk = IANACharset(
    preferredMIMEName: nil,
    name: "GBK",
    aliases: [
      "CP936",
      "MS936",
      "windows-936",
      "csGBK",
    ]
  )

  /// IANA Characater Set `GB18030`
  static let gb18030 = IANACharset(
    preferredMIMEName: nil,
    name: "GB18030",
    aliases: [
      "csGB18030",
    ]
  )

  /// IANA Characater Set `OSD_EBCDIC_DF04_15`
  static let osdEBCDICDF0415 = IANACharset(
    preferredMIMEName: nil,
    name: "OSD_EBCDIC_DF04_15",
    aliases: [
      "csOSDEBCDICDF0415",
    ]
  )

  /// IANA Characater Set `OSD_EBCDIC_DF03_IRV`
  static let osdEBCDICDF03IRV = IANACharset(
    preferredMIMEName: nil,
    name: "OSD_EBCDIC_DF03_IRV",
    aliases: [
      "csOSDEBCDICDF03IRV",
    ]
  )

  /// IANA Characater Set `OSD_EBCDIC_DF04_1`
  static let osdEBCDICDF041 = IANACharset(
    preferredMIMEName: nil,
    name: "OSD_EBCDIC_DF04_1",
    aliases: [
      "csOSDEBCDICDF041",
    ]
  )

  /// IANA Characater Set `ISO-11548-1`
  static let iso115481 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-11548-1",
    aliases: [
      "ISO_11548-1",
      "ISO_TR_11548-1",
      "csISO115481",
    ]
  )

  /// IANA Characater Set `KZ-1048`
  static let kz1048 = IANACharset(
    preferredMIMEName: nil,
    name: "KZ-1048",
    aliases: [
      "STRK1048-2002",
      "RK1048",
      "csKZ1048",
    ]
  )

  /// IANA Characater Set `ISO-10646-UCS-2`
  static let iso10646UCS2 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-UCS-2",
    aliases: [
      "csUnicode",
    ]
  )

  /// IANA Characater Set `ISO-10646-UCS-4`
  static let iso10646UCS4 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-UCS-4",
    aliases: [
      "csUCS4",
    ]
  )

  /// IANA Characater Set `ISO-10646-UCS-Basic`
  static let iso10646UCSBasic = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-UCS-Basic",
    aliases: [
      "csUnicodeASCII",
    ]
  )

  /// IANA Characater Set `ISO-10646-Unicode-Latin1`
  static let iso10646UnicodeLatin1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-Unicode-Latin1",
    aliases: [
      "csUnicodeLatin1",
      "ISO-10646",
    ]
  )

  /// IANA Characater Set `ISO-10646-J-1`
  static let iso10646J1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-10646-J-1",
    aliases: [
      "csUnicodeJapanese",
    ]
  )

  /// IANA Characater Set `ISO-Unicode-IBM-1261`
  static let isoUnicodeIBM1261 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-Unicode-IBM-1261",
    aliases: [
      "csUnicodeIBM1261",
    ]
  )

  /// IANA Characater Set `ISO-Unicode-IBM-1268`
  static let isoUnicodeIBM1268 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-Unicode-IBM-1268",
    aliases: [
      "csUnicodeIBM1268",
    ]
  )

  /// IANA Characater Set `ISO-Unicode-IBM-1276`
  static let isoUnicodeIBM1276 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-Unicode-IBM-1276",
    aliases: [
      "csUnicodeIBM1276",
    ]
  )

  /// IANA Characater Set `ISO-Unicode-IBM-1264`
  static let isoUnicodeIBM1264 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-Unicode-IBM-1264",
    aliases: [
      "csUnicodeIBM1264",
    ]
  )

  /// IANA Characater Set `ISO-Unicode-IBM-1265`
  static let isoUnicodeIBM1265 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-Unicode-IBM-1265",
    aliases: [
      "csUnicodeIBM1265",
    ]
  )

  /// IANA Characater Set `UNICODE-1-1`
  static let unicode11 = IANACharset(
    preferredMIMEName: nil,
    name: "UNICODE-1-1",
    aliases: [
      "csUnicode11",
    ]
  )

  /// IANA Characater Set `SCSU`
  static let scsu = IANACharset(
    preferredMIMEName: nil,
    name: "SCSU",
    aliases: [
      "csSCSU",
    ]
  )

  /// IANA Characater Set `UTF-7`
  static let utf7 = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-7",
    aliases: [
      "csUTF7",
    ]
  )

  /// IANA Characater Set `UTF-16BE`
  static let utf16BE = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-16BE",
    aliases: [
      "csUTF16BE",
    ]
  )

  /// IANA Characater Set `UTF-16LE`
  static let utf16LE = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-16LE",
    aliases: [
      "csUTF16LE",
    ]
  )

  /// IANA Characater Set `UTF-16`
  static let utf16 = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-16",
    aliases: [
      "csUTF16",
    ]
  )

  /// IANA Characater Set `CESU-8`
  static let cesu8 = IANACharset(
    preferredMIMEName: nil,
    name: "CESU-8",
    aliases: [
      "csCESU8",
      "csCESU-8",
    ]
  )

  /// IANA Characater Set `UTF-32`
  static let utf32 = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-32",
    aliases: [
      "csUTF32",
    ]
  )

  /// IANA Characater Set `UTF-32BE`
  static let utf32BE = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-32BE",
    aliases: [
      "csUTF32BE",
    ]
  )

  /// IANA Characater Set `UTF-32LE`
  static let utf32LE = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-32LE",
    aliases: [
      "csUTF32LE",
    ]
  )

  /// IANA Characater Set `BOCU-1`
  static let bocu1 = IANACharset(
    preferredMIMEName: nil,
    name: "BOCU-1",
    aliases: [
      "csBOCU1",
      "csBOCU-1",
    ]
  )

  /// IANA Characater Set `UTF-7-IMAP`
  static let utf7IMAP = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-7-IMAP",
    aliases: [
      "csUTF7IMAP",
    ]
  )

  /// IANA Characater Set `ISO-8859-1-Windows-3.0-Latin-1`
  static let iso88591Windows30Latin1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-1-Windows-3.0-Latin-1",
    aliases: [
      "csWindows30Latin1",
    ]
  )

  /// IANA Characater Set `ISO-8859-1-Windows-3.1-Latin-1`
  static let iso88591Windows31Latin1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-1-Windows-3.1-Latin-1",
    aliases: [
      "csWindows31Latin1",
    ]
  )

  /// IANA Characater Set `ISO-8859-2-Windows-Latin-2`
  static let iso88592WindowsLatin2 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-2-Windows-Latin-2",
    aliases: [
      "csWindows31Latin2",
    ]
  )

  /// IANA Characater Set `ISO-8859-9-Windows-Latin-5`
  static let iso88599WindowsLatin5 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-9-Windows-Latin-5",
    aliases: [
      "csWindows31Latin5",
    ]
  )

  /// IANA Characater Set `hp-roman8`
  static let hpRoman8 = IANACharset(
    preferredMIMEName: nil,
    name: "hp-roman8",
    aliases: [
      "roman8",
      "r8",
      "csHPRoman8",
    ]
  )

  /// IANA Characater Set `Adobe-Standard-Encoding`
  static let adobeStandardEncoding = IANACharset(
    preferredMIMEName: nil,
    name: "Adobe-Standard-Encoding",
    aliases: [
      "csAdobeStandardEncoding",
    ]
  )

  /// IANA Characater Set `Ventura-US`
  static let venturaUS = IANACharset(
    preferredMIMEName: nil,
    name: "Ventura-US",
    aliases: [
      "csVenturaUS",
    ]
  )

  /// IANA Characater Set `Ventura-International`
  static let venturaInternational = IANACharset(
    preferredMIMEName: nil,
    name: "Ventura-International",
    aliases: [
      "csVenturaInternational",
    ]
  )

  /// IANA Characater Set `DEC-MCS`
  static let decMCS = IANACharset(
    preferredMIMEName: nil,
    name: "DEC-MCS",
    aliases: [
      "dec",
      "csDECMCS",
    ]
  )

  /// IANA Characater Set `IBM850`
  static let ibm850 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM850",
    aliases: [
      "cp850",
      "850",
      "csPC850Multilingual",
    ]
  )

  /// IANA Characater Set `PC8-Danish-Norwegian`
  static let pc8DanishNorwegian = IANACharset(
    preferredMIMEName: nil,
    name: "PC8-Danish-Norwegian",
    aliases: [
      "csPC8DanishNorwegian",
    ]
  )

  /// IANA Characater Set `IBM862`
  static let ibm862 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM862",
    aliases: [
      "cp862",
      "862",
      "csPC862LatinHebrew",
    ]
  )

  /// IANA Characater Set `PC8-Turkish`
  static let pc8Turkish = IANACharset(
    preferredMIMEName: nil,
    name: "PC8-Turkish",
    aliases: [
      "csPC8Turkish",
    ]
  )

  /// IANA Characater Set `IBM-Symbols`
  static let ibmSymbols = IANACharset(
    preferredMIMEName: nil,
    name: "IBM-Symbols",
    aliases: [
      "csIBMSymbols",
    ]
  )

  /// IANA Characater Set `IBM-Thai`
  static let ibmThai = IANACharset(
    preferredMIMEName: nil,
    name: "IBM-Thai",
    aliases: [
      "csIBMThai",
    ]
  )

  /// IANA Characater Set `HP-Legal`
  static let hpLegal = IANACharset(
    preferredMIMEName: nil,
    name: "HP-Legal",
    aliases: [
      "csHPLegal",
    ]
  )

  /// IANA Characater Set `HP-Pi-font`
  static let hpPiFont = IANACharset(
    preferredMIMEName: nil,
    name: "HP-Pi-font",
    aliases: [
      "csHPPiFont",
    ]
  )

  /// IANA Characater Set `HP-Math8`
  static let hpMath8 = IANACharset(
    preferredMIMEName: nil,
    name: "HP-Math8",
    aliases: [
      "csHPMath8",
    ]
  )

  /// IANA Characater Set `Adobe-Symbol-Encoding`
  static let adobeSymbolEncoding = IANACharset(
    preferredMIMEName: nil,
    name: "Adobe-Symbol-Encoding",
    aliases: [
      "csHPPSMath",
    ]
  )

  /// IANA Characater Set `HP-DeskTop`
  static let hpDeskTop = IANACharset(
    preferredMIMEName: nil,
    name: "HP-DeskTop",
    aliases: [
      "csHPDesktop",
    ]
  )

  /// IANA Characater Set `Ventura-Math`
  static let venturaMath = IANACharset(
    preferredMIMEName: nil,
    name: "Ventura-Math",
    aliases: [
      "csVenturaMath",
    ]
  )

  /// IANA Characater Set `Microsoft-Publishing`
  static let microsoftPublishing = IANACharset(
    preferredMIMEName: nil,
    name: "Microsoft-Publishing",
    aliases: [
      "csMicrosoftPublishing",
    ]
  )

  /// IANA Characater Set `Windows-31J`
  static let windows31J = IANACharset(
    preferredMIMEName: nil,
    name: "Windows-31J",
    aliases: [
      "csWindows31J",
    ]
  )

  /// IANA Characater Set `GB2312`
  static let gb2312 = IANACharset(
    preferredMIMEName: "GB2312",
    name: "GB2312",
    aliases: [
      "csGB2312",
    ]
  )

  /// IANA Characater Set `Big5`
  static let big5 = IANACharset(
    preferredMIMEName: "Big5",
    name: "Big5",
    aliases: [
      "csBig5",
    ]
  )

  /// IANA Characater Set `macintosh`
  static let macintosh = IANACharset(
    preferredMIMEName: nil,
    name: "macintosh",
    aliases: [
      "mac",
      "csMacintosh",
    ]
  )

  /// IANA Characater Set `IBM037`
  static let ibm037 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM037",
    aliases: [
      "cp037",
      "ebcdic-cp-us",
      "ebcdic-cp-ca",
      "ebcdic-cp-wt",
      "ebcdic-cp-nl",
      "csIBM037",
    ]
  )

  /// IANA Characater Set `IBM038`
  static let ibm038 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM038",
    aliases: [
      "EBCDIC-INT",
      "cp038",
      "csIBM038",
    ]
  )

  /// IANA Characater Set `IBM273`
  static let ibm273 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM273",
    aliases: [
      "CP273",
      "csIBM273",
    ]
  )

  /// IANA Characater Set `IBM274`
  static let ibm274 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM274",
    aliases: [
      "EBCDIC-BE",
      "CP274",
      "csIBM274",
    ]
  )

  /// IANA Characater Set `IBM275`
  static let ibm275 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM275",
    aliases: [
      "EBCDIC-BR",
      "cp275",
      "csIBM275",
    ]
  )

  /// IANA Characater Set `IBM277`
  static let ibm277 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM277",
    aliases: [
      "EBCDIC-CP-DK",
      "EBCDIC-CP-NO",
      "csIBM277",
    ]
  )

  /// IANA Characater Set `IBM278`
  static let ibm278 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM278",
    aliases: [
      "CP278",
      "ebcdic-cp-fi",
      "ebcdic-cp-se",
      "csIBM278",
    ]
  )

  /// IANA Characater Set `IBM280`
  static let ibm280 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM280",
    aliases: [
      "CP280",
      "ebcdic-cp-it",
      "csIBM280",
    ]
  )

  /// IANA Characater Set `IBM281`
  static let ibm281 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM281",
    aliases: [
      "EBCDIC-JP-E",
      "cp281",
      "csIBM281",
    ]
  )

  /// IANA Characater Set `IBM284`
  static let ibm284 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM284",
    aliases: [
      "CP284",
      "ebcdic-cp-es",
      "csIBM284",
    ]
  )

  /// IANA Characater Set `IBM285`
  static let ibm285 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM285",
    aliases: [
      "CP285",
      "ebcdic-cp-gb",
      "csIBM285",
    ]
  )

  /// IANA Characater Set `IBM290`
  static let ibm290 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM290",
    aliases: [
      "cp290",
      "EBCDIC-JP-kana",
      "csIBM290",
    ]
  )

  /// IANA Characater Set `IBM297`
  static let ibm297 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM297",
    aliases: [
      "cp297",
      "ebcdic-cp-fr",
      "csIBM297",
    ]
  )

  /// IANA Characater Set `IBM420`
  static let ibm420 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM420",
    aliases: [
      "cp420",
      "ebcdic-cp-ar1",
      "csIBM420",
    ]
  )

  /// IANA Characater Set `IBM423`
  static let ibm423 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM423",
    aliases: [
      "cp423",
      "ebcdic-cp-gr",
      "csIBM423",
    ]
  )

  /// IANA Characater Set `IBM424`
  static let ibm424 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM424",
    aliases: [
      "cp424",
      "ebcdic-cp-he",
      "csIBM424",
    ]
  )

  /// IANA Characater Set `IBM437`
  static let ibm437 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM437",
    aliases: [
      "cp437",
      "437",
      "csPC8CodePage437",
    ]
  )

  /// IANA Characater Set `IBM500`
  static let ibm500 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM500",
    aliases: [
      "CP500",
      "ebcdic-cp-be",
      "ebcdic-cp-ch",
      "csIBM500",
    ]
  )

  /// IANA Characater Set `IBM851`
  static let ibm851 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM851",
    aliases: [
      "cp851",
      "851",
      "csIBM851",
    ]
  )

  /// IANA Characater Set `IBM852`
  static let ibm852 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM852",
    aliases: [
      "cp852",
      "852",
      "csPCp852",
    ]
  )

  /// IANA Characater Set `IBM855`
  static let ibm855 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM855",
    aliases: [
      "cp855",
      "855",
      "csIBM855",
    ]
  )

  /// IANA Characater Set `IBM857`
  static let ibm857 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM857",
    aliases: [
      "cp857",
      "857",
      "csIBM857",
    ]
  )

  /// IANA Characater Set `IBM860`
  static let ibm860 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM860",
    aliases: [
      "cp860",
      "860",
      "csIBM860",
    ]
  )

  /// IANA Characater Set `IBM861`
  static let ibm861 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM861",
    aliases: [
      "cp861",
      "861",
      "cp-is",
      "csIBM861",
    ]
  )

  /// IANA Characater Set `IBM863`
  static let ibm863 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM863",
    aliases: [
      "cp863",
      "863",
      "csIBM863",
    ]
  )

  /// IANA Characater Set `IBM864`
  static let ibm864 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM864",
    aliases: [
      "cp864",
      "csIBM864",
    ]
  )

  /// IANA Characater Set `IBM865`
  static let ibm865 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM865",
    aliases: [
      "cp865",
      "865",
      "csIBM865",
    ]
  )

  /// IANA Characater Set `IBM868`
  static let ibm868 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM868",
    aliases: [
      "CP868",
      "cp-ar",
      "csIBM868",
    ]
  )

  /// IANA Characater Set `IBM869`
  static let ibm869 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM869",
    aliases: [
      "cp869",
      "869",
      "cp-gr",
      "csIBM869",
    ]
  )

  /// IANA Characater Set `IBM870`
  static let ibm870 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM870",
    aliases: [
      "CP870",
      "ebcdic-cp-roece",
      "ebcdic-cp-yu",
      "csIBM870",
    ]
  )

  /// IANA Characater Set `IBM871`
  static let ibm871 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM871",
    aliases: [
      "CP871",
      "ebcdic-cp-is",
      "csIBM871",
    ]
  )

  /// IANA Characater Set `IBM880`
  static let ibm880 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM880",
    aliases: [
      "cp880",
      "EBCDIC-Cyrillic",
      "csIBM880",
    ]
  )

  /// IANA Characater Set `IBM891`
  static let ibm891 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM891",
    aliases: [
      "cp891",
      "csIBM891",
    ]
  )

  /// IANA Characater Set `IBM903`
  static let ibm903 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM903",
    aliases: [
      "cp903",
      "csIBM903",
    ]
  )

  /// IANA Characater Set `IBM904`
  static let ibm904 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM904",
    aliases: [
      "cp904",
      "904",
      "csIBBM904",
    ]
  )

  /// IANA Characater Set `IBM905`
  static let ibm905 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM905",
    aliases: [
      "CP905",
      "ebcdic-cp-tr",
      "csIBM905",
    ]
  )

  /// IANA Characater Set `IBM918`
  static let ibm918 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM918",
    aliases: [
      "CP918",
      "ebcdic-cp-ar2",
      "csIBM918",
    ]
  )

  /// IANA Characater Set `IBM1026`
  static let ibm1026 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM1026",
    aliases: [
      "CP1026",
      "csIBM1026",
    ]
  )

  /// IANA Characater Set `EBCDIC-AT-DE`
  static let ebcdicATDE = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-AT-DE",
    aliases: [
      "csIBMEBCDICATDE",
    ]
  )

  /// IANA Characater Set `EBCDIC-AT-DE-A`
  static let ebcdicATDEA = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-AT-DE-A",
    aliases: [
      "csEBCDICATDEA",
    ]
  )

  /// IANA Characater Set `EBCDIC-CA-FR`
  static let ebcdicCAFR = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-CA-FR",
    aliases: [
      "csEBCDICCAFR",
    ]
  )

  /// IANA Characater Set `EBCDIC-DK-NO`
  static let ebcdicDKNO = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-DK-NO",
    aliases: [
      "csEBCDICDKNO",
    ]
  )

  /// IANA Characater Set `EBCDIC-DK-NO-A`
  static let ebcdicDKNOA = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-DK-NO-A",
    aliases: [
      "csEBCDICDKNOA",
    ]
  )

  /// IANA Characater Set `EBCDIC-FI-SE`
  static let ebcdicFISE = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-FI-SE",
    aliases: [
      "csEBCDICFISE",
    ]
  )

  /// IANA Characater Set `EBCDIC-FI-SE-A`
  static let ebcdicFISEA = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-FI-SE-A",
    aliases: [
      "csEBCDICFISEA",
    ]
  )

  /// IANA Characater Set `EBCDIC-FR`
  static let ebcdicFR = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-FR",
    aliases: [
      "csEBCDICFR",
    ]
  )

  /// IANA Characater Set `EBCDIC-IT`
  static let ebcdicIT = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-IT",
    aliases: [
      "csEBCDICIT",
    ]
  )

  /// IANA Characater Set `EBCDIC-PT`
  static let ebcdicPT = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-PT",
    aliases: [
      "csEBCDICPT",
    ]
  )

  /// IANA Characater Set `EBCDIC-ES`
  static let ebcdicES = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-ES",
    aliases: [
      "csEBCDICES",
    ]
  )

  /// IANA Characater Set `EBCDIC-ES-A`
  static let ebcdicESA = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-ES-A",
    aliases: [
      "csEBCDICESA",
    ]
  )

  /// IANA Characater Set `EBCDIC-ES-S`
  static let ebcdicESS = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-ES-S",
    aliases: [
      "csEBCDICESS",
    ]
  )

  /// IANA Characater Set `EBCDIC-UK`
  static let ebcdicUK = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-UK",
    aliases: [
      "csEBCDICUK",
    ]
  )

  /// IANA Characater Set `EBCDIC-US`
  static let ebcdicUS = IANACharset(
    preferredMIMEName: nil,
    name: "EBCDIC-US",
    aliases: [
      "csEBCDICUS",
    ]
  )

  /// IANA Characater Set `UNKNOWN-8BIT`
  static let unknown8BIT = IANACharset(
    preferredMIMEName: nil,
    name: "UNKNOWN-8BIT",
    aliases: [
      "csUnknown8BiT",
    ]
  )

  /// IANA Characater Set `MNEMONIC`
  static let mnemonic = IANACharset(
    preferredMIMEName: nil,
    name: "MNEMONIC",
    aliases: [
      "csMnemonic",
    ]
  )

  /// IANA Characater Set `MNEM`
  static let mnem = IANACharset(
    preferredMIMEName: nil,
    name: "MNEM",
    aliases: [
      "csMnem",
    ]
  )

  /// IANA Characater Set `VISCII`
  static let viscii = IANACharset(
    preferredMIMEName: nil,
    name: "VISCII",
    aliases: [
      "csVISCII",
    ]
  )

  /// IANA Characater Set `VIQR`
  static let viqr = IANACharset(
    preferredMIMEName: nil,
    name: "VIQR",
    aliases: [
      "csVIQR",
    ]
  )

  /// IANA Characater Set `KOI8-R`
  static let koi8R = IANACharset(
    preferredMIMEName: "KOI8-R",
    name: "KOI8-R",
    aliases: [
      "csKOI8R",
    ]
  )

  /// IANA Characater Set `HZ-GB-2312`
  static let hzGB2312 = IANACharset(
    preferredMIMEName: nil,
    name: "HZ-GB-2312",
    aliases: [
    ]
  )

  /// IANA Characater Set `IBM866`
  static let ibm866 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM866",
    aliases: [
      "cp866",
      "866",
      "csIBM866",
    ]
  )

  /// IANA Characater Set `IBM775`
  static let ibm775 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM775",
    aliases: [
      "cp775",
      "csPC775Baltic",
    ]
  )

  /// IANA Characater Set `KOI8-U`
  static let koi8U = IANACharset(
    preferredMIMEName: nil,
    name: "KOI8-U",
    aliases: [
      "csKOI8U",
    ]
  )

  /// IANA Characater Set `IBM00858`
  static let ibm00858 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM00858",
    aliases: [
      "CCSID00858",
      "CP00858",
      "PC-Multilingual-850+euro",
      "csIBM00858",
    ]
  )

  /// IANA Characater Set `IBM00924`
  static let ibm00924 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM00924",
    aliases: [
      "CCSID00924",
      "CP00924",
      "ebcdic-Latin9--euro",
      "csIBM00924",
    ]
  )

  /// IANA Characater Set `IBM01140`
  static let ibm01140 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01140",
    aliases: [
      "CCSID01140",
      "CP01140",
      "ebcdic-us-37+euro",
      "csIBM01140",
    ]
  )

  /// IANA Characater Set `IBM01141`
  static let ibm01141 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01141",
    aliases: [
      "CCSID01141",
      "CP01141",
      "ebcdic-de-273+euro",
      "csIBM01141",
    ]
  )

  /// IANA Characater Set `IBM01142`
  static let ibm01142 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01142",
    aliases: [
      "CCSID01142",
      "CP01142",
      "ebcdic-dk-277+euro",
      "ebcdic-no-277+euro",
      "csIBM01142",
    ]
  )

  /// IANA Characater Set `IBM01143`
  static let ibm01143 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01143",
    aliases: [
      "CCSID01143",
      "CP01143",
      "ebcdic-fi-278+euro",
      "ebcdic-se-278+euro",
      "csIBM01143",
    ]
  )

  /// IANA Characater Set `IBM01144`
  static let ibm01144 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01144",
    aliases: [
      "CCSID01144",
      "CP01144",
      "ebcdic-it-280+euro",
      "csIBM01144",
    ]
  )

  /// IANA Characater Set `IBM01145`
  static let ibm01145 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01145",
    aliases: [
      "CCSID01145",
      "CP01145",
      "ebcdic-es-284+euro",
      "csIBM01145",
    ]
  )

  /// IANA Characater Set `IBM01146`
  static let ibm01146 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01146",
    aliases: [
      "CCSID01146",
      "CP01146",
      "ebcdic-gb-285+euro",
      "csIBM01146",
    ]
  )

  /// IANA Characater Set `IBM01147`
  static let ibm01147 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01147",
    aliases: [
      "CCSID01147",
      "CP01147",
      "ebcdic-fr-297+euro",
      "csIBM01147",
    ]
  )

  /// IANA Characater Set `IBM01148`
  static let ibm01148 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01148",
    aliases: [
      "CCSID01148",
      "CP01148",
      "ebcdic-international-500+euro",
      "csIBM01148",
    ]
  )

  /// IANA Characater Set `IBM01149`
  static let ibm01149 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM01149",
    aliases: [
      "CCSID01149",
      "CP01149",
      "ebcdic-is-871+euro",
      "csIBM01149",
    ]
  )

  /// IANA Characater Set `Big5-HKSCS`
  static let big5HKSCS = IANACharset(
    preferredMIMEName: nil,
    name: "Big5-HKSCS",
    aliases: [
      "csBig5HKSCS",
    ]
  )

  /// IANA Characater Set `IBM1047`
  static let ibm1047 = IANACharset(
    preferredMIMEName: nil,
    name: "IBM1047",
    aliases: [
      "IBM-1047",
      "csIBM1047",
    ]
  )

  /// IANA Characater Set `PTCP154`
  static let ptcp154 = IANACharset(
    preferredMIMEName: nil,
    name: "PTCP154",
    aliases: [
      "csPTCP154",
      "PT154",
      "CP154",
      "Cyrillic-Asian",
    ]
  )

  /// IANA Characater Set `Amiga-1251`
  static let amiga1251 = IANACharset(
    preferredMIMEName: nil,
    name: "Amiga-1251",
    aliases: [
      "Ami1251",
      "Amiga1251",
      "Ami-1251",
      "csAmiga1251",
    ]
  )

  /// IANA Characater Set `KOI7-switched`
  static let koi7Switched = IANACharset(
    preferredMIMEName: nil,
    name: "KOI7-switched",
    aliases: [
      "csKOI7switched",
    ]
  )

  /// IANA Characater Set `BRF`
  static let brf = IANACharset(
    preferredMIMEName: nil,
    name: "BRF",
    aliases: [
      "csBRF",
    ]
  )

  /// IANA Characater Set `TSCII`
  static let tscii = IANACharset(
    preferredMIMEName: nil,
    name: "TSCII",
    aliases: [
      "csTSCII",
    ]
  )

  /// IANA Characater Set `CP51932`
  static let cp51932 = IANACharset(
    preferredMIMEName: nil,
    name: "CP51932",
    aliases: [
      "csCP51932",
    ]
  )

  /// IANA Characater Set `windows-874`
  static let windows874 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-874",
    aliases: [
      "cswindows874",
    ]
  )

  /// IANA Characater Set `windows-1250`
  static let windows1250 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1250",
    aliases: [
      "cswindows1250",
    ]
  )

  /// IANA Characater Set `windows-1251`
  static let windows1251 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1251",
    aliases: [
      "cswindows1251",
    ]
  )

  /// IANA Characater Set `windows-1252`
  static let windows1252 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1252",
    aliases: [
      "cswindows1252",
    ]
  )

  /// IANA Characater Set `windows-1253`
  static let windows1253 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1253",
    aliases: [
      "cswindows1253",
    ]
  )

  /// IANA Characater Set `windows-1254`
  static let windows1254 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1254",
    aliases: [
      "cswindows1254",
    ]
  )

  /// IANA Characater Set `windows-1255`
  static let windows1255 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1255",
    aliases: [
      "cswindows1255",
    ]
  )

  /// IANA Characater Set `windows-1256`
  static let windows1256 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1256",
    aliases: [
      "cswindows1256",
    ]
  )

  /// IANA Characater Set `windows-1257`
  static let windows1257 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1257",
    aliases: [
      "cswindows1257",
    ]
  )

  /// IANA Characater Set `windows-1258`
  static let windows1258 = IANACharset(
    preferredMIMEName: nil,
    name: "windows-1258",
    aliases: [
      "cswindows1258",
    ]
  )

  /// IANA Characater Set `TIS-620`
  static let tis620 = IANACharset(
    preferredMIMEName: nil,
    name: "TIS-620",
    aliases: [
      "csTIS620",
      "ISO-8859-11",
    ]
  )

  /// IANA Characater Set `CP50220`
  static let cp50220 = IANACharset(
    preferredMIMEName: nil,
    name: "CP50220",
    aliases: [
      "csCP50220",
    ]
  )

}
