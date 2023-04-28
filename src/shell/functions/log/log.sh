# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcName="log"
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
LOG_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Used to produce log messages. Current global log level, tracked by
#/	'SHELL_LOG_LEVEL', is used to determine if given message should be printed.
#/
#/ USAGE: log [SPECIAL_OPTION] [OPTIONS...] -m="message text"... [OPTIONS...]
#/
#/ NOTE(S):
#/	- Diffrent shells render special characters, like tab and new line,
#/		diffrently. Thus if this doc contains any special characters that have
#/		two backslashes, know that only one is intended.
#/	- Method may not use log()... hopfully it's obvious why.
#/	- If calling shell doesn't support `date` then logs won't include a time stamp.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/
#/ OPTION(S):
#/	-c=<functionName>, --caller=<functionName>
#/		Name of calling code (function).
#/			- Note: If not given, field won't be included in log message.
#/		(OPTIONAL)
#/	-m=<logMsg>, --msg=<logMsg>
#/		Message user would like log produced of.
#/			- Note: At least one of these is required. If multiple are given,
#/				each will show up on a new line.
#/		(REQUIRED)
#/	--line-title
#/		When given, resulting log text will include a prefix and postfix.
#/			- Note: Shouldn't be combined with any other title option.
#/			- Note: If no title option is given, then no prefix, postfis,
#/				header, or footer will be included in the resulting log text.
#/		(OPTIONAL)
#/	--full-title
#/		When given, resulting log text will include a prefix, postfix, header, and footer.
#/			- Note: Shouldn't be combined with any other title option.
#/			- Note: If no title option is given, then no prefix, postfis,
#/				header, or footer will be included in the resulting log text.
#/		(OPTIONAL)
#/	-t, --trace
#/		When given, the default *trace* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level ($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *trace*. This includes: trace,debug, info, warn, and error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(DEFAULT)
#/	-d, --debug
#/		When given, the default *debug* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level ($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *debug*. This includes: debug, info, warn, and error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(OPTIONAL)
#/	-i, --info
#/		When given, the default *info* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level ($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *info*. This includes: info, warn, and error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(OPTIONAL)
#/	-w, --warn
#/		When given, the default *warn* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level ($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *debug*. This includes: warn and error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(OPTIONAL)
#/	-e, --error
#/		When given, the default *error* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *error*. This includes: error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful
#/			- No arguments are provided.
#/	- 3: Returned when something went wrong (like what's listed bellow) but a log will still be produced:
#/		- Call to output() returned a non-zero return code:
#/			- Log will still be produced, but output() formatting won't be used.
#/	- 140: Returned when given option name is invalid.
#/	- 142: Returned when a required option is not provided.
#/
#/ EXAMPLE(S):
#/	log --help
#/	log -c=${FUNCNAME[0]} -m="line1\\nline2" -m="line3"
#/	log -d -c="$USER-terminal" -m="line1" -m="line2"
#/	log --error --line-title -m="line1" -m="line2"
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/
#/ TODO(S):
#/	- Check if I can use any sort of font formatting (ex. bold) in method description as printed by --help.
EOF
)

log() {
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Tracks character used to insert a new line.
	newLine="\n"
	# Tracks given log level.
	lvl=$TRACE
	# Tracks name of given log level.
	lvlNm="TRACE"
	# Tracks name of calling function.
	caller=""
	# Tracks if log message should be treated as a title (and what type).
	title=$NO_TITLE
	# Determine if current shell supports date command.
	dateSupported=false
	if command -v date >/dev/null; then
		dateSupported=true
	fi
	# Error prefix added to error output messages.
	logLogPrefix="ERROR log():"
	if $dateSupported; then
		logLogPrefix="$($(command -v date) +'%Y/%m/%d %H:%M:%S %Z') $logLogPrefix"
	fi
	# Used to build prefix to log message.
	pfix=""
	if $dateSupported; then
		pfix="$(date +"%Y/%m/%d %H:%M:%S %Z") "
	fi
	# Used to build final output message.
	msg=""

	######################
	## Process Option(s) ##
	######################
	for fullArg in "$@"; do
		# Tracks value of current option.
		arg=${fullArg#*=}

		# Determine what option user gave.
		case $fullArg in
			-c=* | --caller=*)
				caller=$arg
				;;
			-t | --trace) ;;
			-d | --debug)
				lvl=$DEBUG
				lvlNm=DEBUG
				;;
			-i | --info)
				lvl=$INFO
				lvlNm="INFO "
				;;
			-w | --warn)
				lvl=$WARN
				lvlNm="WARN "
				;;
			-e | --error)
				lvl=$ERROR
				lvlNm=ERROR
				;;
			-h | --help)
				echo "$LOG_DOC"
				return 0
				;;
			-m=* | --msg=*)
				msg=$msg$arg$newLine
				;;
			--full-title)
				title=$FULL_TITLE
				;;
			--line-title)
				title=$LINE_TITLE
				;;
			*)
				echo "$logLogPrefix $(output --pp -m="Calling function provided invalid option: '$fullArg', see doc:")" >&2
				echo "$LOG_DOC" >&2
				return 140
				;;
		esac
	done

	############################
	## Error Check Argument(s) ##
	############################
	stdErr=$({ checkRequiredOpts "$LOG_DOC" -a="$msg" >|/dev/null; } 2>&1)
	rtVal=$?
	if [ $rtVal -ne 0 ]; then
		echo "$logLogPrefix $stdErr" >&2
		return 142
	fi

	# Determine if log message should be output.
	if [ $SHELL_LOG_LEVEL -ge $lvl ]; then
		# Build Log Prefix #
		if [ "$caller" = "" ]; then
			pfix="$pfix$lvlNm:\t"
		else
			pfix="$pfix$lvlNm $caller:\t"
		fi

		# Determine how log message should be built.
		if [ $title -gt $NO_TITLE ]; then
			## Build Output Argument(s)/Option(s) ##
			outputCall="output --line-length=200"
			# Set level.
			if [ $lvl -eq $TRACE ]; then
				outputCall="$outputCall --trace"
			elif [ $lvl -eq $DEBUG ]; then
				outputCall="$outputCall --debug"
			elif [ $lvl -eq $INFO ]; then
				outputCall="$outputCall --info"
			elif [ $lvl -eq $WARN ]; then
				outputCall="$outputCall --warn"
			elif [ $lvl -eq $ERROR ]; then
				outputCall="$outputCall --error"
			fi
			# Add final argument/options to output() call.
			if [ $title -eq $FULL_TITLE ]; then
				outputCall="$outputCall --indent=4 --pretty"
			else
				outputCall="$outputCall --pre-post-fix"
			fi

			# Ensure output() was successful prior to incorporating its output into final result.
			unset stdOut stdRt
			stdOut=$(eval $outputCall --msg="${msg%*\\n}" 2>/dev/null)
			stdRt=$?

			# Check if output() succeeded.
			if [ $stdRt -eq 0 ]; then
				if [ $title -eq $FULL_TITLE ]; then
					msg="$pfix\n$stdOut"
				else
					msg="$pfix$stdOut"
				fi
			else
				echo "$logLogPrefix Call to output() failed with return code '$stdRt', log will be produced without title formatting." >&2
				printf "$pfix$msg"
				return 3
			fi
		else
			msg="$pfix$msg"
		fi

		# Output log.
		printf "$msg"
	fi
}
