#!/bin/bash

# --- KONFIGURATION ---
CONFIG_DIR="$HOME/.config/veloxos"
CONFIG_FILE="$CONFIG_DIR/welcome.conf"
mkdir -p "$CONFIG_DIR"

export GTK_THEME=Adwaita:dark

# Funktion für das Treiber-Update im Live-System
install_drivers() {
    if ! ping -c 1 8.8.8.8 &> /dev/null; then
        yad --error --title="No Internet" --text="Bitte zuerst mit dem Internet verbinden!" --width=300 --center
        return 1
    fi

    if lspci | grep -i nvidia &> /dev/null; then
        (
        echo "10"; echo "# Repository-Datenbanken werden synchronisiert..."
        sudo pacman -Sy --noconfirm
        echo "50"; echo "# NVIDIA CachyOS-Bore Treiber werden installiert..."
        sudo pacman -S --noconfirm nvidia-cachyos-bore nvidia-utils lib32-nvidia-utils
        echo "100"; echo "# Optimierung abgeschlossen!"
        ) | yad --progress --title="VeloxOS Grafik-Setup" --text="Hardware-Beschleunigung wird aktiviert..." --percentage=0 --auto-close --center --width=400
        
        yad --info --title="Erfolg" --text="NVIDIA Treiber sind nun aktiv. Viel Spaß mit der vollen Performance!" --width=350 --center
    else
        yad --info --title="Hardware Check" --text="Keine NVIDIA GPU gefunden. Das System nutzt bereits die optimalen Open-Source Treiber." --width=350 --center
    fi
}
export -f install_drivers

# Live-System Erkennung
if [ -d /run/miso/bootmnt ]; then
    IS_LIVE=true
else
    IS_LIVE=false
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "autostart=true" > "$CONFIG_FILE"
fi

if [[ "$1" == "--autostart" ]]; then
    if grep -q "autostart=false" "$CONFIG_FILE"; then
        exit 0
    fi
fi

CURRENT_STATUS=$(grep -q "autostart=true" "$CONFIG_FILE" && echo "TRUE" || echo "FALSE")

# --- UI DESIGN ELEMENTE ---
HEADER="<span foreground='#00d8ff' font='26' weight='bold'>VeloxOS</span>
<span font='10' foreground='#cccccc'>High-Performance Gaming & Productivity</span>"

# --- YAD DIALOG START ---
if [ "$IS_LIVE" = true ]; then
    # LIVE MODUS - Fokus auf Setup & Installation
    res=$(yad --width=520 --height=620 --center --fixed \
        --title="Welcome to VeloxOS" \
        --window-icon="distributor-logo-veloxos" \
        --text-align=center \
        --text="$HEADER" \
        --form --separator="|" --columns=1 \
        --field="":LBL "" \
        --field="<span foreground='#ffcc00' font='12' weight='bold'>      ➊  OPTIMIERUNG (EMPFOHLEN)</span>:LBL" "" \
        --field="  NVIDIA Treiber nachladen!system-software-update:fbtn" "bash -c install_drivers" \
        --field="":LBL "" \
        --field="<span foreground='#00ff00' font='12' weight='bold'>      ➋  INSTALLATION</span>:LBL" "" \
        --field="  VeloxOS auf Festplatte installieren!system-installer:fbtn" "sudo -E calamares" \
        --field="":LBL "" \
        --field="<span alpha='50%'>______________________________________________________</span>:LBL" "" \
        --field="":LBL "" \
        --field="<span font='10' weight='bold'>RESOURCEN & COMMUNITY</span>:LBL" "" \
        --field="  GitHub Repo!github:fbtn" "xdg-open https://github.com/VeloxOSLinux/" \
        --field="  Offizielle Webseite!help-browser:fbtn" "xdg-open https://veloxos.org" \
        --field="":LBL "" \
        --field="  Beim Systemstart automatisch öffnen":CHK "$CURRENT_STATUS" \
        --button="Schließen!gtk-close":0)
else
    # INSTALLIERTES SYSTEM - Fokus auf Updates & Config
    res=$(yad --width=520 --height=550 --center --fixed \
        --title="Welcome to VeloxOS" \
        --window-icon="distributor-logo-veloxos" \
        --text-align=center \
        --text="$HEADER_TEXT" \
        --form --separator="|" --columns=1 \
        --field="":LBL "" \
        --field="<span font='11' weight='bold'>SYSTEM-VERWALTUNG</span>:LBL" "" \
        --field="  Nach Updates suchen!system-software-update:fbtn" "pamac-manager --updates" \
        --field="  CachyOS Kernel Tweaks!preferences-system-performance:fbtn" "cachyos-settings-manager" \
        --field="":LBL "" \
        --field="<span alpha='50%'>______________________________________________________</span>:LBL" "" \
        --field="":LBL "" \
        --field="<span font='10' weight='bold'>LINKS</span>:LBL" "" \
        --field="  GitHub Repo!github:fbtn" "xdg-open https://github.com/HrSkully" \
        --field="  Projekt Webseite!help-browser:fbtn" "xdg-open https://veloxos.org" \
        --field="":LBL "" \
        --field="  Beim Systemstart automatisch öffnen":CHK "$CURRENT_STATUS" \
        --button="Schließen!gtk-close":0)
fi

# Autostart-Auswertung
if [[ "$res" == *"TRUE|"* ]] || [[ "$res" == *"TRUE"* ]]; then
    echo "autostart=true" > "$CONFIG_FILE"
else
    echo "autostart=false" > "$CONFIG_FILE"
fi
