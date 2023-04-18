echo "WinDroiD v1.7.1"
echo "latest version contributors : AKPR2007,Exanoff12"
echo "preparing to start process"
sleep 6s
clear
cd ~
echo "checking if termux version is supported"
sleep 3s
if [ -n "$TERMUX_VERSION" ]; then
	pwd
	MIN_VERSION=0.117
	CHECK_VERSION=$(awk 'BEGIN{ print "'$TERMUX_VERSION'">="'$MIN_VERSION'" }')
	if [ "$CHECK_VERSION" -eq 1 ]; then
		echo "setting up storage access"
		sleep 3s
		if [ -d "storage" ]; then
			echo "internal storage access already given. skipping step"
		else
			echo "please give internal storage access"
			termux-setup-storage
		fi
		sleep 3s
		clear
		echo "fixing nested directories"
		sleep 3s
		if [ -d "storage" ]; then
			echo "fixing successful"
		else
			echo "fixing unsuccessful. did you deny the storage permission from the before step?"
			echo "exiting with error. clear all data of termux from device settings and try again :("
			exit 1
		fi
		sleep 3s
		clear
		echo "downloading files from external server"
		sleep 3s
		wget -O w7.zip "http://192.168.137.1/WinDroiD/w7.zip"
		clear
		echo "finalising setup"
		sleep 3s
		unzip w7.zip
		rm w7.zip
		wget -O win7 "https://raw.githubusercontent.com/ElJoker63/WinDroiD/main/start.sh"
		chmod +x win7
		cd storage/shared
		mkdir WinDroiD
		cd WinDroiD
		wget -O DontRemoveThisFolder "https://raw.githubusercontent.com/ElJoker63/WinDroiD/main/blank"
		mkdir SharedDrive
		cd SharedDrive
		wget -O ThisIsTheSharedFolder "https://raw.githubusercontent.com/ElJoker63/WinDroiD/main/blank"
		cd ~
		clear
		echo "setting up is finished now run './win7' to start windows 7!"
		rm setup.sh
	else
		echo "termux version is unsupported. exiting with code 1. please download the latest version of termux from f-droid"
		exit 1
	fi
else
	echo "termux version is unsupported. exiting with code 1. please download the latest version of termux from f-droid. play store version is deprecated and will not work"
	exit 1
fi
