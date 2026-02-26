#!/usr/bin/env bash
# Generates levels 31-40 for ShabdLok using 5-letter name words.
# Run from project root: bash tools/gen_levels_31_40.sh
#
# For each candidate word, checks:
#   - Generator finds a solution
#   - No self-duplication (name word != vertical at col 0)
#   - At least 6 target words
# Outputs the Dart code for the 10 best words.

set -euo pipefail

OUT_DIR="tools/gen_output"
mkdir -p "$OUT_DIR"

# Already-used level names (1-30 and the future 41-50). Must not repeat.
USED_NAMES="DOG POT TAP BONE CORD FARM LAKE PINE MOLE ROPE BRAVE FLAME COVER BLAND CLOSE PLANT DREAM SPORE CLEAN BRAND SHELTER FLATTEN SPARROW SERVANT GRANITE CAPTAIN LANTERN CRYSTAL PLASTIC BLANKET STREAM RENTAL GARNET LAMENT TRANCE CANTER LOANER NESTLE COARSE LANDER SPRING PLANET SIMPLE TRAVEL BRANCH POWDERS FLATTEN BRIGHTS CRUMBLE THRILLS"

# Candidates to try (5-letter, no repeated letters preferred, distinct from used names)
CANDIDATES=(
  CRANE REGAL TAMER PATER CARET PACER TAMES CAPES RAMET PARES
  CAPER STARE TARES LASER SPEAR MANOR DEALS RATES ALTER ARTEL
  RATEL RENAL MEDAL PEDAL LAGER MACES CARES EARNS LANES LEANS
  NAMES PANES SANER STEAD STEAL STEAK CHEAT ALERT RATER TALER
  ROLES OAKEN RAVEN ANGEL RANGE ANGER METAL STEAM TALES PANEL
)

echo "Searching for clean 5-letter level candidates..."
echo "(clean = solution found, no self-dup at col 0, >=6 target words)"
echo ""

CHOSEN=()
LEVEL_ID=31

for WORD in "${CANDIDATES[@]}"; do
  # Skip if already chosen enough
  if [ "${#CHOSEN[@]}" -ge 10 ]; then break; fi

  # Skip if word is in used names list (case-insensitive)
  UPPER_WORD=$(echo "$WORD" | tr '[:lower:]' '[:upper:]')
  FOUND_DUP=0
  for USED in $USED_NAMES; do
    if [ "$(echo "$USED" | tr '[:lower:]' '[:upper:]')" = "$UPPER_WORD" ]; then
      FOUND_DUP=1
      break
    fi
  done
  if [ "$FOUND_DUP" -eq 1 ]; then
    echo "  SKIP $WORD (already used as level name)"
    continue
  fi

  RESULT=$(dart run tools/gen_level.dart "$WORD" "$LEVEL_ID" 2>&1)

  if ! echo "$RESULT" | grep -q "SOLUTION FOUND"; then
    echo "  SKIP $WORD (no solution)"
    continue
  fi

  COUNT=$(echo "$RESULT" | grep "Target words:" | awk '{print $3}')
  DUPS=$(echo "$RESULT" | grep -c "WordPlacement(word: '$UPPER_WORD'" 2>/dev/null || echo 0)

  if [ "$DUPS" -ge 2 ]; then
    echo "  SKIP $WORD (self-dup: name == col-0 vertical)"
    continue
  fi

  if [ "$COUNT" -lt 6 ]; then
    echo "  SKIP $WORD (only $COUNT target words, need >=6)"
    continue
  fi

  echo "  OK   $WORD: $COUNT target words -> level $LEVEL_ID"

  # Save dart code snippet
  OUTFILE="$OUT_DIR/level_${LEVEL_ID}_${WORD}.txt"
  echo "$RESULT" | sed -n '/=== DART CODE ===/,/=== STATS ===/p' | \
    grep -v "=== DART CODE ===" | grep -v "=== STATS ===" > "$OUTFILE"

  CHOSEN+=("$WORD")
  LEVEL_ID=$((LEVEL_ID + 1))
done

echo ""
echo "Found ${#CHOSEN[@]} levels: ${CHOSEN[*]}"

if [ "${#CHOSEN[@]}" -lt 10 ]; then
  echo "WARNING: Only found ${#CHOSEN[@]} candidates, need 10. Add more CANDIDATES to the script."
  exit 1
fi

echo ""
echo "=== COMBINED DART CODE FOR LEVELS 31-40 ==="
echo ""
for FILE in "$OUT_DIR"/level_3*.txt; do
  cat "$FILE"
  echo ""
done

echo "Output files saved to $OUT_DIR/"
