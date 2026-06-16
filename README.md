# ytradio 🎵

Radio y música de YouTube **en la terminal**, con feeling de Spotify: búsqueda con
miniaturas, mix/radio continuo, controles de escritorio (MPRIS) y título en vivo.

> Es un envoltorio fino y pragmático sobre tres herramientas excelentes:
> **ytfzf** (buscar), **yt-dlp** (extraer) y **mpv** (reproducir).

## Demo

```
$ ytradio radio oliver tree
# → menú con miniaturas → eliges un tema → suena su MIX (lista continua afín)
♪  Oliver Tree - Cowboys Don't Cry
   ▶ 00:00:11 / 00:02:35
```

_(añade aquí un GIF: `assets/demo.gif`)_

## Características
- 🔎 **Búsqueda con miniaturas** dentro de la terminal (sixel vía chafa).
- 📻 **Mix/radio continuo**: a partir de un tema, encadena temas afines.
- ⚡ **Arranque rápido**: `lazy-playlist` → empieza a sonar en segundos, no espera a
  procesar los ~300 temas del mix; `prefetch-playlist` → saltos instantáneos.
- 🎛️ **Controles de escritorio (MPRIS)**: aparece en el widget de medios de GNOME/KDE
  y responde a las teclas multimedia (⏮ ⏯ ⏭). Vía `mpv-mpris`.
- 🏷️ **Título en vivo** y tiempo de reproducción.

## Uso
```
ytradio radio <búsqueda>   # elige un tema → suena su MIX/radio
ytradio list  <búsqueda>   # busca PLAYLISTS y reproduce la elegida entera
ytradio play  <búsqueda>   # menú con miniaturas (Tab marca, Enter reproduce)
ytradio all   <búsqueda>   # reproduce todos los resultados sin menú
ytradio now                # muestra la canción actual (necesita playerctl)
ytradio --help
```

Controles mientras suena (mpv): `Espacio` pausa · `>`/`<` siguiente/anterior · `q` salir.
En el escritorio: widget de medios + teclas multimedia.

## Instalación
```bash
git clone https://github.com/TU_USUARIO/ytradio.git
cd ytradio
./install.sh        # symlinkea bin/ytradio en ~/.local/bin y comprueba dependencias
```

### Dependencias
| Paquete | Para qué | Debian/Ubuntu |
|---|---|---|
| `ytfzf` | búsqueda + menú | [pystardust/ytfzf](https://github.com/pystardust/ytfzf) |
| `mpv` | reproducción | `apt install mpv` |
| `yt-dlp` | extracción de stream | release oficial de yt-dlp |
| `chafa` | miniaturas en terminal | `apt install chafa` |
| `mpv-mpris` *(recomendado)* | controles de escritorio | `apt install mpv-mpris` |
| `playerctl` *(recomendado)* | `ytradio now` + teclas | `apt install playerctl` |

## Configuración
- `YTRADIO_INVIDIOUS` — instancia Invidious para buscar playlists en `list`
  (por defecto `https://inv.thepixora.com`).

## Créditos
`ytradio` no reinventa nada: orquesta tres herramientas excelentes.
- [ytfzf](https://github.com/pystardust/ytfzf) — búsqueda y menú interactivo.
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) — extracción de streams de YouTube.
- [mpv](https://mpv.io/) + [mpv-mpris](https://github.com/hoyon/mpv-mpris) — reproducción y controles de escritorio.

## Licencia
MIT — ver [LICENSE](LICENSE).
