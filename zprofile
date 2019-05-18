# .zprofile
# Sourced at login after .zshenv, but before .zshrc

# HiDPI stuff
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=2

# Autostart X at login
if [[ "$IS_LINUX" == "1" ]]
then
	if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
		exec startx
	fi
fi
