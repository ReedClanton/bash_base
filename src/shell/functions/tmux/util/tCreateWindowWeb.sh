################
## Function(s) ##
################
T_CREATE_WINDOW_WEB_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Creates and configures a new window in the `$TEMP_SESSION_NAME` session
#/	at `$HOME` and launches the `lynx` terminal browser.
#/
#/ USAGE: tCreateWindowWeb [SPECIAL_OPTION] [OPTION]
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
#/	-w=<newWindowName>, --window-name=<newWindowName>
#/		Name of window to be created.
#/			- Note: Only the last value provided will be used.
#/		(REQUIRED)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- TMUX window containing a 'lynx' terminal browser is created succesfully.
#/	- 126: Returned when:
#/		- Any `tmux` command fails to execute.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
#/	- 142: Returned when:
#/		- Required option value isn't provided.
#/		- Required option value is invalid.
#/
#/ EXAMPLE(S):
#/	tCreateWindowWeb --help
#/	tCreateWindowWeb -h
#/	tCreateWindowWeb -w=web
#/	tCreateWindowWeb --window-name="web2"
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- Implement: Fix for logs that break input processing (see commented out line).
#/      - Implement: Convert window name option to argument.
EOF
)

tCreateWindowWeb() {
	log -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Logging constant(s).
	TRACE_LVL="-t -c=${FUNCNAME[0]}"
	DEBUG_LVL="-d -c=${FUNCNAME[0]}"
	INFO_LVL=" -i -c=${FUNCNAME[0]}"
	WARN_LVL=" -w -c=${FUNCNAME[0]}"
	ERROR_LVL="-e -c=${FUNCNAME[0]}"
	# Name of window being configured.
	windowName=""
	# Command(s) run by new window.
	windowCmds="lynx"
	log $TRACE_LVL -m="Local variable(s) reset."

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
				echo "$T_CREATE_WINDOW_WEB_DOC"
				return 0
				;;
			-w=* | --window-name=*)
#				log $DEBUG_LVL -m="Processing provied window name: '$arg'..."
				windowName="$arg"
				log $TRACE_LVL -m="Window name saved."
				;;
			*)
				log $ERROR_LVL --full-title -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_CREATE_WINDOW_WEB_DOC" >&2
				return 140
				;;
		esac
	done

	#########################
	## Error Check Input(s) ##
	#########################
	log $DEBUG_LVL -m="Ensuring all required options(s) were given..."
	verifyInputProvided "$T_CREATE_WINDOW_WEB_DOC" "--value=$windowName"
	if [ $? -eq 0 ]; then

		##################
		## Create Window ##
		##################
		cmd="tmux new-window -d -n $windowName -c $HOME -t $TEMP_SESSION_NAME"
		log $DEBUG_LVL -m="Creating window with command: '$cmd'..."
		unset stdOutAll stdRt
		stdOutAll=$(eval $cmd 2>&1)
		stdRt=$?
		if [ $stdRt -eq 0 ]; then

			#################
			## Setup Window ##
			#################
			cmd="tmux send-keys -t $TEMP_SESSION_NAME:$windowName $windowCmds Enter"
			log $DEBUG_LVL -m="Setting up window with command: '$cmd'..."
			unset stdOutAll stdRt
			stdOutAll=$(eval $cmd 2>&1)
			stdRt=$?
			if [ $stdRt -eq 0 ]; then

				cmd="tmux send-keys -t $TEMP_SESSION_NAME:$windowName Down Down Down Down Down Down Down Down Down Down Down"
				log $DEBUG_LVL -m="Sending keyboard input with command: '$cmd'..."
				unset stdOutAll stdRt
				stdOutAll=$(eval $cmd 2>&1)
				stdRt=$?
				if [ $stdRt -eq 0 ]; then
					return 0
				fi
			fi
		fi

		log $ERROR_LVL -m="Command: '$cmd' failed with error code: '$stdRt'."
		return 126
	fi
	return 142
}
