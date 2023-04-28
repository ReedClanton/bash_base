CHECK_REQUIRED_OPTS_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	When given a message and any number of variable(s) (see '-a'), each
#/	variables will be checked to ensure it has been set to something, If it has
#/	not been, a code of '1' will be returned. If all given value(s) were set,
#/	a code of '0' will be returned.
#/
#/ USAGE: checkRequiredOpts "<callingFunctionDoc>" [OPTIONS]...
#/
#/ NOTE(S):
#/	- Method may not use the log function because this is used by that method.
#/
#/ ARGUMENT(S):
#/	"<CallingFuncDoc>"
#/		Message that should be produced if any of the following given argument(s) have
#/		not been set.
#/			- Note: This value *must* be surrounded with '"'
#/				(i.e. "$CHECK_MAIN_ARGS_DOC").
#/			- Note: This *must* be the first argument provided.
#/		(REQUIRED)
#/
#/ OPTION(S):
#/	-a=<val>, --arg=<val>
#/		Signifies some value is being given.
#/			- Note: Will return code '0' if all argument(s) have been set, '1'
#/				otherwise.
#/			- Note: Some special cases, such as arguments that contain spaces, may
#/				require the '"' around the entire argument
#/				(i.e. "-a=<specialCaseVal>").
#/			- Note: Some special cases, such as arguments that contain spaces, may
#/				require the offending value be surrounded with excapted '"' before
#/				and after the value (i.e. -a=\"argValWith spaces\").
#/			- Note: In addition to the above, some cases may *also* require the
#/				offending value be surrounded with excapted '" before and after
#/				the value (i.e. "-a=\"<specialCaseVal>\"').
#/		(REQUIRED)
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful.
#/	- 3: Returned when one or more of the options provided for error checking are invalid.
#/	- 140: Returned when given option name is invalid.
#/	- 142: TODO
#/	- 152: Returned when required argument (doc) isn't provided.
#/
#/ EXAMPLE(S):
#/	checkRequiredOpts --help
#/	checkRequiredOpts "$SOME_FUNCTION_DOC" -a=<requiredArgument1> "-a=<required ArgumentN>"
#/
#/ TODO(S):
#/	- None.
EOF
)

checkRequiredOpts() {
	###########################################
	## Special Case Processing of Help Option ##
	###########################################
	for fullArg in "$@"; do
		# Determine what type of value user gave.
		case $fullArg in
			-h | --help)
				echo "$CHECK_REQUIRED_OPTS_DOC"
				return 0
				;;
		esac
	done

	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Error prefix added to error output messages.
	checkRequiredOptsLogPrefix="ERROR checkRequiredOpts():"
	if command -v date >/dev/null; then
		checkRequiredOptsLogPrefix="$($(command -v date) +'%Y/%m/%d %H:%M:%S %Z') $checkRequiredOptsLogPrefix"
	fi

	##################################
	## Process Argument(s)/Option(s) ##
	##################################
	inputCount=0
	for fullArg in "$@"; do
		if [ $inputCount -eq 0 ]; then
			docString="$fullArg"
		else
			# Tracks value of current option.
			arg=${fullArg#*=}

			# Determine what type of value user gave.
			case $fullArg in
				-a=* | --arg=*)
					# Ensure all option(s) given have been set to something.
					if [ "$arg" = "" ]; then
						echo "$checkRequiredOptsLogPrefix Missing required value, see doc:" >&2
						echo "$docString" >&2
						return 3
					fi
					;;
				*)
					echo "$checkRequiredOptsLogPrefix Invalid option: '$fullArg', see doc:" >&2
					echo "$CHECK_REQUIRED_OPTS_DOC" >&2
					return 140
					;;
			esac
		fi
		inputCount=$(($inputCount + 1))
	done

	# Ensure at least one value was passed in.
	if [ $inputCount -lt 1 ]; then
		echo "$checkRequiredOptsLogPrefix Required argument wasn't provided, see doc:" >&2
		echo "$CHECK_REQUIRED_OPTS_DOC" >&2
		return 152
	elif [ $inputCount -lt 2 ]; then
		echo "$checkRequiredOptsLogPrefix Required option wasn't provided, see doc:" >&2
		echo "$CHECK_REQUIRED_OPTS_DOC" >&2
		return 142
	fi
	return 0
}
