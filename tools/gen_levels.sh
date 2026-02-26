#!/usr/bin/env bash
# Generic level generator for ShabdLok.
# Run from project root: bash tools/gen_levels.sh [options]
#
# Options:
#   --start       First level ID to generate (default: 31)
#   --count       How many levels to generate (default: 10)
#   --letters     Name word length (default: 5)
#   --min-targets Minimum target word count (default: 6)
#   --max-targets Maximum target word count (default: 8)
#   --candidates  Space-separated candidate words (optional, overrides built-in pool)
#   --out-dir     Output directory for snippets (default: tools/gen_output)
#
# Examples:
#   bash tools/gen_levels.sh --start 31 --count 10 --letters 5
#   bash tools/gen_levels.sh --start 31 --count 10 --letters 5 --min-targets 6 --max-targets 8
#   bash tools/gen_levels.sh --start 31 --count 10 --letters 5 --candidates "CRANE REGAL TAMER"

set -euo pipefail

START_ID=31
COUNT=10
LETTERS=5
MIN_TARGETS=6
MAX_TARGETS=8
OUT_DIR="tools/gen_output"
CUSTOM_CANDIDATES=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --start)       START_ID="$2";          shift 2 ;;
    --count)       COUNT="$2";             shift 2 ;;
    --letters)     LETTERS="$2";           shift 2 ;;
    --min-targets) MIN_TARGETS="$2";       shift 2 ;;
    --max-targets) MAX_TARGETS="$2";       shift 2 ;;
    --out-dir)     OUT_DIR="$2";           shift 2 ;;
    --candidates)  CUSTOM_CANDIDATES="$2"; shift 2 ;;
    *)             echo "Unknown option: $1"; exit 1 ;;
  esac
done

POOL_5="CRANE REGAL TAMER PATER CARET PACER TAMES CAPES RAMET PARES \
        CAPER STARE TARES LASER SPEAR MANOR DEALS RATES ALTER ARTEL \
        RATEL RENAL MEDAL PEDAL LAGER MACES EARNS LANES LEANS NAMES \
        PANES SANER STEAD STEAL STEAK CHEAT ALERT RATER TALER ROLES \
        RAVEN METAL STEAM TALES PANEL ANGEL ANGER RANGE CARES LOANS"

POOL_6="STREAM RENTAL GARNET LAMENT TRANCE CANTER LOANER NESTLE COARSE LANDER \
        PLANET SIMPLE TRAVEL BRANCH GRAVEL CASTLE CANDLE MASTER CARPET FLORAL \
        TENDER BANTER JANGLE MANGER DANGER FILTER FAMINE RATTLE BATTLE CATNAP"

POOL_7="SHELTER FLATTEN SPARROW SERVANT GRANITE CAPTAIN LANTERN CRYSTAL PLASTIC BLANKET \
        CHAPTER CLIMATE COMFORT CONTEST COUNSEL COUNTER CURTAIN DESTINY ELEMENT FACULTY"

if [[ -n "$CUSTOM_CANDIDATES" ]]; then
  POOL="$CUSTOM_CANDIDATES"
elif [[ "$LETTERS" -eq 5 ]]; then
  POOL="$POOL_5"
elif [[ "$LETTERS" -eq 6 ]]; then
  POOL="$POOL_6"
elif [[ "$LETTERS" -eq 7 ]]; then
  POOL="$POOL_7"
else
  echo "No built-in pool for --letters $LETTERS. Use --candidates."
  exit 1
fi

USED_NAMES=$(grep "name: '" lib/data/level_data.dart | sed "s/.*name: '//;s/'.*//" | tr '[:lower:]' '[:upper:]')

mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR"/level_*.txt

END_ID=$((START_ID + COUNT - 1))
echo "Generating $COUNT levels (IDs ${START_ID}-${END_ID}), word length=$LETTERS, targets=${MIN_TARGETS}-${MAX_TARGETS}"
echo ""

CHOSEN_COUNT=0
LEVEL_ID=$START_ID
CHOSEN_WORDS=""

for WORD in $POOL; do
  if [ "$CHOSEN_COUNT" -ge "$COUNT" ]; then break; fi

  UPPER_WORD=$(echo "$WORD" | tr '[:lower:]' '[:upper:]')

  if [ "${#UPPER_WORD}" -ne "$LETTERS" ]; then
    continue
  fi

  if echo "$USED_NAMES" | grep -qx "$UPPER_WORD"; then
    echo "  SKIP $UPPER_WORD (already used as level name)"
    continue
  fi

  RESULT=$(dart run tools/gen_level.dart "$UPPER_WORD" "$LEVEL_ID" 2>&1)

  if ! echo "$RESULT" | grep -q "SOLUTION FOUND"; then
    echo "  SKIP $UPPER_WORD (no solution)"
    continue
  fi

  COUNT_TARGETS=$(echo "$RESULT" | grep "Target words:" | awk '{print $3}')

  if [ "$COUNT_TARGETS" -lt "$MIN_TARGETS" ]; then
    echo "  SKIP $UPPER_WORD (only $COUNT_TARGETS targets, need >=$MIN_TARGETS)"
    continue
  fi
  if [ "$COUNT_TARGETS" -gt "$MAX_TARGETS" ]; then
    echo "  SKIP $UPPER_WORD ($COUNT_TARGETS targets exceeds max $MAX_TARGETS)"
    continue
  fi

  DUPS=$(echo "$RESULT" | grep -c "WordPlacement(word: '$UPPER_WORD'" || true)
  if [ "$DUPS" -ge 2 ]; then
    echo "  SKIP $UPPER_WORD (name word duplicated as vertical)"
    continue
  fi

  echo "  OK   $UPPER_WORD: $COUNT_TARGETS target words -> level $LEVEL_ID"

  OUTFILE="$OUT_DIR/level_${LEVEL_ID}_${UPPER_WORD}.txt"
  echo "$RESULT" | sed -n '/=== DART CODE ===/,/=== STATS ===/p' | \
    grep -v "=== DART CODE ===" | grep -v "=== STATS ===" > "$OUTFILE"

  CHOSEN_COUNT=$((CHOSEN_COUNT + 1))
  CHOSEN_WORDS="$CHOSEN_WORDS $UPPER_WORD"
  LEVEL_ID=$((LEVEL_ID + 1))
done

echo ""
echo "Found $CHOSEN_COUNT/$COUNT levels:$CHOSEN_WORDS"

if [ "$CHOSEN_COUNT" -lt "$COUNT" ]; then
  echo ""
  echo "WARNING: Not enough candidates. Add more words via --candidates or expand the built-in pool."
  exit 1
fi

echo ""
echo "=== COMBINED DART CODE (paste into level_data.dart) ==="
echo ""
for FILE in "$OUT_DIR"/level_*.txt; do
  cat "$FILE"
  echo ""
done
