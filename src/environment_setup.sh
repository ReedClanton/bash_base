#! /bin/bash

# TODO: Add doc.

# Tracks directory that file(s)/directory(ies) being replaced will be moved to.
declare -r BACK_UP_DIR="$PWD/$USER-homeBackUp-$(date +"%Y_%m_%d-%H_%M_%S")"
# List of users, specificly there UIDs, that script should be run as.
declare -ra INVALID_USERS="0 65534"
# TODO: Comment.
declare -r LOG=$PWD/shell/functions/log.sh -c="environment_setup.sh"

# TODO: Set a default answer and make user input checking more robust.
# Ask user if the user that's currently running this script is the one they would like to setup.
printf "The user that's running this script ($USER) is the one that will have there environment setup./n"
printf "Would you like to run environment setup for '$USER' (y or n): "
read userAnswer
if [[ "$userAnswer" != "y" ]]; then
	exit 21
fi


# Ensure script is being run by a plausibly valid user.
if ! [[ " ${INVALID_USERS[*]} " =~ " $EUID " ]]; then
	# Ensure script is being run from the same location as it's located.
	if [[ "./$(basename $0)" == $0 ]]; then
		# Ensure directory for backing up user's environment config doesn't already exist.
		if [[ ! -d "$BACK_UP_DIR" ]]; then
			# Determine name of current shell.
			declare shellName=${SHELL#/*/*/*/*/}
			if [[ "$SHELL" = "$shellName" ]]; then
				shellName=${SHELL#/*/*/*/}
				if [[ "$SHELL" = "$shellName" ]]; then
					shellName=${SHELL#/*/*/}
					if [[ "$SHELL" = "$shellName" ]]; then
						shellName=${SHELL#/*/}
						if [[ "$SHELL" = "$shellName" ]]; then
							shellName=${SHELL#/}
						fi
					fi
				fi
			fi
			
			# Ensure shell name was found.
			if [[ "$SHELL" != "$shellName" && "$shellName" != "" ]]; then
				$LOG -i -m="Creating local directory for storing $USER's file(s) that are being replaced..."
				
				declare cmd="mkdir $BACK_UP_DIR"
				unset stdOut errOut rtOut
				eval "$( (eval $cmd) \
					2> >(errOut=$(cat); typeset -p errOut) \
					 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
			
				# Ensure directory for storring user's current environment setup was created.
				if [[ $rtOut -eq 0 ]]; then
					# Back up user's hidden shell file(s) if they exist.
					# TODO: Revert bellow home path and remove this comment.
					if compgen -G "$HOME/setupTest/.$shellName*" > /dev/null; then
						printf "Backing up '$HOME/.$shellName*' files to '$BACK_UP_DIR'...\n"
						# TODO: Revert bellow home path and remove this comment.
						declare cmd="mv $HOME/setupTest/.$shellName* $BACK_UP_DIR/"
						unset stdOut errOut rtOut
						eval "$( (eval $cmd) \
							2> >(errOut=$(cat); typeset -p errOut) \
							 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
					else
						printf "No hidden shell file(s) to back up, skipping.\n"
						rtOut=0
					fi
					
					# Ensure hidden bash file(s) were moved to the back up directory.
					if [[ $rtOut -eq 0 ]]; then
						# Directories with the same name as the user's shell must be backed up because they'll be repalced by this script.
						# TODO: Revert bellow home path and remove this comment.
						if [[ -d "$HOME/setupTest/$shellName" ]]; then
							printf "Backing up shell directory '$HOME/$shellName' from $USER's home directory...\n"
							# TODO: Revert bellow home path and remove this comment.
							declare cmd="mv $HOME/setupTest/$shellName $BACK_UP_DIR/"
							unset stdOut errOut rtOut
							eval "$( (eval $cmd) \
								2> >(errOut=$(cat); typeset -p errOut) \
								 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
						else
							printf "No directory containing environment setup found in $USER's home, back up skipped.\n"
							rtOut=0
						fi
						
						# Ensure move worked.
						if [[ $rtOut -eq 0 ]]; then
							printf "Copying hidden shell setup file(s) from '$PWD/.shell*' file(s) to '$HOME/'...\n"
							
							for shellFilePath in $PWD/.shell*; do
								# TODO: Revert bellow home path and remove this comment.
								newShellFilePath=$HOME/setupTest/.$shellName${shellFilePath#$PWD/.shell}
								printf "Copying '$shellFilePath' to '$newShellFilePath'...\n"
								declare cmd="cp $shellFilePath $newShellFilePath"
								unset stdOut errOut rtOut
								eval "$( (eval $cmd) \
									2> >(errOut=$(cat); typeset -p errOut) \
									 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
								# Stop copying files if a copy fails.
								if [[ $rtOut -ne 0 ]]; then
									printf "Failed to move '$shellFilePath' to '$newShellFilePath'.\n"
									break
								fi
							done
							
							# Ensure hidden shell file(s) were moved.
							if [[ $rtOut -eq 0 ]]; then
								printf "Copying '$PWD/$shellName' to '$HOME/'...\n"
								# TODO: Revert bellow home path and remove this comment.
								declare cmd="cp -r $PWD/shell $HOME/setupTest/$shellName"
								unset stdOut errOut rtOut
								eval "$( (eval $cmd) \
									2> >(errOut=$(cat); typeset -p errOut) \
									 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
								# Ensure shell directory copy worked.
								if [[ $rtOut -eq 0 ]]; then
									printf "Success!\n"
									exit 0
								else
									printf "Failed to copy directory with shell scripts to $USER's home.\n"
								fi
								
								# Remove shell directory that copy failed for.
								# TODO: Revert bellow home path and remove this comment.
								if [[ -d "$HOME/setupTest/$shellName" ]]; then
									printf "Removing '$HOME/$shellName...\n"
									# TODO: Revert bellow home path and remove this comment.
									declare cmd="rm -rf $HOME/setupTest/$shellName"
									unset stdOut errOut rtOut
									eval "$( (eval $cmd) \
										2> >(errOut=$(cat); typeset -p errOut) \
										 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
									# Check if deletion worked.
									if [[ $rtOut -ne 0 ]]; then
										printf "Failed to revert environment, you'll need to manually copy contents of '$BACK_UP_DIR' back to '$HOME'.\n"
										exit 28
									fi
								else
									printf "Skipping removal of '$shellName' directory from $USER's home because it doesn't exist.\n"
								fi
								
								# Check if back up contains a shell directory.
								if [[ -d "$BACK_UP_DIR/$shellName" ]]; then
									printf "Copying '$shellName' directory to $USER's home from back up copy...\n"
									# Copy old shell directory back.
									# TODO: Revert bellow home path and remove this comment.
									declare cmd="cp -r $BACK_UP_DIR/$shellName $HOME/setupTest/"
									unset stdOut errOut rtOut
									eval "$( (eval $cmd) \
										2> >(errOut=$(cat); typeset -p errOut) \
										 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
									# Check if deletion worked.
									if [[ $rtOut -ne 0 ]]; then
										printf "Failed to revert environment, you'll need to manually copy contents of '$BACK_UP_DIR' back to '$HOME'.\n"
										exit 29
									fi
								else
									printf "Skipping copying '$shellName' directory from back up because the back up doesn't contain it.\n"
								fi
							else
								printf "Failed to move hidden shell file(s) to $USER's home.\n"
							fi
							
							# Remove hidden file(s) that were copied to user's home.
							# TODO: Revert bellow home path and remove this comment.
							declare cmd="rm $HOME/setupTest/.$shellName*"
							unset stdOut errOut rtOut
							eval "$( (eval $cmd) \
								2> >(errOut=$(cat); typeset -p errOut) \
								 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
							# Stop copying files if a copy fails.
							if [[ $rtOut -ne 0 ]]; then
								printf "Failed to move '$shellFilePath' to '$newShellFilePath'.\n"
								exit 30
							fi
							
							# TODO: Comment.
							if compgen -G "$BACK_UP_DIR/.*" > /dev/null; then
								printf "Copying hidden shell file(s) from back up to $USER's home...\n"
								# Copy backed up files to user's home.
								# TODO: Revert bellow home path and remove this comment.
								declare cmd="cp $BACK_UP_DIR/.* $HOME/setupTest/"
								unset stdOut errOut rtOut
								eval "$( (eval $cmd) \
									2> >(errOut=$(cat); typeset -p errOut) \
									 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
								# Stop copying files if a copy fails.
								if [[ $rtOut -ne 0 ]]; then
									printf "Failed to move hidden files from '$BACK_UP_DIR' back to $USER's home, you'll need to manually copy contents.\n"
									exit 31
								fi
							else
								printf "Skipping copying of hidden shell file(s) because the back up doesn't contain any.\n"
							fi

						else
							printf "Failed to back up (move) '$HOME/$shellName' to '$BACK_UP_DIR/'.\n"
						fi
						
						# Attempt to move shell directory back to user's home.
						if [[ -d "$BACK_UP_DIR/$shellName" ]]; then
							# TODO: Revert bellow home path and remove this comment.
							declare cmd="cp -r $BACK_UP_DIR/$shellName $HOME/setupTest/"
							unset stdOut errOut rtOut
							eval "$( (eval $cmd) \
								2> >(errOut=$(cat); typeset -p errOut) \
								 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
							# Check if deletion worked.
							if [[ $rtOut -ne 0 ]]; then
								printf "Failed to revert environment, you'll need to manually copy contents of '$BACK_UP_DIR' back to '$HOME'.\n"
								exit 28
							fi
						fi
					else
						printf "Failed to back up (move) '$HOME/.$shellName*' file(s) to '$BACK_UP_DIR'.\n"
					fi
					
					# Ensure any file(s) that were moved from user's home are moved back.
					if compgen -G "$BACK_UP_DIR/.$shellName*" > /dev/null; then
						# TODO: Revert bellow home path and remove this comment.
						declare cmd="cp $BACK_UP_DIR/.* $HOME/setupTest/"
						unset stdOut errOut rtOut
						eval "$( (eval $cmd) \
							2> >(errOut=$(cat); typeset -p errOut) \
							 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
						# Check if deletion worked.
						if [[ $rtOut -ne 0 ]]; then
							printf "Failed to revert environment, you'll need to manually copy contents of '$BACK_UP_DIR/' back to '$HOME/'.\n"
							exit 27
						fi
					fi
				else
					printf "Failed to create directory for backing up $USER's data.\n"
					exit 26
				fi
			else
				printf "Failed, couldn't determine shell name from \$SHELL ($SHELL).\n"
				exit 25
			fi
		else
			printf "Failed because back up directory '$BACK_UP_DIR' already exists.\n"
			exit 24
		fi
	else
		printf "Failed, script must be run from the same directory it's located in.\n"
		exit 23
	fi
else
	printf "Failed, script must be run using your user, not '$USER'.\n"
	exit 22
fi

