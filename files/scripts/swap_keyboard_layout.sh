current_layout=$(setxkbmap -query | grep layout | awk '{split($0,a," "); print a[2]}')

if [ "$current_layout" = "gb" ]; then
    echo "🇧🇷" > /home/nicolas/.current_keyboard_layout
    setxkbmap -model abnt2 -layout br -variant abnt2 && killall -SIGUSR1 i3status
else
    echo "🇬🇧" > /home/nicolas/.current_keyboard_layout
    setxkbmap -layout gb && killall -SIGUSR1 i3status
fi
