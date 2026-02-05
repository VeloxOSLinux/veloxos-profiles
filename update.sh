#!/bin/bash
# Kopiert alles von den Arbeitsverzeichnissen ins Repo
cp -r /home/user/velox-profiles/custom/gnome/* ./gnome/
cp -r /home/user/velox-profiles/custom/shared/* ./shared/
cp ~/.config/manjaro-tools/manjaro-tools.conf ./.config/
cp -r /home/user/velox-profiles/manjaro/gnome ./base/
cp -r /home/user/velox-profiles/custim/cosmic/* ./cosmic/

echo "Files synced! Ready to git add, commit and push."
