#!/bin/bash
if [ ! -f /tmp/velox_key_imported ]; then
    pacman-key --add /usr/share/pacman/keyrings/veloxos.gpg
    pacman-key --lsign-key DE75DA0BF7DFECA3A588D82DF5DA023C16E45341
    touch /tmp/velox_key_imported
fi
