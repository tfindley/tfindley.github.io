#!/usr/bin/env bash
# convert-to-webp.sh — generate .webp siblings for content images.
#
# Walks content/ for .png/.jpg/.jpeg files and produces a .webp next to each
# (skipping any where the .webp is already newer). Does NOT rewrite markdown
# references — that's a separate, reviewable change.
#
# Requirements: cwebp (from libwebp-tools or webp).
#   apt:    sudo apt install webp
#   brew:   brew install webp
#
# Usage:
#   scripts/convert-to-webp.sh                  # walk content/
#   scripts/convert-to-webp.sh content/photo    # walk a single subtree
#   QUALITY=85 scripts/convert-to-webp.sh       # override quality (default 80)

set -euo pipefail

QUALITY="${QUALITY:-80}"
ROOT="${1:-content}"

if ! command -v cwebp >/dev/null 2>&1; then
  echo "error: cwebp not found. Install with 'sudo apt install webp' or 'brew install webp'." >&2
  exit 1
fi

if [[ ! -d "$ROOT" ]]; then
  echo "error: directory not found: $ROOT" >&2
  exit 1
fi

convert_one() {
  local src="$1"
  local dst="${src%.*}.webp"
  if [[ -f "$dst" && "$dst" -nt "$src" ]]; then
    printf 'skip\n'
    return
  fi
  if cwebp -quiet -q "$QUALITY" "$src" -o "$dst"; then
    printf 'ok\n'
  else
    printf 'fail\n'
    echo "  FAIL: $src" >&2
  fi
}
export -f convert_one
export QUALITY

results=$(
  find "$ROOT" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) -print0 \
    | xargs -0 -P "$(nproc 2>/dev/null || echo 4)" -n 1 -I {} bash -c 'convert_one "$@"' _ {}
)

converted=$(grep -c '^ok$' <<<"$results" || true)
skipped=$(grep -c '^skip$' <<<"$results" || true)
failed=$(grep -c '^fail$' <<<"$results" || true)

echo "converted: $converted"
echo "skipped (already up-to-date): $skipped"
echo "failed: $failed"
