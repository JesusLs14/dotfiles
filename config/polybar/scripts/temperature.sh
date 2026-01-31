#!/bin/bash

temp=$(sensors | awk '/Tctl/ {gsub("\\+|°C","",$2); print int($2)}')

if [ -z "$temp" ]; then
  echo "N/A"
elif [ "$temp" -lt 55 ]; then
  echo "%{F#8ec07c}🌡 ${temp}°C%{F-}"   # verde
elif [ "$temp" -lt 70 ]; then
  echo "%{F#fabd2f}🌡 ${temp}°C%{F-}"   # amarillo
else
  echo "%{F#fb4934}🌡 ${temp}°C%{F-}"   # rojo
fi
