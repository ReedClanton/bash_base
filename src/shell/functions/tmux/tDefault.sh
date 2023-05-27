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
#/	Creates and configures `default` TMUX session. This includes TMUX
#/	window(s) at `$HOME` as well as window(s) that contain terminal web
#/	browser.
#/
#/ USAGE: tDefault [SPECIAL_OPTION]
#/
#/ NOTE(S):
#/	- None.
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
#/	- 3: Returned when:
#/		- Any shell util function call fails.
#/	- 126: Returned when:
#/		- Any `tmux` command fails to execute.
#/	- 140: Returned when:
#/		- Provided option name is invalid.
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
#/	- Implement: Remove existing temporary session.
EOF
)

tDefault() {
	log -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Logging var(s).
	TRACE_LVL="-t -c=${FUNCNAME[0]}"
	DEBUG_LVL="-d -c=${FUNCNAME[0]}"
	INFO_LVL=" -i -c=${FUNCNAME[0]}"
	WARN_LVL=" -w -c=${FUNCNAME[0]}"
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
				log $ERROR_LVL --full-title -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_DEFAULT_DOC" >&2
				return 140
				;;
		esac
	done

	#############################
	## Remove Existing Sessions ##
	#############################
#	log $TRACE_LVL -m="Checking for pre-existing temporary session..."
#	unset stdOutAll stdRt
#	stdOutAll=$(tmux ls 2>&1)
#	stdRt=$?
#	if [ $stdRt -eq 0 ]; then
		# Check if session with temporary name already exists.
		
#	else
		# TODO
#	fi

	###################
	## Create Session ##
	###################
	cmd="tmux new-session -d -s $TEMP_SESSION_NAME -n home -c $HOME"
	log $DEBUG_LVL -m="Creating new session with command: '$cmd'..."
        unset stdOutAll stdRt
	stdOutAll=$(eval $cmd 2>&1)
        stdRt=$?
        if [ $stdRt -eq 0 ]; then

		#######################
		## Setup Window: Home ##
		#######################
		functionCall="tConfigureWindowHome"
		log $DEBUG_LVL -m="Configuring 'home' window by calling '$functionCall'..."
		unset stdOutAll stdRt
		stdOutAll=$(eval $functionCall 2>&1)
		stdRt=$?
	        if [ $stdRt -eq 0 ]; then

			#################################
			## Create & Setup Window: Home2 ##
			#################################
			createWindow="home2"
			functionCall="tCreateWindowHome --window-name='$createWindow'"
			log $DEBUG_LVL -m="Creating '$createWindow' window by calling '$functionCall'..."
			unset stdOutAll stdRt
			stdOutAll=$(eval $functionCall 2>&1)
			stdRt=$?
			if [ $stdRt -eq 0 ]; then

				#################################
				## Create & Setup Window: Home3 ##
				#################################
				createWindow="home3"
				functionCall="tCreateWindowHome --window-name='$createWindow'"
				log $DEBUG_LVL -m="Creating '$createWindow' by calling '$functionCall'..."
				unset stdOutAll stdRt
				stdOutAll=$(eval $functionCall 2>&1)
				stdRt=$?
				if [ $stdRt -eq 0 ]; then

					#################################
					## Create & Setup Window: Home4 ##
					#################################
					createWindow="home4"
					functionCall="tCreateWindowHome --window-name='$createWindow'"
					log $DEBUG_LVL -m="Creating '$createWindow' by calling '$functionCall'..."
					unset stdOutAll stdRt
					stdOutAll=$(eval $functionCall 2>&1)
					stdRt=$?
					if [ $stdRt -eq 0 ]; then

						###############################
						## Create & Setup Window: Web ##
						###############################
						createWindow="web"
						functionCall="tCreateWindowWeb --window-name='$createWindow'"
						log $DEBUG_LVL -m="Creating '$createWindow' by calling '$functionCall'..."
						unset stdOutAll stdRt
						stdOutAll=$(eval $functionCall 2>&1)
						stdRt=$?
						if [ $stdRt -eq 0 ]; then

							################################
							## Create & Setup Window: Web2 ##
							################################
							createWindow="web2"
							functionCall="tCreateWindowWeb --window-name='$createWindow'"
							log $DEBUG_LVL -m="Creating '$createWindow' by calling '$functionCall'..."
							unset stdOutAll stdRt
							stdOutAll=$(eval $functionCall 2>&1)
							stdRt=$?
							if [ $stdRt -eq 0 ]; then

								###################
								## Rename Session ##
								###################
								cmd="tmux rename-session -t $TEMP_SESSION_NAME $finalTmuxSessionName"
								log $DEBUG_LVL -m="Renaming session with command: '$cmd'..."
								unset stdOutAll stdRt
								stdOutAll=$(eval $cmd 2>&1)
								stdRt=$?
								if [ $stdRt -eq 0 ]; then

									###########
									## Attach ##
									###########
									cmd="tmux attach -t $finalTmuxSessionName:home"
									unset stdOutAll stdRt
									stdOutAll=$(eval $cmd 2>&1)
									stdRt=$?
									if [ $stdRt -eq 0 ]; then
										return 0
									fi
								fi

								log $ERROR_LVL -m="Command: '$cmd' failed with with error code: '$stdRt' and output:" -m="$stdOutAll"
								return 126
							fi
						fi
					fi
				fi
			fi

			log $ERROR_LVL -m="'$functionCall' failed to create and configure window '$createWindow' with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
			return 3
		else
	                log $ERROR_LVL -m="'$functionCall' failed to configure window with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
			return 3
		fi
	else
		log $ERROR_LVL -m="Tmux session creation failed with code: '$stdRt' and the bellow output:" -m="$stdOutAll"
		return 126
	fi
}
