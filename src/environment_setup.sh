#!/usr/bin/env sh

# TODO: Add doc.

# Tracks directory that file(s)/directory(ies) being replaced will be moved to.
declare -r BACK_UP_DIR="$PWD/userHomeBackUp-$(date +"%Y_%m_%d-%H_%M_%S")"
# List of users, specificly there UIDs, that script should be run as.
declare -ra INVALID_USERS="0 65534"

# Attempt to make sure script is being run as a real user.
if [[ " ${INVALID_USERS[*]} " =~ " $EUID " ]]; then
	printf "Script should be run using your user, not '$USER'.\n"
	exit 21
else
	# Ensure script is being run from the same location as it's located.
	if [[ "./$(basename $0)" != $0 ]]; then
		printf "Script must be run from the same directory it's located in.\n"
		exit 22
	else
		printf "Script will be removing important environment setup files.\n"
		printf "Prior to removal they'll be backed up to '$BACK_UP_DIR'.\n"
		
		# Check if directory for backing up user's home directory files already exists.
		if [[ -d "$BACK_UP_DIR" ]]; then
			printf "Directory used to back up file(s) modified by this script already exists.\n"
			exit 23
		else
			printf "Backing up bash file(s) from $USER's home directory ($HOME)...\n"
			# TODO: Check if mkdir command worked, if not, exit.
			mkdir $BACK_UP_DIR
			# TODO: Check if move was successful, if it's not, exit.
			mv $HOME/.bash* $BACK_UP_DIR
			
			printf "Backing up bash directory(ies) from $USER's home directory ($HOME)...\n"
			# TODO: Check if move was successful, if it's not, log it.
			mv $HOME/bash $BACK_UP_DIR
			
			printf "Copying file(s) to '$HOME'...\n"
			cp $PWD/.* $HOME/
			
			printf "Copying directory(ies) to '$HOME'...\n"
			if [[ -d "$HOME/bash" ]]; then
				printf "Directory named 'bash' already exists in '$HOME'...\n"
			else
				cp -r $PWD/shell $HOME/bash
				printf "Success!\n"
				exit 0
			fi
		fi
		
		printf "Something went wrong!\n"
		printf "Removing file(s)/directory(ies) created by this script from $USER's home directory ($HOME)...\n"
		# TODO: Ensure that the bellow files were created prior to this script running before removing them.
		rm $HOME/.bashrc
		rm $HOME/.bash_profile
		rm -r $HOME/bash

		printf "Restoring $USER's original bash file(s)...\n"
		mv $BACK_UP_DIR/* $HOME/
		exit 24
	fi
fi

