# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcDirName="tmux"
funcName="tCode"
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
T_CODE_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Creates and configures `code` TMUX session. This includes TMUX
#/	window(s) at `$HOME` and `$GIT_ROOT` as well as ones that contain
#/	terminal web browser(s).
#/
#/ USAGE: tCode [SPECIAL_OPTION]
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
#/	tCode --help
#/	tCode -h
#/	tCode
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- None.
EOF
)

tCode() {
	log -t -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Final tmux session name.
	finalTmuxSessionName="code"
	# Root path of window(s).
	rootDirectory="$HOME"
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
				echo "$T_CODE_DOC"
				return 0
				;;
			*)
				log -t -c=${FUNCNAME[0]} --full-title -m="Calling function provided invalid option: '$fullArg', see doc:"
				echo "$T_CODE_DOC" >&2
				return 140
				;;
		esac
	done

	##########################################
	## Create & Setup Session & First Window ##
	##########################################
	functionCall="tCreateSession"
	log -d -c=${FUNCNAME[0]} -m="Creating new session with 'home' window by calling '$functionCall'..."
	unset stdRt
	eval $functionCall
	stdRt=$?
	if [ $stdRt -eq 0 ]; then

		#################################
		## Create & Setup Window: Home2 ##
		#################################
		newWindowName="home2"
		functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory'"
		log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
		unset stdRt
		eval $functionCall
		stdRt=$?
		if [ $stdRt -eq 0 ]; then

			###############################
			## Create & Setup Window: Git ##
			###############################
			newWindowName="git"
			rootDirectory="$GIT_ROOT"
			functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory'"
			log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
			unset stdRt
			eval $functionCall
			stdRt=$?
			if [ $stdRt -eq 0 ]; then

				################################
				## Create & Setup Window: Git2 ##
				################################
				newWindowName="git2"
				functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory'"
				log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
				unset stdRt
				eval $functionCall
				stdRt=$?
				if [ $stdRt -eq 0 ]; then

					################################
					## Create & Setup Window: Git3 ##
					################################
					newWindowName="git3"
					functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory'"
					log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
					unset stdRt
					eval $functionCall
					stdRt=$?
					if [ $stdRt -eq 0 ]; then

						################################
						## Create & Setup Window: Git4 ##
						################################
						newWindowName="git4"
						functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory'"
						log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
						unset stdRt
						eval $functionCall
						stdRt=$?
						if [ $stdRt -eq 0 ]; then

							###############################
							## Create & Setup Window: Web ##
							###############################
							newWindowName="web"
							rootDirectory="$HOME"
							functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory' --window-command='lynx'"
							log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
							unset stdRt
							eval $functionCall
							stdRt=$?
							if [ $stdRt -eq 0 ]; then

								################################
								## Create & Setup Window: Web2 ##
								################################
								newWindowName="web2"
								functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory' --window-command='lynx'"
								log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
								unset stdRt
								eval $functionCall
								stdRt=$?
								if [ $stdRt -eq 0 ]; then

									################################
									## Create & Setup Window: Web3 ##
									################################
									newWindowName="web3"
									functionCall="tCreateWindow --window-name='$newWindowName' --location='$rootDirectory' --window-command='lynx'"
									log -d -c=${FUNCNAME[0]} -m="Creating '$newWindowName' window at '$rootDirectory' by calling '$functionCall'..."
									unset stdRt
									eval $functionCall
									stdRt=$?
									if [ $stdRt -eq 0 ]; then

										###################
										## Rename Session ##
										###################
										cmd="tmux rename-session -t $TEMP_SESSION_NAME $finalTmuxSessionName"
										log -d -c=${FUNCNAME[0]} -m="Renaming session with command: '$cmd'..."
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
										log -e -c=${FUNCNAME[0]} -m="Command: '$cmd' failed with with error code: '$stdRt' and the bellow output:" -m="$stdOutAll"
										return 126
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi
	log -e -c=${FUNCNAME[0]} -m="Function call: '$functionCall' failed resulting in error code: '$stdRt'."
	return 3
}
