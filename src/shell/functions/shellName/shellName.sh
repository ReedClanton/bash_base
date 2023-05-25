# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcName="shellName"
if [ -f $PWD/util/main.sh ]; then
	inScriptSource $PWD/util/main.sh
elif [ -f $PWD/src/shell/functions/$funcName/util/main.sh ]; then
	inScriptSource $PWD/src/shell/functions/$funcName/util/main.sh
elif [ -f $HOME/shell/functions/$funcName/util/main.sh ]; then
	inScriptSource $HOME/shell/functions/$funcName/util/main.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcName/util/main.sh ]; then
		inScriptSource $SHELL_FUNCTIONS/$funcName/util/main.sh
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
SHELL_NAME_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Produces the name of shell that this code is running under to stdOut.
#/ 
#/ USAGE: shellName [SPECIAL_OPTION]
#/
#/ NOTE(S):
#/	- Different shells render special characters, like tab and new line,
#/		differently. Thus if this doc contains any special characters that have
#/		two backslashes, know that only one is intended.
#/	- Used by shell environment config file(s), thus the log() function can't be used.
#/	- Supported, and tested, shells:
#/		- bash:
#/			- Version: 5.2.15
#/			- Release: 3.fc38
#/			- Architecture: x86_64
#/		- dash:
#/			- Version: 0.5.11.5
#/			- Release: 3.fc38
#/			- Architecture: x86_64
#/		- ksh:
#/			- Version: 1.0.4
#/			- Release: 2.fc38
#/			- Architecture: x86_64
#/		- tcsh (compatible w/ csh):
#/			- Version: 6.24.07
#/			- Release: 2.fc38
#/			- Architecture: x86_64
#/		- zsh:
#/			- Version: 5.9
#/			- Release: 5.fc38
#/			- Architecture: x86_64
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0:
#/		- Returned when:
#/			- Help message is requested and produced.
#/			- Shell name has been found.
#/		- stdout:
#/			- Shell name or function doc.
#/		- stderr:
#/			- N/A.
#/	- 140:
#/		- Returned when:
#/			- Given option name is invalid.
#/		- stdout:
#/			- N/A
#/		- stderr:
#/			- Error logs & function doc.
#/	- 203:
#/		- Returned when:
#/			- Required system command wasn't usable.
#/		- stdout:
#/			- Best guess of shell name.
#/		- stderr:
#/			- Error logs.
#/	- 209:
#/		- Returned when:
#/			- Required system command wasn't usable *and* environment variables couldn't be found.
#/		- stdout:
#/			- N/A
#/		- stderr:
#/			- Error logs.
#/ 
#/ EXAMPLE(S):
#/	shellName
#/	shellName --help
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/ 
#/ TODO(S):
#/	- None
EOF
)

shellName() {
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Error prefix appended to error logs.
	shellNameLogPrefix="ERROR shellName():"
	if command -v date >/dev/null; then
		shellNameLogPrefix="$($(command -v date) +'%Y/%m/%d %I:%M:%S %Z') $shellNameLogPrefix"
	fi

	######################
	## Process Option(s) ##
	######################
	for fullArg in "$@"; do
		# Determine what option user gave.
		case $fullArg in
			-h | --help)
				echo "$SHELL_NAME_DOC"
				return 0
				;;
			*)
				echo "$shellNameLogPrefix Invalid given argument: '$fullArg', see doc:" >&2
				echo "$SHELL_NAME_DOC" >&2
				return 140
				;;
		esac
	done

	####################
	## Determine Shell ##
	####################
	if command -v ps >/dev/null; then
		# List of ps commands that may be used to get shell name. Different
		#	ones work on different shells.
		psCmdAdditionalOptions="<-ocommand=> <-ocmd=> <> "

		while [ "$psCmdAdditionalOptions" ]; do
			# Split out current loop's command option(s) from the rest.
			currentPsCmdOpt=${psCmdAdditionalOptions#*<}
			currentPsCmdOpt=${currentPsCmdOpt%%> *}
			# Remove current option(s) from the list.
			psCmdAdditionalOptions=${psCmdAdditionalOptions#*> }
			# Build and run current command.
			psCmdResult=$(ps -p$$ $currentPsCmdOpt) 2>/dev/null
			stdRt=$?

			# If command ran successfully, attempt to use output to determine current shell name.
			if [ $stdRt -eq 0 ]; then
				# Search for a recognized shell name.
				knownShellNames=$RECOGNIZED_SHELL_NAMES
				while [ "$knownShellNames" ]; do
					# Split out current shell name from the rest.
					currentShellName=${knownShellNames%%" "*}
					knownShellNames=${knownShellNames#*" "}

					# Check if current shell name is found in command output.
					if [ "${psCmdResult%%*"$currentShellName"*}" != "$psCmdResult" ]; then
						echo $currentShellName
						return 0
					fi
				done
			else
				echo "$shellNameLogPrefix ps command 'ps -p$$ $currentPsCmdOpt' returned code '$stdRt'." >&2
			fi
		done
	else
		echo "$shellNameLogPrefix Couldn't find way of getting shell name." >&2
		return 209
	fi
}

shellName
