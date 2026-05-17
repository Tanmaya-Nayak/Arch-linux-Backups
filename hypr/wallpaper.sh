#!/bin/bash
pkill swaybg 2>/dev/null
swaybg -i /home/xstream/Pictures/Wallpapers/archwall.jpg -m fill &
sed -i "s|path = .*|path = /home/xstream/Pictures/Wallpapers/archwall.jpg|" ~/.config/hypr/hyprlock.conf
