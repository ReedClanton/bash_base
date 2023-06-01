################
## Function(s) ##
################
T_CREATE_WINDOW_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Creates and configures a new window in the `$TEMP_SESSION_NAME` session
#/	at `$HOME` (or `-l=<dirPath>`) and runs the `c` alias.
#/
#/ USAGE: tCreateWindow [SPECIAL_OPTION] [OPTION...]
#/
#/ NOTE(S):
#/	- TMUX session `$TEMP_SESSION_NAME` must already exist and there shouldn't
#/		already be a window with the provided name.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ OPTION(S):
#/	--window-command=<commandToRunInWindow>
#/		Command to be run in created window.
#/			- Note: All commands should be provided at once.
#/			- Note: If more than one is provided, the last will be used.
#/			- Default: The `c` alias.
#/		(OPTIONAL)
#/	--window-name=<newWindowName>
#/		Name of window to be created.
#/			- Note: Only the last value provided will be used.
#/		(REQUIRED)
#/	--location=<dirPath>
#/		Location window should be rooted at (start at).
#/			- Note: Default is `$HOME`.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- TMUX window at `$HOME` is created succesfully.
#/	- 126: Returned when:
#/		- Any `tmux` command fails to execute.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
#/	- 142: Returned when:
#/		- Required option value isn't provided.
#/		- Required option value is invalid.
#/
#/ EXAMPLE(S):
#/	tCreateWindow --help
#/	tCreateWindow -h
#/	tCreateWindow -w=home2
#/	tCreateWindow --window-name="git" -l=$GIT_ROOT
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- Implement: Fix for logs that break input processing (see commented out line in process options section).
#/      - Implement: Convert window name option to argument.
EOF
)

tCreateWindow() {
	log -t -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Name of window being configured.
	windowName=""
	# Root directory of new window.
	windowRoot=$HOME
	# Command(s) run by new window.
	windowCmds="c"
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
			-h | --help)
				echo "$T_CREATE_WINDOW_DOC"
				return 0
				;;
			--window-command=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provided window comand(s): '$arg'..."
				windowCmds="$arg"
				log -t -c=${FUNCNAME[0]} -m="Window commands saved."
				;;
			--window-name=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provied window name: '$arg'..."
				windowName="$arg"
				log -t -c=${FUNCNAME[0]} -m="Window name saved."
				;;
			--location=*)
#				log -d -c=${FUNCNAME[0]} -m="Processing provided window root path: '$arg'..."
				windowRoot="$arg"
				log -t -c=${FUNCNAME[0]} -m="Window root path saved."
				;;
			*)
				log -e -c=${FUNCNAME[0]} --full-title -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_CREATE_WINDOW_DOC" >&2
				return 140
				;;
		esac
	done

	#########################
	## Error Check Input(s) ##
	#########################
	log -d -c=${FUNCNAME[0]} -m="Ensuring all required options(s) were given..."
	verifyInputProvided "$T_CREATE_WINDOW_DOC" "--value=$windowName" "--value=$windowRoot"
	if [ $? -eq 0 ]; then

		##################
		## Create Window ##
		##################
		cmd="tmux new-window -d -n $windowName -c $windowRoot -t $TEMP_SESSION_NAME"
		log -d -c=${FUNCNAME[0]} -m="Creating window with command: '$cmd'..."
		unset stdOutAll stdRt
		stdOutAll=$(eval $cmd 2>&1)
		stdRt=$?
		if [ $stdRt -eq 0 ]; then

			#################
			## Setup Window ##
			#################
			cmd="tmux send-keys -t $TEMP_SESSION_NAME:$windowName $windowCmds Enter"
			log -d -c=${FUNCNAME[0]} -m="Setting up window with command: '$cmd'..."
			unset stdOutAll stdRt
			stdOutAll=$(eval $cmd 2>&1)
			stdRt=$?
			if [ $stdRt -eq 0 ]; then
				return 0
			fi
		fi

		log -e -c=${FUNCNAME[0]} -m="Command: '$cmd' failed with error code: '$stdRt'."
		return 126
	fi
	return 142
}
