#!/bin/bash

CONFIG_DIR="$HOME/.config/veloxos"
CONFIG_FILE="$CONFIG_DIR/welcome.conf"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "autostart=true" > "$CONFIG_FILE"
fi

if [[ "$1" == "--autostart" ]]; then
    if grep -q "autostart=false" "$CONFIG_FILE"; then
        exit 0
    fi
fi

# Status holen
CURRENT_STATUS=$(grep -q "autostart=true" "$CONFIG_FILE" && echo "TRUE" || echo "FALSE")

# YAD Dialog
res=$(yad --width=600 --height=480 --center --fixed \
    --title="Welcome to VeloxOS" \
    --window-icon="distributor-logo-manjaro" \
    --text-align=center \
    --text="<span foreground='#00b0f0' font='24' weight='bold'>VeloxOS</span>
<span font='11' alpha='70%'>The Speed of CachyOS. The Stability of Manjaro.</span>

<span font='10'>Your system is pre-optimized with the <b>CachyOS Kernel</b> and <b>ZRAM</b>.
Choose an action to get started:</span>" \
    --form --columns=2 --separator="|" \
    --field="  Update System!system-software-update":fbtn "pamac-manager --updates" \
    --field="  GitHub Repo!github":fbtn "xdg-open https://github.com/HrSkully" \
    --field="  CachyOS Config!preferences-system-performance":fbtn "cachyos-settings-manager" \
    --field="  VeloxOS Website!help-browser":fbtn "xdg-open https://veloxos.org" \
    --field="":LBL "" \
    --field=" Show on startup":CHK "$CURRENT_STATUS" \
    --button="Finish!gtk-check":0)

# Auswertung (Wir schauen gezielt nach dem TRUE am Ende des Strings)
if [[ "$res" == *"TRUE|"* ]] || [[ "$res" == *"TRUE"* ]]; then
    echo "autostart=true" > "$CONFIG_FILE"
else
    echo "autostart=false" > "$CONFIG_FILE"
fi
