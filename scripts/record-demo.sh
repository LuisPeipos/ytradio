#!/usr/bin/env bash
# Graba un GIF de demo de ytradio para el README.
# Cadena: asciinema (graba la sesión) → agg (la convierte a GIF).
# Requiere: asciinema, agg  (agg: https://github.com/asciinema/agg/releases)
set -euo pipefail
HERE="$(cd "$(dirname "$0")/.." && pwd)"
CAST="$HERE/assets/demo.cast"
GIF="$HERE/assets/demo.gif"
mkdir -p "$HERE/assets"

for c in asciinema agg; do
  command -v "$c" >/dev/null || { echo "Falta '$c'. asciinema: apt install asciinema · agg: github.com/asciinema/agg/releases"; exit 1; }
done

cat <<'TXT'
── Grabación de la demo ───────────────────────────────────────────
Se va a grabar tu terminal. Cuando empiece:
  1) ejecuta:  ytradio radio <tu artista>
  2) elige un tema (verás las miniaturas)
  3) deja sonar unos segundos (se ven los ♪ títulos y el ▶ tiempo)
  4) pulsa  q  para parar mpv
  5) escribe  exit  para terminar la grabación
Consejo: una ventana ~90x25 y 15-20 s de demo quedan perfectos.
────────────────────────────────────────────────────────────────────
TXT
read -r -p "Pulsa Enter para empezar a grabar… "

rm -f "$CAST"
asciinema rec --overwrite -i 2 -t "ytradio demo" "$CAST"

echo "Convirtiendo a GIF…"
agg --theme monokai --font-size 18 "$CAST" "$GIF"
echo "✓ GIF generado: $GIF"
echo "  Súbelo:  git -C \"$HERE\" add assets/demo.gif && git -C \"$HERE\" commit -m 'docs: demo gif' && git -C \"$HERE\" push"
