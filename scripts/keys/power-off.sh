#!/bin/sh

echo -e "power:\n(s)uspend\n(r)eboot\n(l)ogoff\n(p)oweroff\n(q)uit"
read -n1 CHOICE

case $CHOICE in
	"s")
		systemctl suspend
		;;
	"r")
		systemctl reboot
		;;
	"l")
		i3-msg exit || icesh logout
		;;
	"p")
		systemctl poweroff
		;;
esac

