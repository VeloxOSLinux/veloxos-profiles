# Startet die COSMIC-Session automatisch, wenn man sich auf TTY1 einloggt
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec cosmic-session
fi
