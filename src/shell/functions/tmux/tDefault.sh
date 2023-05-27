# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcDirName="tmux"
funcName="tDefault"
if [ -f $PWD/util/main.sh ]; then
	inScriptSource $PWD/util/main.sh
elif [ -f $PWD/src/shell/functions/$funcDirName/util/main.sh ]; then
	inScriptSource $PWD/src/shell/functions/$funcDirName/util/main.sh
elif [ -f $HOME/shell/functions/$funcDirName/util/main.sh ]; then
	inScriptSource $HOME/shell/functions/$funcDirName/util/main.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcDirName/util/main.sh ]; then
		inScriptSource $SHELL_FUNCTIONS/$funcDirName/util/main.sh
	else
		echo "ERROR $funcName(): Couldn't find 'main.sh' file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName(): Couldn't find 'main.sh' file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

################
## Function(s) ##
################
T_DEFAULT_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	TODO
#/
#/ USAGE: tDefault [SPECIAL_OPTION]
#/
#/ NOTE(S):
#/	- TODO
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- TMUX session is created succesfully.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
#/	- 126: Returned when:
#/		- TODO
#/
#/ EXAMPLE(S):
#/	tDefault --help
#/	tDefault -h
#/	tDefault
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- Document: Return code(s).
#/	- Document: Description.
#/	- Document: Notes
#/	- Implement: Split out window creation: home[0-...]
#/	- Implement: Split out window creation: web[0-...]
#/	- Implement: Add logs.
EOF
)

tDefault() {
	log -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Logging var(s).
	TRACE_LVL="-c=${FUNCNAME[0]}"
	DEBUG_LVL="-d -c=${FUNCNAME[0]}"
	INFO_LVL="-i -c=${FUNCNAME[0]}"
	WARN_LVL="-w -c=${FUNCNAME[0]}"
	ERROR_LVL="-e -c=${FUNCNAME[0]}"
	# Final tmux session name.
	finalTmuxSessionName="default"
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
				echo "$T_DEFAULT_DOC"
				return 0
				;;
			*)
				log $ERROR_LVL -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_DEFAULT_DOC" >&2
				return 140
				;;
		esac
	done

	###################
	## Create Session ##
	###################
	log $TRACE_LVL -m="Creating new session named '$TEMP_SESSION_NAME'..."
        unset stdOutAll stdRt
	stdOutAll=$(tmux new-session -d -s $TEMP_SESSION_NAME -n home -c $HOME 2>&1)
        stdRt=$?

        if [ $stdRt -eq 0 ]; then
		#######################
		## Setup Window: Home ##
		#######################
		log $DEBUG_LVL -m="Calling tCreateWindowHome()..."
		unset stdOutAll stdRt
		stdOutAll=$(tCreateWindowHome 2>&1)
		stdRt=$?

	        if [ $stdRt -eq 0 ]; then
			#################################
			## Create & Setup Window: Home2 ##
			#################################
			tmux new-window -d -n home2 -c $HOME -t $TEMP_SESSION_NAME
			tmux send-keys -t $TEMP_SESSION_NAME:home2 'c' Enter

			#################################
			## Create & Setup Window: Home3 ##
			#################################
			tmux new-window -d -n home3 -c $HOME -t $TEMP_SESSION_NAME
			tmux send-keys -t $TEMP_SESSION_NAME:home3 'c' Enter

			#################################
			## Create & Setup Window: Home4 ##
			#################################
			tmux new-window -d -n home4 -c $HOME -t $TEMP_SESSION_NAME
			tmux send-keys -t $TEMP_SESSION_NAME:home4 'c' Enter

			###############################
			## Create & Setup Window: Web ##
			###############################
			tmux new-window -d -n web -c $HOME -t $TEMP_SESSION_NAME
			tmux send-keys -t $TEMP_SESSION_NAME:web 'lynx' Enter
			tmux send-keys -t $TEMP_SESSION_NAME:web Down Down Down Down Down Down Down Down Down Down Down

			################################
			## Create & Setup Window: Web2 ##
			################################
			tmux new-window -d -n web2 -c $HOME -t $TEMP_SESSION_NAME
			tmux send-keys -t $TEMP_SESSION_NAME:web2 'lynx' Enter
			tmux send-keys -t $TEMP_SESSION_NAME:web2 Down Down Down Down Down Down Down Down Down Down Down

			###################
			## Rename Session ##
			###################
			tmux rename-session -t $TEMP_SESSION_NAME $finalTmuxSessionName

			###########
			## Attach ##
			###########
			tmux attach -t $finalTmuxSessionName:home
		else
	                log $ERROR_LVL -m="tCreateWindowHome failed with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
			return 126
		fi
	else
		log $ERROR_LVL -m="Tmux session creation failed with code: '$stdRt' and the bellow output:" -m="$stdOutAll"
		return 126
	fi
}
