################
## Function(s) ##
################
T_CREATE_SESSION_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Create and configures a new session with `$TEMP_SESSION_NAME` that
#/	includes a window named `home` that starts at `$HOME`.
#/
#/ USAGE: tCreateSession [SPECIAL_OPTION] [OPTION]
#/
#/ NOTE(S):
#/	- TMUX session `$TEMP_SESSION_NAME` must *not* already exist.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ OPTION(S):
#/	--bottom-pane-command=<commandToRunInBottomPaneOfWindow>
#/		Command to be run in bottom pane of window created in new session.
#/			- Note: All commands should be provided at once.
#/			- Note: If ore than one is provided, the last will be used.
#/			- Default: `$DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS`.
#/		(OPTIONAL)
#/	--root-dir=<rootDirPathOfSessionWindow>
#/		Directory session's window will be rooted at (start at).
#/			- Note: Only one value should be provided.
#/			- Note: If more than one is provided, the last will be used.
#/			- Default: `$DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY`.
#/		(OPTIONAL)
#/	--top-pane-command=<commandToRunInTopPaneOfWindow>
#/		NOT IMPLEMENTED!!!!!!!!!!!!!!
#/		Command to be run in top pane of window created in new session.
#/			- Note: All commands should be provided at once.
#/			- Note: If more than one is provided, the last will be used.
#/			- Default: TODO: Implement usage of: `$DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS`.
#/		(OPTIONAL)
#/	--window-name=<windowName>
#/		Name of window to be created.
#/			- Note: Only one value should be provided.
#/			- Note: If more than one is provided, the last will be used.
#/			- Default: `$DEFAULT_NEW_SESSION_WINDOW_NAME`.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- TMUX `$TEMP_SESSION_NAME` session is created succesfully.
#/		- TMUX session named `$TEMP_SESSION_NAME` already exists and user
#/			chooses not to remove it.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
#/	- 126: Returned when:
#/		- Any `tmux` command fails to execute.
#/
#/ EXAMPLE(S):
#/	tCreateSession --help
#/	tCreateSession -h
#/	tCreateSession
#/	tCreateSession --session-root-dir="$HOME/some/path"
#/	tCreateSession -w="specialWindowName"
#/	tCreateSession --window-root-dir="/example/path"
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- Document: Update Return Code(s) section.
#/	- Implement: Fix for logs that break input processing (see commented
#/		out line in process options section).
#/	- Implement: Validate that provided window directory exists.
#/	- Implement: Validate that provided session directory exists.
#/	- Implement: Figure out how to set bottom pane height consistently
#/		(i.e. even when run in a freshly logged in tty terminal).
#/	- Implement: Sort out why window commands can't be stored in a variable
#/		prior to be executed when a command contains a space.
#/	- Implement: Once commands containing spaces may be run from variables,
#/		implement `--top-pane-command`.
EOF
)

tCreateSession() {
	log -t -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Name of window being configured.
	windowName="$DEFAULT_NEW_SESSION_WINDOW_NAME"
	# Root directory of window.
	windowRoot="$DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY"
	# Command(s) run by top pane of window.
#	topPaneCmds="$DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS"
	# Command(s) run by bottom pane.
	bottomPaneCmds='$DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS'
	# Height of buttom pane.
	finalBottomPaneHeight=24
	# Pane selected at end.
	selectedPane="0.0"
	log -t -c=${FUNCNAME[0]} -m="Local variable(s) reset."

	######################
	## Process Option(s) ##
	######################
	# Process option(s).
	for fullArg in "$@"; do
		# Tracks value of current option.
		arg=${fullArg#*=}

		# Determine what option user gave.
		case $fullArg in
			--bottom-pane-command=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provided bottom pane comand(s): '$arg'..."
				bottomPaneCmds="$arg"
				log -t -c=${FUNCNAME[0]} -m="Bottom pane commands saved."
				;;
			-h | --help)
				echo "$T_CREATE_SESSION_DOC"
				return 0
				;;
			--root-dir=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provided window root directory: '$arg'..."
				windowRoot="$arg"
				log -t -c=${FUNCNAME[0]} -m="New window root directory set."
				;;
#			--top-pane-command=*)
##				log -d -c=${FUNCNAME[0]} -m="Processing provided top pane comand(s): '$arg'..."
#				topPaneCmds="$arg"
#				log -t -c=${FUNCNAME[0]} -m="Top pane commands saved."
#				;;
			--window-name=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provided window namme: '$arg'..."
				windowName="$arg"
				log -t -c=${FUNCNAME[0]} -m="Window name set."
				;;
			*)
				log -e -c=${FUNCNAME[0]} -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_CREATE_SESSION_DOC" >&2
				return 140
				;;
		esac
	done

	#########################
	## Error Check Input(s) ##
	#########################
	log -d -c=${FUNCNAME[0]} -m="Ensuring all required options(s) were given..."
	unset stdRt
	verifyInputProvided "$T_CREATE_SESSION_DOC" "--value=$windowName" "--value=$windowRoot"
	stdRt=$?
	if [ $stdRt -eq 0 ]; then

		#############################
		## Remove Existing Sessions ##
		#############################
		cmd="tmux ls | grep '$TEMP_SESSION_NAME: '"
		log -d -c=${FUNCNAME[0]} -m="Checking for pre-existing temporary session named '$TEMP_SESSION_NAME'..."
		unset stdOutAll stdRt
		stdOutAll=$(eval $cmd 2>&1)
		stdRt=$?
		if [ $stdRt -ne 1 ]; then

			printf "A session named: '$TEMP_SESSION_NAME' already exists, would you like to remove it (Y/n): "
			read userAnswer
			if [ "$userAnswer" = "" ] || [ "$userAnswer" = "Y" ] || [ "$userAnswer" = "y" ]; then
				cmd="tmux kill-session -t $TEMP_SESSION_NAME"
				log -t -c=${FUNCNAME[0]} -m="Removing existing session with command: '$cmd'..."
				unset stdOutAll stdRt
				stdOutAll=$(eval $cmd 2>&1)
				stdRt=$?
				if [ $stdRt -eq 0 ]; then
					log -d -c=${FUNCNAME[0]} -m="Session removed."
				else
					log -e -c=${FUNCNAME[0]} -m="Command: '$cmd' failed to remove session with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
					return 3
				fi
			else
				log -w -c=${FUNCNAME[0]} -m="Not able to continue until existing session: '$TEMP_SESSION_NAME' is removed."
				return 0
			fi
		else
			log -t -c=${FUNCNAME[0]} -m="No session named: '$TEMP_SESSION_NAME' exists, continuing."
		fi

		###################
		## Create Session ##
		###################
		cmd="tmux new-session -d -s $TEMP_SESSION_NAME -n $windowName -c $windowRoot"
		log -d -c=${FUNCNAME[0]} -m="Creating new session with command: '$cmd'..."
		unset stdOutAll stdRt
		stdOutAll=$(eval $cmd 2>&1)
		stdRt=$?
		if [ $stdRt -eq 0 ]; then

			############################
			## Run Top Pane Command(s) ##
			############################
			cmd="tmux send-keys -t $TEMP_SESSION_NAME:$windowName 'clear;neofetch;pwd;ls -GAp' Enter"
			log -d -c=${FUNCNAME[0]} -m="Sending command(s) to top pane with command: '$cmd'..."
			unset stdOutAll stdRt
			stdOutAll=$(eval $cmd 2>&1)
			stdRt=$?
			if [ $stdRt -eq 0 ]; then

				#######################
				## Create Bottom Pane ##
				#######################
				cmd="tmux split-window -v -t $TEMP_SESSION_NAME:$windowName"
				log -d -c=${FUNCNAME[0]} -m="Creating bottom pane with command: '$cmd'..."
				unset stdOutAll stdRt
				stdOutAll=$(eval $cmd 2>&1)
				stdRt=$?
				if [ $stdRt -eq 0 ]; then

					###########################
					## Set Bottom Pane Height ##
					###########################
					# Note: Resizing offten fails, so rest of function doesn't require it.
					cmd="tmux display -p -t $TEMP_SESSION_NAME:0.1 '#{pane_height}'"
					log -t -c=${FUNCNAME[0]} -m="Getting bottom pane height with command: '$cmd'..."
					unset stdRt
					currentBottomPaneHeight=$(eval $cmd 2>&1)
					stdRt=$?
					if [ $stdRt -eq 0 ]; then

						# Check if pane height needs to be changed.
						if [ $currentBottomPaneHeight -ne $finalBottomPaneHeight ]; then
							log -d -c=${FUNCNAME[0]} -m="Changing height of bottom pane from '$currentBottomPaneHeight' to '$finalBottomPaneHeight'..."

							# Determine if height should be increased or decreased.
							if [ $currentBottomPaneHeight -lt $finalBottomPaneHeight ]; then
								changeBy=$(($finalBottomPaneHeight - $currentBottomPaneHeight))
								cmd="tmux resize-pane -t $TEMP_SESSION_NAME:0.1 -U $changeBy"
								log -d -c=${FUNCNAME[0]} -m="Increasing pane height by '$changeBy' from '$currentBottomPaneHeight' to '$finalBottomPaneHeight' with command: '$cmd'.."
							else
								changeBy=$(($currentBottomPaneHeight - $finalBottomPaneHeight))
								cmd="tmux resize-pane -t $TEMP_SESSION_NAME:0.1 -D $changeBy"
								log -d -c=${FUNCNAME[0]} -m="Decreasing pane height by '$changeBy' from '$currentBottomPaneHeight' to '$finalBottomPaneHeight' with command: '$cmd'.."
							fi

							# Change pane height.
							unset stdOutAll stdRt
							stdOutAll=$(eval $cmd 2>&1)
							stdRt=$?

							# Ensure pane height was changed.
							if [ $stdRt -eq 0 ]; then
								cmd="tmux display -p -t $TEMP_SESSION_NAME:0.1 '#{pane_height}'"
								log -t -c=${FUNCNAME[0]} -m="Getting bottom pane height with command: '$cmd'..."
								unset stdOutAll stdRt
								currentBottomPaneHeight=$(eval $cmd 2>&1)
								stdRt=$?
								if [ $stdRt -eq 0 ]; then

									# Ensure pane height was changed.
									if [ $currentBottomPaneHeight -ne $finalBottomPaneHeight ]; then
										log -w -c=${FUNCNAME[0]} -m="Attempted to set bottom panel height to: '$finalBottomPaneHeight', but failed. It's '$currentBottomPaneHeight'."
									fi
								else
									log -w -c=${FUNCNAME[0]} -m="Failed to get bottom pane height."
								fi
							else
								log -w -c=${FUNCNAME[0]} -m="Command: '$cmd' failed with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
							fi
						else
							log -t -c=${FUNCNAME[0]} -m="Bottom pane height won't be changed because it's already '$finalBottomPaneHeight'."
						fi
					else
						log -w -c=${FUNCNAME[0]} -m="Command: '$cmd' failed with error code: '$stdRt' and the bellow output:" -m="$currentBottomPaneHeight"
					fi

					###############################
					## Run Bottom Pane Command(s) ##
					###############################
					cmd="tmux send-keys -t $TEMP_SESSION_NAME:$windowName $bottomPaneCmds Enter"
					log -d -c=${FUNCNAME[0]} -m="Sending command(s) to bottom pane with command: '$cmd'..."
					unset stdOutAll stdRt
					stdOutAll=$(eval $cmd 2>&1)
					stdRt=$?
					if [ $stdRt -eq 0 ]; then

						###################
						## Selecting Pane ##
						###################
						cmd="tmux select-pane -t $selectedPane"
						log -d -c=${FUNCNAME[0]} -m="Moving cursor to '$selectedPane' pane with command: '$cmd'..."
						unset stdOutAll stdRt
						stdOutAll=$(eval $cmd 2>&1)
						stdRt=$?
						if [ $stdRt -eq 0 ]; then
							return 0
						fi
					fi
				fi
			fi
		fi
		log -e -c=${FUNCNAME[0]} -m="Command: '$cmd' failed with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
		return 126
	fi
	return 142
}
