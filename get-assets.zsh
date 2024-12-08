#!/usr/bin/env zsh

set -eu

function __checkCommand() {
  local -r commandName="${1-}"
  local -r formulaeName="${2-}"
  if ! command -v "$commandName" 2>/dev/null; then
    echo "⚠️ '${commandName}' not found." 1>&2
    if [[ -n "$formulaeName" ]]; then
      echo "🍺 Try 'brew install ${formulaeName}'" 1>&2
    fi
    return 1
  fi
}

__checkCommand curl curl
__checkCommand csvjson csvkit

local -r projectDir="$(cd "$(dirname "$0")" && pwd)"
local -r assetsDir="${projectDir}/assets"
mkdir -p "$assetsDir"

local -r ianaCharSetCSVRemoteURL="https://www.iana.org/assignments/character-sets/character-sets-1.csv"
local -r ianaCharSetCSVLocalPath="${assetsDir}/iana-character-sets-1.csv"
local -r ianaCharSetJSONLocalPath="${assetsDir}/ianaCharacterSets.json"

local -r whatwgEncodingsJSONRemoteURL="https://encoding.spec.whatwg.org/encodings.json"
local -r whatwgEncodingsJSONLocalPath="${assetsDir}/whatwgEncodings.json"

set -x

curl --fail "$ianaCharSetCSVRemoteURL" >"$ianaCharSetCSVLocalPath"
csvjson -i 2 "$ianaCharSetCSVLocalPath" >"$ianaCharSetJSONLocalPath"
curl --fail "$whatwgEncodingsJSONRemoteURL" >"$whatwgEncodingsJSONLocalPath"
