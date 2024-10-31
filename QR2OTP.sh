#!/bin/sh

err_msg() {
	echo "This script uses:"
	echo
	echo "dragon - to drag pictures on it if possible"
	echo "grim - to capture screen"
	echo "slurp - to select area to capture"
	echo "zbarimg - to convert QR to outauth"
	echo "pass otp - to store OTP in storage"
	echo
	echo "if you see this message, you don't have some of above installed"
	exit 1
}

to_zbarimg()
{
	if [ -z "$(which zbarimg 2>/dev/null)" ]
	then
		err_msg
	else
		# Get picture and decode it with zbar, remove first of decoded
		zbarimg -q - | cut -d':' -f2-
	fi
}

capture()
{
	if [ -z "$(which grim 2>/dev/null)" ] || [ -z "$(which slurp 2>/dev/null)" ]
	then
		err_msg
	else
		# Capture selected area and send to zbarimg
		grim -g "$(slurp)" - | to_zbarimg
	fi
}

dragon()
{
	if [ -z "$(which dragon-drop 2>/dev/null)" ]
	then
		err_msg
	else
		# Accept QR as picture if possible and send to zbarimg
		dragon-drop --target --and-exit | to_zbarimg
	fi
}
