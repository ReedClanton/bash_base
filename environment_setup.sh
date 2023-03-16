#! /bin/bash

# TODO: Comment.
declare -r BACK_UP_DIR="$PWD/userHomeBackUp-$(date +"%Y_%m_%d-%H_%M_%S")"

# List of users, specificly there UIDs, that script should be run as.
declare -ra INVALID_USERS="0 65534"
# Attempt to make sure script is being run as a real user.
if [[ " ${INVALID_USERS[*]} " =~ " $EUID " ]]; then
	echo "Script should be run using your user, not '$USER'."
	exit 21
else
	echo "Script is running as user '$USER'."
	
	# Ensure script is being run from the same location as it's located.
	if [[ "./$(basename $0)" != $0 ]]; then
		echo "Script must be run from the same directory it's located in."
		exit 22
	else
		echo "Script is running from the same directory it's located in."
		
		echo "Script will be removing important environment setup files. Prior to removal they'll be backed up to '$BACK_UP_DIR'."
		
		# Check if directory for backing up user's home directory files already exists.
		if [[ -d "$BACK_UP_DIR" ]]; then
			printf "Directory used to back up file(s) modified by this script already exists."
			exit 23
		else
			# Back up bash file(s) from user's home directory.
			mkdir $BACK_UP_DIR
			mv $HOME/.bash* $BACK_UP_DIR
		fi
		

		# TODO: Only run bellow when rest of script fails.
		# Remove files/directories created by this script from user's home directory.
		rm $HOME/.bashrc
		rm $HOME/.bash_profile
		# TODO: Un-comment when rest of this script is implemented.
		#rm -rf $HOME/bash
		# Restore user's original bash file(s).
		mv $BACK_UP_DIR/* $HOME/
		rm -rf $BACK_UP_DIR
	fi
fi



