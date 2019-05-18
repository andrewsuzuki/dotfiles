#!/bin/bash
#
# Shell script to install or uninstall the firmware file which has to be uploaded to the USB chip of the Fractal Audio Systems Axe-FX II via fxload
# and to create, modify or delete the udev rules file which runs fxload each time an Axe-FX II is connected to a USB port.
#
# (C) Joachim Gahl - 29.12.2011; 02.11.2012; 17.02.2013

# SourceFiles
axefx2loadFW=axefx2load.hex				# firmware file to be uploaded to the USB chip of the Axe-FX II
udev_rules=55-fractalaudio.rules			# udev rules file for Fractal Audio Systems devices which gets filled with a rule (see 'axefx2_rule' below) to run fxload when an Axe-FX II is connected via USB

# DestinationDirs
axefx2loadFW_dir=/usr/share/usb/FractalAudio/axefx2	# directory to store firmware for use with fxload
udev_rules_dir=/etc/udev/rules.d			# directory of udev rules

# Rules file header
header='# fractalaudio.rules - udev rules for uploading USB firmware to Fractal Audio Systems devices'

# Text attributes
bold=`tput bold`
normal=`tput sgr0`

# Messages
fail_msg='Installation failed. Press any key...'
cancel_msg='Installation cancelled. Press any key...'

# Functions
get_fxload_path ()
{
	read answer
	until [ -f $answer ] && [ ! ${#answer} -eq 0 ]; do
		echo -e "\nThe specified path or file does not exist. Press [y] if you would like to enter another path to fxload or any other key to cancel."
		read -n 1 -s answer
		case $answer in
		"y"|"Y")
			echo -e "\nPlease enter the complete path to fxload including the binary's name: "
			read answer
			;;
		 *)
			echo -e "\n\n$cancel_msg"
			read -n 1 -s
			exit
			;;
		esac
	done
	fxload_path="$answer"
}

reload_udevrules ()
{
	udevadm control --reload-rules			# the command to reload udev rules can vary between different LINUX distributions, so
	if [ $? -ne 0 ]; then				# if it fails the user will have to restart udev or the computer to refresh udev
		echo -e "\nThe command ${bold}udevadm control --reload_rules${normal} to reload the udev rules failed. Please restart udev or your computer."
	fi
}

# Main
case $1 in
"-u")										# option "-u": uninstall
	echo -e "\n${bold}Uninstall Fractal Audio Systems USB Bootloader${normal}\n\nPress [y] to remove the Fractal Audio Systems Axe-FX II bootloader firmware and udev rules file or any other key to cancel."
	read -n 1 -s answer
	case $answer in
	"y"|"Y")
		rm -r "$axefx2loadFW_dir"					# delete directory with firmware for Axe-FX II
		if [ `ls -a "${axefx2loadFW_dir%/*}" | wc -l` -le 2 ]; then	# (only) if the directory /usr/share/usb/FractalAudio is emtpy,
			rm -r "${axefx2loadFW_dir%/*}"				# also delete directory /usr/share/usb/FractalAudio
		fi
		if [ ! ${#2} -eq 0 ]; then					# if next to the option -u a second parameter has been passed,
			udev_rules_dir=$2					# set this parameter's content as the udev rules dir
		fi
		until [ -f $udev_rules_dir/$udev_rules ]; do			# test if the udev rules file exists in default udev rules directory
			echo -e "\nThe udev rules file ${bold}$udev_rules${normal} has not been found. Press [y] to proceed with entering the appropriate path or press any other key to skip."
			read -n 1 -s answer
			case $answer in
			"y"|"Y")
				echo -e "\nPlease enter the complete path to the udev rules file ${bold}$udev_rules${normal}: "
				read udev_rules_dir
				if [ "${udev_rules_dir:(-1)}" == "/" ]; then	# if entered path ends with "/"
					udev_rules_dir=${udev_rules_dir:0:${#udev_rules_dir} - 1}	# remove last "/" for further processing
				fi
				;;
			*)
				echo -e "\n\n$cancel_msg"
				read -n 1 -s
				exit
				;;
			esac
		done
		if ( grep -q "$header" "$udev_rules_dir/$udev_rules" ) && ( grep -q "# <Fractal Audio Systems Axe-FX II>" "$udev_rules_dir/$udev_rules" ) && ( grep -q 'ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2466", ATTR{idProduct}=="0003", RUN+=' "$udev_rules_dir/$udev_rules" ); then
			if [ `wc -l < $udev_rules_dir/$udev_rules` -eq 4 ]; then	#if udev rules file contains the Axe-FX II entry only
				rm "$udev_rules_dir/$udev_rules"		# delete udev rules file
			else							# otherwise ask...
				echo -e "\nThe file ${bold}$udev_rules${normal} is queued for deletion but has been altered. There might be another Fractal Audio Systems device still needing this file.\n\nPress [y] to delete it nevertheless, [m] to modify or any other key to keep it."
				read -n 1 -s answer
				case $answer in
				"m"|"M")					# choice "m": keep but modify the udev rules file content
					echo -e "\nRemoving Axe-FX II related entries from $udev_rules..."
					l=$(grep -n "# <Fractal Audio Systems Axe-FX II>" "$udev_rules_dir/$udev_rules")
					let start=${l%:*}-1
					let end=${l%:*}+1
					sed -i ""$start,$end"d" "$udev_rules_dir/$udev_rules"
					;;
				"y"|"Y")					# choice "y": delete udev rules file
					echo -e "\nDeleting $udev_rules..."
					rm "$udev_rules_dir/$udev_rules"
					;;
				*)						# choice "any other key": do nothing
					echo -e "\nKeeping $udev_rules..."
					;;
				esac
			fi
			if [ -f axefx2uninstall.sh ]; then			# if an uninstall script exists,
				rm axefx2uninstall.sh				# delete it
			fi
			reload_udevrules					# reload udev rules
			echo -e "\n\nUninstalling finished. Press any key..."
			read -n 1 -s
		fi
		;;
	*)
		echo -e "\n\nUninstalling cancelled. Press any key..."
		read -n 1 -s
		;;
	esac
	;;
"-h"|"--help")									# option "-h": show information
	echo -e "\nRunning this script without any option installs the Fractal Audio Systems USB bootloader firmware and udev rules files for the Axe-FX II.\n\nAdditionally fxload (http://sourceforge.net/projects/linux-hotplug/files/fxload/) is required to upload the firmware to the USB chip of the Fractal Audio Systems Axe-FX II each time it is connected via USB. This script will NOT install fxload!\n\nOptions:\n\t-u\t\tUninstall - removes the bootloader and udev rules files. The path to the udev rules files can be passed as a second optional parameter.\n\t\t\tFor more convenience run ${bold}axefx2uninstall.sh${normal} especially if the path to the udev rules files has been set manually during installation.\n\t-h or --help\tShows this text.\n\n${bold}Note:${normal} Install as well as uninstall actions require root permissions.\n\nPress any key..."
	read -n 1 -s
	;;
*)										# no or invalid option: install files
	echo -e "\n${bold}Install Fractal Audio Systems USB Bootloader${normal}\n\nPress any key to proceed with the Fractal Audio Systems Axe-Fx Software License Agreement. After reading it press [q].\n"
	read -n 1 -s
	less License
	cat License								# show Fractal Audio Systems License Agreement
	echo -e "\n\nPress [y] to accept the Fractal Audio Systems Axe-Fx Software License Agreement or any other key to cancel."
	read -n 1 -s answer
	case $answer in
	"y"|"Y")
		if [ ! -f $axefx2loadFW ]; then					# test if bootloader firmware file exists
			echo -e "\nThe bootloader firmware file ${bold}$axefx2loadFW${normal} has not been found.\n\n\n$fail_msg"
			read -n 1 -s
			exit
		fi
		until [ -d $udev_rules_dir ]; do				# test if the path to udev rules files exists
			echo -e "\nThe path ${bold}$udev_rules_dir/${normal} to the udev rules files has not been found. Press [y] to proceed with entering the appropriate path or press any other key to cancel."
			read -n 1 -s answer
			case $answer in
			"y"|"Y")
				echo -e "\nPlease enter the complete path to the udev rules files on your system: "
				read udev_rules_dir
				if [ "${udev_rules_dir:(-1)}" == "/" ]; then	# if entered path ends with "/"
					udev_rules_dir=${udev_rules_dir:0:${#udev_rules_dir} - 1}	# remove last "/" for further processing
				fi
				;;
			*)
				echo -e "\n\n$cancel_msg"
				read -n 1 -s
				exit
				;;
			esac
		done
		fxload_path=$(whereis -b fxload)				# search for the path to the fxload binary
		fxload_path="${fxload_path#*:}"
		fxload_path=${fxload_path:1:${#fxload_path}}
		if [ ${#fxload_path} -eq 0 ]; then				# if fxload has not been found...
			echo -e "\nTo upload the firmware to the USB chip of the Axe-FX II fxload (http://sourceforge.net/projects/linux-hotplug/files/fxload/) is required. fxload has not been found. Press [y] if you would like to enter the path to fxload or any other key to cancel."
			read -n 1 -s answer
			case $answer in
			"y"|"Y")
				echo -e "\nPlease enter the complete path to fxload including the binary's name: "
				get_fxload_path
				;;
			*)
				echo -e "\n\n$cancel_msg"
				read -n 1 -s
				exit
				;;
			esac
		elif [[ ${fxload_path/fxload} == */fxload ]]; then		# if more than one fxload has been found...
			echo -e "\nTo upload the firmware to the USB chip of the Axe-FX II fxload is required. fxload has been found in multiple locations, so you have to choose one of those:\n\n"$fxload_path"\n\nPlease enter the complete path to the desired fxload including the binary's name: "
			get_fxload_path
		fi
		mkdir -m 755 -p "$axefx2loadFW_dir"				# create directory /usr/share/usb/FractalAudio/axefx2 and make it readable for everybody
		chmod 755 "${axefx2loadFW_dir%/*}"				# make directory /usr/share/usb/FractalAudio readable for everybody as well
		cp "$axefx2loadFW" "$axefx2loadFW_dir"
		if [ $? -gt 0 ]; then
			echo -e "\n\n$fail_msg"
			read -n 1 -s
			exit
		fi
		chmod 644 "$axefx2loadFW_dir/$axefx2loadFW"			# make firmware file readable for everybody
		if [ ! -f "$udev_rules_dir/$udev_rules" ]; then			# if Fractal Audio udev rules file does not already exist
			echo -e $header > "$udev_rules_dir/$udev_rules"		# create udev rules file with header 
			if [ $? -gt 0 ]; then
				echo -e "\n$fail_msg"
				read -n 1 -s
				exit
			fi
			chmod 644 "$udev_rules_dir/$udev_rules"			# make udev rules file user readable
		fi
		if grep -q "# <Fractal Audio Systems Axe-FX II>" "$udev_rules_dir/$udev_rules"; then
			echo -e "\n\nA udev rule for the Fractal Audio Systems Axe-FX II is already present in ${bold}$udev_rules_dir/$udev_rules${normal}. This rule has neither been modified nor checked by this script. Please make sure the existing rule is working properly."
		else
			axefx2_rule='\n# <Fractal Audio Systems Axe-FX II>\nACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2466", ATTR{idProduct}=="0003", RUN+="'$fxload_path' -t fx2lp -I '$axefx2loadFW_dir/$axefx2loadFW' -D $env{DEVNAME}"'	# content of rules file section for Axe-FX II
			echo -e $axefx2_rule >> "$udev_rules_dir/$udev_rules"	# write Axe-FX II section into udev rules file
			if [ $? -gt 0 ]; then
				echo -e "\n$fail_msg"
				read -n 1 -s
				exit
			fi
			udevadm control --reload				# reload udev rules to get the Fractal Audio Systems rule recognized
		fi
		echo -e '#!/bin/bash\n#\n# Shell script to run axefx2setup.sh with the uninstall option -u passing the appropriate path to the udev rules file.\n# Note: This script needs to be in the same path as axefx2setup.sh!\n#\n# (C) Joachim Gahl - 29.12.2011\n\n./axefx2setup.sh -u' $udev_rules_dir > axefx2uninstall.sh			# create uninstall script
		chmod 744 axefx2uninstall.sh					# make uninstall script user readable and executable for root
		echo -e "\n\nInstallation finished. Press any key..."
		read -n 1 -s
		;;
	*)
		echo -e "\n\n$cancel_msg"
		read -n 1 -s
		;;
	esac
	;;
esac