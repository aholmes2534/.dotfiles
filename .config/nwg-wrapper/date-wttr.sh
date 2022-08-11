#!/usr/bin/env bash

time=$(LC_ALL=C TZ='Australia/Melbourne' date +'%A, %d. %B')
wttr=$(curl https://wttr.in/?format=1)
echo '<span size="35000" foreground="#998000">'$time'</span><span size="30000" foreground="#ccc">'
echo $wttr'</span>'
