# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcName="functionName"
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
FUNCTION_NAME_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	TODO
#/
#/ USAGE: functionName [SPECIAL_OPTION] [OPTIONS...] [ARGUMENTS...]
#/
#/ NOTE(S):
#/	- TODO
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ OPTION(S):
#/	-s=<someValue>, --some-option-name=<someValue>
#/		<optionDescriptionText>:
#/			- Note: <someNote>.
#/		(OPTIONAL/REQUIRED)
#/ 
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful.
#/	- 140: Returned when:
#/		- Given option name is invalid.
#/
#/ EXAMPLE(S):
#/	functionName --help
#/	functionName -h
#/
#/ AUTHOR(S):
#/	- <authorName>
#/
#/ TODO(S):
#/	- TODO
EOF
)

functionName {
	log -i -c=${FUNCNAME[0]} --full-title -m="<titleTextHere>"

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
	log $TRACE_LVL -m="Local variable(s) reset."

	######################
	## Process Option(s) ##
	######################
	for fullArg in "$@"; do
		log $TRACE_LVL -m="Processing option: '$fullArg'..."
		# Tracks value of current option.
		arg=${fullArg#*=}

		# Determine what option user gave.
		case $fullArg in
			-h|--help)
				echo "$FUNCTION_NAME_DOC"
				return 0
				;;
			*)
				log $ERROR_LVL --full-title -m="Invalid given argument: '$fullArg', see doc:"
				echo "$FUNCTION_NAME_DOC"
				return 140
				;;
		esac
	done

	#########################
	## Error Check Input(s) ##
	#########################
	log $TRACE_LVL -m="Ensuring all required argument(s) were given..."
	verifyInputProvided "$FUNCTION_NAME_DOC" "--value=$varHoldingValOfRequiredArg"
	if [ $? -ne 0 ]; then
		return 142
	fi
	log $DEBUG_LVL -m="All required argument(s) were given."

	######################
	## Next Section Name ##
	######################
	
}
