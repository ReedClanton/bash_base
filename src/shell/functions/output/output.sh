# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcName="output"
if [ -f $PWD/util/main.sh ]; then
	inScriptSource $PWD/util/main.sh
elif [ -f $PWD/src/shell/functions/$funcName/util/main.sh ]; then
	inScriptSource $PWD/src/shell/functions/$funcName/util/main.sh
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
OUTPUT_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Used to produce formatted output.
#/		- Example 1:
#/			 ############
#/			## --pretty ##
#/			 ############
#/		- Example 2:
#/			## --pre-post-fix ##
#/
#/ USAGE: output [OPTIONS]... -m="message text"...
#/
#/ NOTE(S):
#/	- Method may not use the log function because this is used by that method.
#/
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/	-m=<msg>, --msg=<msg>
#/		Message user would like formatted output produced of.
#/			- Note: If multiple are given, each will show up on a new line.
#/			- Note: If one line exceeds the set max line length, it will be
#/				broken up. The rest of the line will start with the same
#/				inditation.
#/			- Note: '\t' and '\n\ will be handled as the 'printf' function would.
#/			- Note: At least one instance of this option must be provided.
#/			- Note: All provided values may be blank if desired.
#/		(REQUIRED)
#/	-p, --pretty
#/		When given, message produced will include a header, footer, prefix, and postfix.
#/			- Note: Does the same as giving: --header-footer, and --pre-post-fix.
#/			- Note: When given: --p, --header-footer, and --pre-post-fix become
#/				redundant.
#/		(OPTIONAL)
#/	--pp, --pre-post-fix
#/		When given, message produced will include a prefix and postfix.
#/			- Note: Redundant if -p.
#/		(OPTIONAL)
#/	-l=<maxLineLength>, --line-length=<maxLineLength>
#/		Sets max number of characters that may be included on a single line.
#/			- Note: Line length includes prefix and postfix if included.
#/			- Note: Default value: 100.
#/		(OPTIONAL)
#/	--header-footer
#/		When given, message produced will include a header and footer.
#/			- Note: Redundant if -p given.
#/		(OPTIONAL)
#/	-f=<formattingCharacter>, --formatting-character=<formattingCharacter>
#/		Sets character used by header, footer, prefix, and postfix.
#/			- Note: Default value: $DEFAULT_CHAR.
#/			- Note: Some special characters may require two to be given (ex. -f="%%").
#/			- Note: Some *other* special characters may not work at all (ex. back slash).
#/		(OPTIONAL)
#/	--indent=<numSpacesToIndent>
#/		Sets number of spaces formatted message, including
#/		prefix/postfix/header/footer if used, should be indented.
#/			- Note: Default value: $DEFAULT_INDENT.
#/			- Note: Must be a positive integer.
#/		(OPTIONAL)
#/	-t, --trace
#/		When given, *trace* formatting character ($TRACE_CHAR) is used as formatting character.
#/			- Note: If the formatting character isn't set, and no level is
#/				provided (ex. debug, error), then the default formatting
#/				character ($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-d, --debug
#/		When given, *debug* formatting character ($DEBUG_CHAR) is used as
#/		formatting character.
#/			- Note: If the formatting character isn't set, and no level is
#/				provided (ex. debug, error), then the default formatting
#/				character ($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-i, --info
#/		When given, *info* formatting character ($INFO_CHAR) is used as
#/		formatting character.
#/			- Note: If the formatting character isn't set, and no level is
#/				provided (ex. debug, error), then the default formatting
#/				character ($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-w, --warn
#/		When given, *warn* formatting character ($WARN_CHAR) is used as
#/		formatting character.
#/			- Note: If the formatting character isn't set, and no level is
#/				provided (ex. debug, error), then the default formatting
#/				character ($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-e, --error
#/		When given, *error* formatting character ($ERROR_CHAR) is used as
#/		formatting character.
#/			- Note: If the formatting character isn't set, and no level is
#/				provided (ex. debug, error), then the default formatting
#/				character ($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful.
#/	- 3: Returned when header/footer fails to be generated.
#/	- 140: Returned when given option name is invalid.
#/	- 141: Returned when:
#/		- Provided indent value is negative.
#/		- Provided max line length value is too small:
#/			- Line length - prefix - postfix > 0.
#/	- 142: Returned when the message text option is not provided.
#/
#/ EXAMPLE(S):
#/	output --help
#/	output -m="line 1" -m="line 2" -m="line 3\nline 4" -m="line 5"
#/	output -m="line 1" -m="longline 2" -l=6
#/	output -m="line 1" -m="longline 2" -l=10 -p
#/	output -m="line 1" -m="longline 2" -l=10 --pre-post-fix --header-footer
#/	output -m="line 1" --pretty --error
#/	output -m="line 1" -p -w
#/	output -m="line 1" -p -f="^"
#/	output -m="line 1" -p --formatting-character="&&"
#/
#/ TODO(S):
#/	- Implement: Dynamically determine, based on last character of line being
#/		split up, if a '-' is needed.
#/	- Implement: Ability to append end of line that was too long to fit on one
#/		row to the start of the next line.
#/	- Implement: Support for '%' as a formatting character.
EOF
)

output() {
	################################
	## Reset/Set Local Variable(s) ##
	################################
	# Tracks character used to insert a new line.
	newLine="\n"
	# Tracks delimiter character used to split up provided message text.
	delm=$newLine
	# Tracks character used for formatting.
	fChar=$DEFAULT_CHAR
	# Determines if message header and footer should be used.
	headerFooter=false
	# If header/footer is being used, it's stored in here once created.
	headerFooterTxt=""
	# Determines if message prefix and postfix should be used.
	prePostFix=false
	# Tracks message indent.
	indent=$DEFAULT_INDENT
	# Tracks max allowed line length.
	maxAlwLineLen=$DEFAULT_LINE_LENGTH
	# Tracks length of longest given line.
	maxGvnLineLen=0
	# Used to track max length any line of message is allowed to be based on:
	#	- Max allowed line length.
	#	- Minus prefix length (if used).
	#	- Minus postfix length (if used).
	maxAlwMsgLen=0
	# Used to track each line of message.
	msg=""
	# Contains final (formatted) message text.
	rtOutput=""
	# Tracks if prefix is being used.
	prefixUsed=false
	# Error prefix added to error output messages.
	outputLogPrefix="ERROR output():"
	if command -v date >/dev/null; then
		outputLogPrefix="$($(command -v date) +'%Y/%m/%d %H:%M:%S %Z') $outputLogPrefix"
	fi
	# Tracks if caller provided a message option so correct return value may be provided.
	msgGiven=false

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
				echo "$OUTPUT_DOC"
				return 0
				;;
			-f=* | --formatting-character=*)
				# Ensure a valid value was provided.
				case "$arg" in
					*\\* | "" | %)
						echo "$outputLogPrefix Formatting character may not be blank, a special character (ex. new line, tab), or '%', was '$arg'. See doc:" >&2
						echo "$OUTPUT_DOC" >&2
						return 141
						;;
					*)
						fChar=$arg
						;;
				esac
				;;
			-t | --trace)
				fChar=$TRACE_CHAR
				;;
			-d | --debug)
				fChar=$DEBUG_CHAR
				;;
			-i | --info)
				fChar=$INFO_CHAR
				;;
			-w | --warn)
				fChar=$WARN_CHAR
				;;
			-e | --error)
				fChar=$ERROR_CHAR
				;;
			--header-footer)
				headerFooter=true
				;;
			--indent=*)
				# Strip space character(s) from argument.
				arg=$(echo $arg | tr -d '[:space:]')
				# Ensure provided indent is valid.
				case "$arg" in
					# TODO #45: Figure out how to remove this hard coded line
					# length digit limit. Then update tests to verify it.
					[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9] | [0-9][0-9][0-9][0-9][0-9])
						indent=$arg
						;;
					*)
						echo "$outputLogPrefix Indent must be a non-negative integer, was '$arg', see doc:" >&2
						echo "$OUTPUT_DOC" >&2
						return 141
						;;
				esac
				;;
			-l=* | --line-length=*)
				# Strip space character(s) from argument.
				arg=$(echo $arg | tr -d '[:space:]')
				# Ensure provided value is valid.
				case "$arg" in
					# TODO #45: Figure out how to remove this hard coded line
					# length digit limit. Then update tests to verify it.
					[1-9] | [0-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-9][0-9][0-9][0-9][0-9])
						maxAlwLineLen=$arg
						;;
					*)
						echo "$outputLogPrefix Line length must be a positive integer, was '$arg', see doc:" >&2
						echo "$OUTPUT_DOC" >&2
						return 141
						;;
				esac
				;;
			-m=* | --msg=*)
				# Track the fact that the message option was provided so if no text
				# was, then the correct error message and return value will be provided.
				msgGiven=true
				# Every message option provided results in at least one line of output. Then save off provided message.
				arg=$arg$delm; msg=$msg$arg
				# Update longest provided line (if needed).
				while [ "$arg" ]; do
					# Split out current loop's line from the rest.
					line=${arg%%"$delm"*}; arg=${arg#*"$delm"}
					# Track length of longest given line.
					if [ ${#line} -gt $maxGvnLineLen ]; then
						maxGvnLineLen=${#line}
					fi
				done
				;;
			-p | --pretty)
				# Use all formatting.
				headerFooter=true
				prePostFix=true
				;;
			--pp | --pre-post-fix)
				# Use post/pre fix formatting.
				prePostFix=true
				;;
			*)
				echo "$outputLogPrefix Calling function provided invalid option: '$fullArg', see doc:" >&2
				echo "$OUTPUT_DOC" >&2
				return 140
				;;
		esac
	done

	############################
	## Error Check Argument(s) ##
	############################
	# Used to track max number of message character(s) that be exist on each line (accounts for pre/post fix).
	maxAlwMsgLen=$maxAlwLineLen

	## Ensure Message Text Option was Provided ##
	if $msgGiven; then
		# Remove indent value from max message character(s) per line.
		if [ $indent -gt 0 ]; then
			maxAlwMsgLen=$(($maxAlwMsgLen - $indent))
		fi

		# Remove prefix & postfix length from max message character(s) per line.
		if $prePostFix; then
			maxAlwMsgLen=$(($maxAlwMsgLen - $(($((${#fChar} + 1)) * 2))))
		fi

		## Verify Max Message Character(s) Per Line is Valid ##
		if [ $maxAlwMsgLen -lt 1 ]; then
			# Build helpful error message(s).
			errMsg="$outputLogPrefix Max line length ($maxAlwLineLen) is too short to contain any characters. Try:"
			echo $errMsg >&2

			# Max line length related messages.
			if [ $maxAlwLineLen -ne $DEFAULT_LINE_LENGTH ] && [ $DEFAULT_LINE_LENGTH -lt $maxAlwLineLen ]; then
				errMsg="$outputLogPrefix     Using the default line length value (DEFAULT_LINE_LENGTH: '$DEFAULT_LINE_LENGTH') by not passing in '--line-length' or '-l'"
				echo $errMsg >&2
			elif [ $maxAlwLineLen -eq $DEFAULT_LINE_LENGTH ]; then
				errMsg="$outputLogPrefix     Increase default line length (DEFAULT_LINE_LENGTH) value up from '$DEFAULT_LINE_LENGTH'"
				echo $errMsg >&2
			fi
			errMsg="$outputLogPrefix     Pass in larger max line length value (ex. '--line-length=$(($maxAlwLineLen + 50))')"

			# Indent related messages.
			if [ $indent -ne $DEFAULT_INDENT ] && [ $DEFAULT_INDENT -lt $indent ]; then
				errMsg="$outputLogPrefix     Using the default indent value (DEFAULT_INDENT: '$DEFAULT_INDENT') by not passing in '--indent'"
				echo $errMsg >&2
			elif [ $indent -eq $DEFAULT_INDENT ]; then
				errMsg="$outputLogPrefix     Decrease default indent value (DEFAULT_INDENT: '$DEFAULT_INDENT')"
				echo $errMsg >&2
			fi
			if [ $indent -gt 0 ]; then
				errMsg="$outputLogPrefix     Pass in smaller indent value (ex. '--indent=0')"
				echo $errMsg >&2
			fi

			# Formatting related messages.
			if $prePostFix; then
				errMsg="$outputLogPrefix     Not using a pre-fix and post-fix by not passing in: '-p', '--pretty', '--pp', or '--pre-post-fix'"
				echo $errMsg >&2
				if [ "$fChar" != "$DEFAULT_CHAR" ] && [ ${#fChar} -gt ${#DEFAULT_CHAR} ]; then
					errMsg="$outputLogPrefix     Using the default formatting character (DEFAULT_CHAR: '$DEFAULT_CHAR') by not passing in any formatting character"
					echo $errMsg >&2
				elif [ "$fChar" = "$DEFAULT_CHAR" ] && [ ${#DEFAULT_CHAR} -gt 1 ]; then
					errMsg="$outputLogPrefix     Decrease length of default formatting character (DEFAULT_CHAR: '$DEFAULT_CHAR')"
					echo $errMsg >&2
				fi
				if [ ${#fChar} -gt 1 ]; then
					errMsg="$outputLogPrefix     Using a shorter formatting character (ex. '--formatting-character=#')"
					echo $errMsg >&2
				fi
			fi

			# Produce doc.
			echo "$OUTPUT_DOC" >&2

			# Determine most correct return code, and exit.
			if [ $maxAlwMsgLen -lt 0 ]; then
				maxAlwMsgLen=0
			fi
			# Indent must be greater than zero for the return code to be determined by it.
			if [ $indent -ge $maxAlwMsgLen ] && [ $indent -gt 0 ]; then
				if [ $indent -gt $DEFAULT_INDENT ]; then
					return 141
				else
					return 200
				fi
			# Max line length will determine return code.
			elif [ $maxAlwLineLen -lt $DEFAULT_LINE_LENGTH ]; then
				return 141
			else
				return 200
			fi
		fi
	else
		echo "$outputLogPrefix Message option must be provided, see doc:" >&2
		echo "$OUTPUT_DOC" >&2
		return 142
	fi

	#########################
	## Format Given Message ##
	#########################
	## Generate indentation text ##
	indentTxt=$(printf %${indent}s |tr " " " ")

	## Split Long Lines ##
	# Determine if any lines given are long enough to require splitting.
	if [ $maxGvnLineLen -gt $maxAlwMsgLen ]; then
		# Temporarily tracks line(s) of message as it's broken up.
		tmpMsg=""
		# Break up lines of provided message if they're too long.
		while [ "$msg" ]; do
			# Split out current loop's line from the rest.
			line=${msg%%"$delm"*}; msg=${msg#*"$delm"}
			# Break line up if needed.
			while [ ${#line} -gt $maxAlwMsgLen ]; do
				# Append portion of current line that's within line length limit.
				tmpMsg=$tmpMsg$(echo "$line" | cut -c 1-$maxAlwMsgLen)$delm
				# Remove portion of line that's already been appended.
				line=$(echo "$line" | cut -c $(($maxAlwMsgLen + 1))-${#line})
			done
			# Append remaining portion of line.
			if [ ${#line} -gt 0 ]; then
				tmpMsg=$tmpMsg$line$newLine
			fi
		done
		# Copy broken up message back.
		msg=$tmpMsg

		# Update longest given line.
		maxGvnLineLen=$maxAlwMsgLen
	fi

	## Generate Header/Footer ##
	# Determine if header/footer is needed.
	if $headerFooter; then
		# Call function that creates header/footer.
		if $prePostFix; then
			cmd="createHeaderFooter --prefix -l=$maxGvnLineLen -f='$fChar'"
		else
			cmd="createHeaderFooter -l=$maxGvnLineLen -f='$fChar'"
		fi
		unset stdOut stdErr stdRt
		stdOut=$(eval "$cmd" 2>|stdErr.txt); stdRt=$?
		# Save off stderr and remove temporary file used to store it.
		stdErr=$(cat stdErr.txt)
		rm ./stdErr.txt

		# Ensure header/footer was generated successfully.
		if [ $stdRt -eq 0 ]; then
			# Save off header/footer.
			if [ ! -z "$indentTxt" ]; then
				headerFooterTxt="$indentTxt$stdOut$newLine"
			else
				headerFooterTxt="$stdOut$newLine"
			fi
		else
			echo "$outputLogPrefix createHeaderFooter() failed to create header/footer text. stdErr bellow:" >&2
			echo "$stdErr" >&2
			return 3
		fi
	fi

	##########################
	## Produce Final Message ##
	##########################
	## Header ##
	if $headerFooter; then
		rtOutput=$rtOutput$headerFooterTxt
	fi

	## Add Message, Prefix, & Postfix ##
	while [ "$msg" ]; do
		# Split out current loop's line from the rest.
		line=${msg%%"$delm"*}; msg=${msg#*"$delm"}

		# Determine if prefix is needed.
		rtOutput=$rtOutput$indentTxt
		if $prePostFix; then
			rtOutput="$rtOutput$fChar "
		fi

		# Add current line of message.
		rtOutput=$rtOutput$line

		# Determine if postfix is needed.
		if $prePostFix; then
			# Add lines after message so postfix characters line up.
			j=${#line}
			while [ $j -lt $maxGvnLineLen ]; do
				j=$((j + 1))
				rtOutput="$rtOutput "
			done
			# Add postfix character.
			rtOutput="$rtOutput $fChar$newLine"
		else
			rtOutput=$rtOutput$newLine
		fi
	done

	## Footer ##
	if $headerFooter; then
		rtOutput=$rtOutput$headerFooterTxt
	fi

	## Write Final Message ##
	printf "$rtOutput"
}
