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
  static let iso8859_1 = IANACharset(
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
  static let iso8859_2 = IANACharset(
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

  // SKIPPED: IANA Character Set `ISO-8859-3`

  // SKIPPED: IANA Character Set `ISO-8859-4`

  // SKIPPED: IANA Character Set `ISO-8859-5`

  // SKIPPED: IANA Character Set `ISO-8859-6`

  // SKIPPED: IANA Character Set `ISO-8859-7`

  // SKIPPED: IANA Character Set `ISO-8859-8`

  // SKIPPED: IANA Character Set `ISO-8859-9`

  // SKIPPED: IANA Character Set `ISO-8859-10`

  // SKIPPED: IANA Character Set `ISO_6937-2-add`

  // SKIPPED: IANA Character Set `JIS_X0201`

  // SKIPPED: IANA Character Set `JIS_Encoding`

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

  // SKIPPED: IANA Character Set `Extended_UNIX_Code_Fixed_Width_for_Japanese`

  // SKIPPED: IANA Character Set `BS_4730`

  // SKIPPED: IANA Character Set `SEN_850200_C`

  // SKIPPED: IANA Character Set `IT`

  // SKIPPED: IANA Character Set `ES`

  // SKIPPED: IANA Character Set `DIN_66003`

  // SKIPPED: IANA Character Set `NS_4551-1`

  // SKIPPED: IANA Character Set `NF_Z_62-010`

  // SKIPPED: IANA Character Set `ISO-10646-UTF-1`

  // SKIPPED: IANA Character Set `ISO_646.basic:1983`

  // SKIPPED: IANA Character Set `INVARIANT`

  // SKIPPED: IANA Character Set `ISO_646.irv:1983`

  // SKIPPED: IANA Character Set `NATS-SEFI`

  // SKIPPED: IANA Character Set `NATS-SEFI-ADD`

  // SKIPPED: IANA Character Set `NATS-DANO`

  // SKIPPED: IANA Character Set `NATS-DANO-ADD`

  // SKIPPED: IANA Character Set `SEN_850200_B`

  // SKIPPED: IANA Character Set `KS_C_5601-1987`

  // SKIPPED: IANA Character Set `ISO-2022-KR`

  // SKIPPED: IANA Character Set `EUC-KR`

  /// IANA Characater Set `ISO-2022-JP`
  static let iso2022JP = IANACharset(
    preferredMIMEName: "ISO-2022-JP",
    name: "ISO-2022-JP",
    aliases: [
      "csISO2022JP",
    ]
  )

  // SKIPPED: IANA Character Set `ISO-2022-JP-2`

  // SKIPPED: IANA Character Set `JIS_C6220-1969-jp`

  // SKIPPED: IANA Character Set `JIS_C6220-1969-ro`

  // SKIPPED: IANA Character Set `PT`

  // SKIPPED: IANA Character Set `greek7-old`

  // SKIPPED: IANA Character Set `latin-greek`

  // SKIPPED: IANA Character Set `NF_Z_62-010_(1973)`

  // SKIPPED: IANA Character Set `Latin-greek-1`

  // SKIPPED: IANA Character Set `ISO_5427`

  // SKIPPED: IANA Character Set `JIS_C6226-1978`

  // SKIPPED: IANA Character Set `BS_viewdata`

  // SKIPPED: IANA Character Set `INIS`

  // SKIPPED: IANA Character Set `INIS-8`

  // SKIPPED: IANA Character Set `INIS-cyrillic`

  // SKIPPED: IANA Character Set `ISO_5427:1981`

  // SKIPPED: IANA Character Set `ISO_5428:1980`

  // SKIPPED: IANA Character Set `GB_1988-80`

  // SKIPPED: IANA Character Set `GB_2312-80`

  // SKIPPED: IANA Character Set `NS_4551-2`

  // SKIPPED: IANA Character Set `videotex-suppl`

  // SKIPPED: IANA Character Set `PT2`

  // SKIPPED: IANA Character Set `ES2`

  // SKIPPED: IANA Character Set `MSZ_7795.3`

  // SKIPPED: IANA Character Set `JIS_C6226-1983`

  // SKIPPED: IANA Character Set `greek7`

  // SKIPPED: IANA Character Set `ASMO_449`

  // SKIPPED: IANA Character Set `iso-ir-90`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-a`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-b`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-b-add`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-hand`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-hand-add`

  // SKIPPED: IANA Character Set `JIS_C6229-1984-kana`

  // SKIPPED: IANA Character Set `ISO_2033-1983`

  // SKIPPED: IANA Character Set `ANSI_X3.110-1983`

  // SKIPPED: IANA Character Set `T.61-7bit`

  // SKIPPED: IANA Character Set `T.61-8bit`

  // SKIPPED: IANA Character Set `ECMA-cyrillic`

  // SKIPPED: IANA Character Set `CSA_Z243.4-1985-1`

  // SKIPPED: IANA Character Set `CSA_Z243.4-1985-2`

  // SKIPPED: IANA Character Set `CSA_Z243.4-1985-gr`

  // SKIPPED: IANA Character Set `ISO-8859-6-E`

  // SKIPPED: IANA Character Set `ISO-8859-6-I`

  // SKIPPED: IANA Character Set `T.101-G2`

  // SKIPPED: IANA Character Set `ISO-8859-8-E`

  // SKIPPED: IANA Character Set `ISO-8859-8-I`

  // SKIPPED: IANA Character Set `CSN_369103`

  // SKIPPED: IANA Character Set `JUS_I.B1.002`

  // SKIPPED: IANA Character Set `IEC_P27-1`

  // SKIPPED: IANA Character Set `JUS_I.B1.003-serb`

  // SKIPPED: IANA Character Set `JUS_I.B1.003-mac`

  // SKIPPED: IANA Character Set `greek-ccitt`

  // SKIPPED: IANA Character Set `NC_NC00-10:81`

  // SKIPPED: IANA Character Set `ISO_6937-2-25`

  // SKIPPED: IANA Character Set `GOST_19768-74`

  // SKIPPED: IANA Character Set `ISO_8859-supp`

  // SKIPPED: IANA Character Set `ISO_10367-box`

  // SKIPPED: IANA Character Set `latin-lap`

  // SKIPPED: IANA Character Set `JIS_X0212-1990`

  // SKIPPED: IANA Character Set `DS_2089`

  // SKIPPED: IANA Character Set `us-dk`

  // SKIPPED: IANA Character Set `dk-us`

  // SKIPPED: IANA Character Set `KSC5636`

  // SKIPPED: IANA Character Set `UNICODE-1-1-UTF-7`

  // SKIPPED: IANA Character Set `ISO-2022-CN`

  // SKIPPED: IANA Character Set `ISO-2022-CN-EXT`

  /// IANA Characater Set `UTF-8`
  static let utf8 = IANACharset(
    preferredMIMEName: nil,
    name: "UTF-8",
    aliases: [
      "csUTF8",
    ]
  )

  // SKIPPED: IANA Character Set `ISO-8859-13`

  // SKIPPED: IANA Character Set `ISO-8859-14`

  // SKIPPED: IANA Character Set `ISO-8859-15`

  // SKIPPED: IANA Character Set `ISO-8859-16`

  // SKIPPED: IANA Character Set `GBK`

  // SKIPPED: IANA Character Set `GB18030`

  // SKIPPED: IANA Character Set `OSD_EBCDIC_DF04_15`

  // SKIPPED: IANA Character Set `OSD_EBCDIC_DF03_IRV`

  // SKIPPED: IANA Character Set `OSD_EBCDIC_DF04_1`

  // SKIPPED: IANA Character Set `ISO-11548-1`

  // SKIPPED: IANA Character Set `KZ-1048`

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

  // SKIPPED: IANA Character Set `ISO-10646-UCS-Basic`

  // SKIPPED: IANA Character Set `ISO-10646-Unicode-Latin1`

  // SKIPPED: IANA Character Set `ISO-10646-J-1`

  // SKIPPED: IANA Character Set `ISO-Unicode-IBM-1261`

  // SKIPPED: IANA Character Set `ISO-Unicode-IBM-1268`

  // SKIPPED: IANA Character Set `ISO-Unicode-IBM-1276`

  // SKIPPED: IANA Character Set `ISO-Unicode-IBM-1264`

  // SKIPPED: IANA Character Set `ISO-Unicode-IBM-1265`

  /// IANA Characater Set `UNICODE-1-1`
  static let unicode1_1 = IANACharset(
    preferredMIMEName: nil,
    name: "UNICODE-1-1",
    aliases: [
      "csUnicode11",
    ]
  )

  // SKIPPED: IANA Character Set `SCSU`

  // SKIPPED: IANA Character Set `UTF-7`

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

  // SKIPPED: IANA Character Set `CESU-8`

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

  // SKIPPED: IANA Character Set `BOCU-1`

  // SKIPPED: IANA Character Set `UTF-7-IMAP`

  /// IANA Characater Set `ISO-8859-1-Windows-3.0-Latin-1`
  static let iso8859_1Windows3_0Latin1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-1-Windows-3.0-Latin-1",
    aliases: [
      "csWindows30Latin1",
    ]
  )

  /// IANA Characater Set `ISO-8859-1-Windows-3.1-Latin-1`
  static let iso8859_1Windows3_1Latin1 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-1-Windows-3.1-Latin-1",
    aliases: [
      "csWindows31Latin1",
    ]
  )

  /// IANA Characater Set `ISO-8859-2-Windows-Latin-2`
  static let iso8859_2WindowsLatin2 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-2-Windows-Latin-2",
    aliases: [
      "csWindows31Latin2",
    ]
  )

  /// IANA Characater Set `ISO-8859-9-Windows-Latin-5`
  static let iso8859_9WindowsLatin5 = IANACharset(
    preferredMIMEName: nil,
    name: "ISO-8859-9-Windows-Latin-5",
    aliases: [
      "csWindows31Latin5",
    ]
  )

  // SKIPPED: IANA Character Set `hp-roman8`

  // SKIPPED: IANA Character Set `Adobe-Standard-Encoding`

  // SKIPPED: IANA Character Set `Ventura-US`

  // SKIPPED: IANA Character Set `Ventura-International`

  // SKIPPED: IANA Character Set `DEC-MCS`

  // SKIPPED: IANA Character Set `IBM850`

  // SKIPPED: IANA Character Set `PC8-Danish-Norwegian`

  // SKIPPED: IANA Character Set `IBM862`

  // SKIPPED: IANA Character Set `PC8-Turkish`

  // SKIPPED: IANA Character Set `IBM-Symbols`

  // SKIPPED: IANA Character Set `IBM-Thai`

  // SKIPPED: IANA Character Set `HP-Legal`

  // SKIPPED: IANA Character Set `HP-Pi-font`

  // SKIPPED: IANA Character Set `HP-Math8`

  /// IANA Characater Set `Adobe-Symbol-Encoding`
  static let adobeSymbolEncoding = IANACharset(
    preferredMIMEName: nil,
    name: "Adobe-Symbol-Encoding",
    aliases: [
      "csHPPSMath",
    ]
  )

  // SKIPPED: IANA Character Set `HP-DeskTop`

  // SKIPPED: IANA Character Set `Ventura-Math`

  // SKIPPED: IANA Character Set `Microsoft-Publishing`

  /// IANA Characater Set `Windows-31J`
  static let windows31J = IANACharset(
    preferredMIMEName: nil,
    name: "Windows-31J",
    aliases: [
      "csWindows31J",
    ]
  )

  // SKIPPED: IANA Character Set `GB2312`

  // SKIPPED: IANA Character Set `Big5`

  /// IANA Characater Set `macintosh`
  static let macintosh = IANACharset(
    preferredMIMEName: nil,
    name: "macintosh",
    aliases: [
      "mac",
      "csMacintosh",
    ]
  )

  // SKIPPED: IANA Character Set `IBM037`

  // SKIPPED: IANA Character Set `IBM038`

  // SKIPPED: IANA Character Set `IBM273`

  // SKIPPED: IANA Character Set `IBM274`

  // SKIPPED: IANA Character Set `IBM275`

  // SKIPPED: IANA Character Set `IBM277`

  // SKIPPED: IANA Character Set `IBM278`

  // SKIPPED: IANA Character Set `IBM280`

  // SKIPPED: IANA Character Set `IBM281`

  // SKIPPED: IANA Character Set `IBM284`

  // SKIPPED: IANA Character Set `IBM285`

  // SKIPPED: IANA Character Set `IBM290`

  // SKIPPED: IANA Character Set `IBM297`

  // SKIPPED: IANA Character Set `IBM420`

  // SKIPPED: IANA Character Set `IBM423`

  // SKIPPED: IANA Character Set `IBM424`

  // SKIPPED: IANA Character Set `IBM437`

  // SKIPPED: IANA Character Set `IBM500`

  // SKIPPED: IANA Character Set `IBM851`

  // SKIPPED: IANA Character Set `IBM852`

  // SKIPPED: IANA Character Set `IBM855`

  // SKIPPED: IANA Character Set `IBM857`

  // SKIPPED: IANA Character Set `IBM860`

  // SKIPPED: IANA Character Set `IBM861`

  // SKIPPED: IANA Character Set `IBM863`

  // SKIPPED: IANA Character Set `IBM864`

  // SKIPPED: IANA Character Set `IBM865`

  // SKIPPED: IANA Character Set `IBM868`

  // SKIPPED: IANA Character Set `IBM869`

  // SKIPPED: IANA Character Set `IBM870`

  // SKIPPED: IANA Character Set `IBM871`

  // SKIPPED: IANA Character Set `IBM880`

  // SKIPPED: IANA Character Set `IBM891`

  // SKIPPED: IANA Character Set `IBM903`

  // SKIPPED: IANA Character Set `IBM904`

  // SKIPPED: IANA Character Set `IBM905`

  // SKIPPED: IANA Character Set `IBM918`

  // SKIPPED: IANA Character Set `IBM1026`

  // SKIPPED: IANA Character Set `EBCDIC-AT-DE`

  // SKIPPED: IANA Character Set `EBCDIC-AT-DE-A`

  // SKIPPED: IANA Character Set `EBCDIC-CA-FR`

  // SKIPPED: IANA Character Set `EBCDIC-DK-NO`

  // SKIPPED: IANA Character Set `EBCDIC-DK-NO-A`

  // SKIPPED: IANA Character Set `EBCDIC-FI-SE`

  // SKIPPED: IANA Character Set `EBCDIC-FI-SE-A`

  // SKIPPED: IANA Character Set `EBCDIC-FR`

  // SKIPPED: IANA Character Set `EBCDIC-IT`

  // SKIPPED: IANA Character Set `EBCDIC-PT`

  // SKIPPED: IANA Character Set `EBCDIC-ES`

  // SKIPPED: IANA Character Set `EBCDIC-ES-A`

  // SKIPPED: IANA Character Set `EBCDIC-ES-S`

  // SKIPPED: IANA Character Set `EBCDIC-UK`

  // SKIPPED: IANA Character Set `EBCDIC-US`

  // SKIPPED: IANA Character Set `UNKNOWN-8BIT`

  // SKIPPED: IANA Character Set `MNEMONIC`

  // SKIPPED: IANA Character Set `MNEM`

  // SKIPPED: IANA Character Set `VISCII`

  // SKIPPED: IANA Character Set `VIQR`

  // SKIPPED: IANA Character Set `KOI8-R`

  // SKIPPED: IANA Character Set `HZ-GB-2312`

  // SKIPPED: IANA Character Set `IBM866`

  // SKIPPED: IANA Character Set `IBM775`

  // SKIPPED: IANA Character Set `KOI8-U`

  // SKIPPED: IANA Character Set `IBM00858`

  // SKIPPED: IANA Character Set `IBM00924`

  // SKIPPED: IANA Character Set `IBM01140`

  // SKIPPED: IANA Character Set `IBM01141`

  // SKIPPED: IANA Character Set `IBM01142`

  // SKIPPED: IANA Character Set `IBM01143`

  // SKIPPED: IANA Character Set `IBM01144`

  // SKIPPED: IANA Character Set `IBM01145`

  // SKIPPED: IANA Character Set `IBM01146`

  // SKIPPED: IANA Character Set `IBM01147`

  // SKIPPED: IANA Character Set `IBM01148`

  // SKIPPED: IANA Character Set `IBM01149`

  // SKIPPED: IANA Character Set `Big5-HKSCS`

  // SKIPPED: IANA Character Set `IBM1047`

  // SKIPPED: IANA Character Set `PTCP154`

  // SKIPPED: IANA Character Set `Amiga-1251`

  // SKIPPED: IANA Character Set `KOI7-switched`

  // SKIPPED: IANA Character Set `BRF`

  // SKIPPED: IANA Character Set `TSCII`

  // SKIPPED: IANA Character Set `CP51932`

  // SKIPPED: IANA Character Set `windows-874`

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

  // SKIPPED: IANA Character Set `windows-1255`

  // SKIPPED: IANA Character Set `windows-1256`

  // SKIPPED: IANA Character Set `windows-1257`

  // SKIPPED: IANA Character Set `windows-1258`

  // SKIPPED: IANA Character Set `TIS-620`

  // SKIPPED: IANA Character Set `CP50220`

}
