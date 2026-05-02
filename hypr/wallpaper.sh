#!/bin/bash
pkill swaybg 2>/dev/null
swaybg -i /home/xstream/Pictures/anime/1345576.jpeg -m fill &

# Update hyprlock
sed -i "s|path = .*|path = /home/xstream/Pictures/anime/1345576.jpeg|" ~/.config/hypr/hyprlock.conf
