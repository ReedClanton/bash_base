################
## Function(s) ##
################
T_CREATE_WINDOW_HOME_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Configures `home` TMUX window that's a part of session `$TEMP_SESSION_NAME`.
#/
#/ USAGE: tCreateWindowHome [SPECIAL_OPTION]
#/
#/ NOTE(S):
#/	- TMUX session `$TEMP_SESSION_NAME` must already exist and contain a window named 'home'.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- TMUX `home` window is created succesfully.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
#/	- 126: Returned when:
#/		- Any `tmux` command fails to execute.
#/
#/ EXAMPLE(S):
#/	tCreateWindowHome --help
#/	tCreateWindowHome -h
#/	tCreateWindowHome
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- None.
EOF
)

tCreateWindowHome() {
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
	windowName='home'
	# Command(s) run by top pane of window.
#	topPaneCmds="clear;neofetch;pwd;ls -GAp"
	# Height of buttom pane.
	bottomPaneHeight=24
	# Command(s) run by bottom pane.
	bottomPaneCmds='bashtop'
	# Pane selected at end.
	paneSelected="0.0"
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
				echo "$T_CREATE_WINDOW_HOME_DOC"
				return 0
				;;
			*)
				log $ERROR_LVL -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_CREATE_WINDOW_HOME_DOC" >&2
				return 140
				;;
		esac
	done

	#######################
	## Setup Window: Home ##
	#######################
	## Top Pane Setup ##
	log $TRACE_LVL -m="Sending command(s): 'clear;neofetch;pwd;ls -GAp' to '$windowName' window..."
	unset stdOutAll
	stdOutAll=$(tmux send-keys -t $TEMP_SESSION_NAME:$windowName 'clear;neofetch;pwd;ls -GAp' Enter 2>&1)

	if [ $? -eq 0 ]; then
		## Bottom Pane Creation & Setup ##
		log $TRACE_LVL -m="Creating bottom pane in '$windowName' window of height: '$bottomPaneHeight'..."
		unset stdOutAll
		stdOutAll=$(tmux split-window -v -t $TEMP_SESSION_NAME:$windowName -l $bottomPaneHeight 2>&1)

		if [ $? -eq 0 ]; then
			log $TRACE_LVL -m="Sending command(s): '$bottomPaneCmds' to bottom pane of '$windowName' window..."
			unset stdOutAll
			stdOutAll=$(tmux send-keys -t $TEMP_SESSION_NAME:$windowName $bottomPaneCmds Enter 2>&1)

			if [ $? -eq 0 ]; then
				log $TRACE_LVL -m="Moving cursor to top pane of '$windowName' window..."
				unset stdOutAll
				stdOutAll=$(tmux select-pane -t $paneSelected 2>&1)
				if [ $? -eq 0 ]; then
					return 0
				else
					log $ERROR_LVL -m="Failed to select pane '$paneSelected' in session: '$TEMP_SESSION_NAME'."
				fi
			else
				log $ERROR_LVL -m="Failed to run '$bottomPaneCmds' in session/window: '$TEMP_SESSION_NAME'/'$windowName'."
			fi
		else
			log $ERROR_LVL -m="Failed to split window '$windowName' in session '$TEMP_SESSION_NAME'."
		fi
	else
		log $ERROR_LVL -m="Failed to run commands in session/window: '$TEMP_SESSION_NAME'/'$windowName'."
	fi
	return 126
}
