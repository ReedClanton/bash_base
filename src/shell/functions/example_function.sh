#!/usr/bin/env sh

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
#/	- Diffrent shells render special characters, like tab and new line,
#/		diffrently. Thus if this doc contains any special characters that have
#/		two backslashes, know that only one is intended.
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
#/	- 140: Returned when given option is invalid.
#/
#/ EXAMPLE(S):
#/	functionName --help
#/
#/ AUTHOR(S):
#/	- <authorName>
#/
#/ TODO(S):
#/	- TODO
EOF
)

functionName {
	# If the log function hasn't been sourced, do so now.
	if command -v log >/dev/null; then
		# TODO: Ensure all possible path(s) are checked.
		. $HOME/shell/shell_functions
	fi
	log -i -c=${FUNCNAME[0]} --full-title -m="<titleTextHere>"

	log -c=${FUNCNAME[0]} -m="Command setup..."
	# Determine current shell's readonly command.
	useReadonly=true
	if command -v readonly >/dev/null; then
		alias readonly=$(command -v readonly)
		# Ensure readonly functions (doesn't on some shells [zsh]).
		readonlyTest="readonlyTest"
		readonly readonlyTest
		if [ "$readonlyTest" = "" ]; then
			unalias readonly
			useReadonly=false
		fi
	fi
	log -c=${FUNCNAME[0]} -m="Commands setup."

	log -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Logging var(s).
	traceLvl="-c=${FUNCNAME[0]}"
	if $useReadonly; then
		readonly traceLvl
	fi
	debugLvl="-d -c=${FUNCNAME[0]}"
	if $useReadonly; then
		readonly debugLvl
	fi
	infoLvl="-i -c=${FUNCNAME[0]}"
	if $useReadonly; then
		readonly infoLvl
	fi
	warnLvl="-w -c=${FUNCNAME[0]}"
	if $useReadonly; then
		readonly warnLvl
	fi
	errorLvl="-e -c=${FUNCNAME[0]}"
	if $useReadonly; then
		readonly errorLvl
	fi
	log $traceLvl -m="Local variable(s) reset."

	######################
	## Process Option(s) ##
	######################
	for fullArg in "$@"; do
		log $traceLvl -m="Processing option: '$fullArg'..."
		# Tracks value of current option.
		arg=${fullArg#*=}

		# Determine what option user gave.
		case $fullArg in
			-h|--help)
				echo "$FUNCTION_NAME_DOC"
				return 0
				;;
			*)
				log $errorLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
				echo "$FUNCTION_NAME_DOC"
				return 140
				;;
		esac
	done

	#########################
	## Error Check Input(s) ##
	#########################
	log $traceLvl -m="Ensuring all required argument(s) were given..."
	verifyInputProvided "$FUNCTION_NAME_DOC" "-a=$varHoldingValOfRequiredArg"
	rtVal=$?
	if [[ $rtVal -ne 0 ]]; then
		return $rtVal
	fi
	log $debugLvl -m="All required argument(s) were given."

	######################
	## Next Section Name ##
	######################
	
}

# TODO: Move to README.md.
# Allows calling of file's function(s) from the terminal (fileName.sh functionName args).
case "$1" in
    "")
    	;;
    example)
    	"$@"
    	exit  ;;
    *)
    	log_error "Unkown function: $1()"
    	exit 2  ;;
esac

# TODO: Move to README.md.
#How to call function/command and save off what it returnes, as well as it's std and err output:
```
cmd="Command you want to run here"
unset stdOut errOut rtOut
eval "$( (eval $cmd) \
	2> >(errOut=$(cat); typeset -p errOut) \
	 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
```

