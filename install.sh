#!/usr/bin/env bash
# Instala ytradio: symlink en ~/.local/bin + comprobación de dependencias.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BIN="$HOME/.local/bin"
mkdir -p "$BIN"
ln -sf "$HERE/bin/ytradio" "$BIN/ytradio"
echo "✓ ytradio enlazado en $BIN/ytradio"

case ":$PATH:" in
  *":$BIN:"*) : ;;
  *) echo "⚠ Añade ~/.local/bin a tu PATH:  export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac

echo "Comprobando dependencias:"
miss=0
for c in ytfzf mpv yt-dlp chafa; do
  if command -v "$c" >/dev/null 2>&1; then echo "  ✓ $c"; else echo "  ✗ $c (requerido)"; miss=1; fi
done
for c in mpv-mpris playerctl; do
  command -v "$c" >/dev/null 2>&1 && echo "  ✓ $c (opcional)" || echo "  · $c (opcional, recomendado)"
done
# mpv-mpris es un plugin, no un binario:
[ -e /etc/mpv/scripts/mpris.so ] || [ -e "$HOME/.config/mpv/scripts/mpris.so" ] \
  && echo "  ✓ mpv-mpris (plugin)" || echo "  · mpv-mpris (instala 'mpv-mpris' para controles de escritorio)"

[ "$miss" = 0 ] && echo "Listo. Prueba: ytradio radio tu artista favorito" \
  || echo "Instala lo que falte (ver README) y vuelve a ejecutar."
