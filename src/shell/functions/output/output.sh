# Needed so unit tests can mock out sourced file(s).
if [ "$(type -t inScriptSource)" = "" ]; then
	inScriptSource() { . "${@}"; }
fi

 #############
## Import(s) ##
 #############
if [ -f $PWD/util/main.sh ]; then
	inScriptSource $PWD/util/main.sh
elif [ -f $PWD/src/shell/functions/output/util/main.sh ]; then
	inScriptSource $PWD/src/shell/functions/output/util/main.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/output/util/main.sh ]; then
		inScriptSource $SHELL_FUNCTIONS/output/util/main.sh
	else
		echo "ERROR output(): Couldn't find 'main.sh' file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR output(): Couldn't find 'main.sh' file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

 ###############
## Function(s) ##
 ###############
IFS='' read -r -d '' OUTPUT_DOC <<"EOF"
#/ DESCRIPTION:
#/	Used to produce formatted output.
#/		- Example 1:
#/			 #############
#/			## Some Text ##
#/			 #############
#/		- Example 2:
#/			## Some Text ##
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
#/				broken up. The est of the line will start with the same
#/				inditation.
#/			- Note: '\t' and '\n\ will be handled as the 'printf' function would.
#/			- Note: At least one instance of this option must be provided.
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
#/		- No message text is provided.
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

 ###############################
## Reset/Set Local Variable(s) ##
 ###############################
# Tracks character used for formatting.
fChar=$DEFAULT_CHAR
# Determines if message header and footer should be used.
headerFooter=false
# If header/footer is being used, it's stored in here once created.
headerFooterTxt=''
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
msg=()
# Contains final (formatted) message text.
rtOutput=''
# Prefix used to produce error logs.
if [ "$(type -t date)" = "" ]; then
	outputLogPrefix="ERROR output():"
else
	outputLogPrefix="$(date +'%Y/%m/%d %H:%M:%S %Z') ERROR output():"
fi
readonly outputLogPrefix
# Used to track if caller provided a message option so correct return value may be provided.
msgGiven=false

 #####################
## Process Option(s) ##
 #####################
# Process option(s).
for fullArg in "${@}"; do
	# Tracks value of current option.
	arg=${fullArg#*=}
	
	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$OUTPUT_DOC"
			exit 0  ;;
		-f=*|--formatting-character=*)
			# Ensure a valid value was provided.
			case "$arg" in
				*\\*|""|%)
					echo "$outputLogPrefix Formatting character may not be blank, a special character (ex. new line, tab), or '%', was '$arg'. See doc:" >&2
					echo "$OUTPUT_DOC" >&2
					exit 141  ;;
				*)
					fChar=$arg  ;;
			esac  ;;
		-t|--trace)
			fChar=$TRACE_CHAR  ;;
		-d|--debug)
			fChar=$DEBUG_CHAR  ;;
		-i|--info)
			fChar=$INFO_CHAR  ;;
		-w|--warn)
			fChar=$WARN_CHAR  ;;
		-e|--error)
			fChar=$ERROR_CHAR  ;;
		--header-footer)
			headerFooter=true  ;;
		--indent=*)
			# Strip space character(s) from argument.
			arg=$(echo $arg | tr -d '[:space:]')
			# Ensure provided indent is valid.
			case "$arg" in
				# TODO: Figure out how to remove this hard coded line length digit limit. Then update tests to verify it.
				[[:digit:]]|[[:digit:]][[:digit:]]|[[:digit:]][[:digit:]][[:digit:]]|[[:digit:]][[:digit:]][[:digit:]][[:digit:]]|[[:digit:]][[:digit:]][[:digit:]][[:digit:]][[:digit:]])
					indent=$arg  ;;
				*)
					echo "$outputLogPrefix Indent must be a non-negative integer, was '$arg', see doc:" >&2
					echo "$OUTPUT_DOC" >&2
					exit 141  ;;
			esac  ;;
		-l=*|--line-length=*)
			# Strip space character(s) from argument.
			arg=$(echo $arg | tr -d '[:space:]')
			# Ensure provided value is valid.
			case "$arg" in
				# TODO: Figure out how to remove this hard coded line length digit limit. Then update tests to verify it.
				[1-9]|[[:digit:]][[:digit:]]|[1-9][[:digit:]][[:digit:]]|[1-9][[:digit:]][[:digit:]][[:digit:]]|[1-9][[:digit:]][[:digit:]][[:digit:]][[:digit:]])
					maxAlwLineLen=$arg  ;;
				*)
					echo "$outputLogPrefix Line length must be a positive integer, was '$arg', see doc:" >&2
					echo "$OUTPUT_DOC" >&2
					exit 141  ;;
			esac  ;;
		-m=*|--msg=*)
			msgGiven=true
			# Determine if given line contains newline character.
			if [[ $arg == *"\\n"* ]]; then
				# Split line at new line character, then save each line.
				delm='\n'
				input=$arg$delm
				while [[ $input ]]; do
					# Track current line and update for next.
					line="${input%%"$delm"*}"
					input=${input#*"$delm"}
					# Save current part of split line.
					msg+=( "$line" )
					# Track length of longest given line.
					if [[ ${#line} -gt $maxGvnLineLen ]]; then
						maxGvnLineLen=${#line}
					fi
				done
			else
				# Track length of longest given line.
				if [[ ${#arg} -gt $maxGvnLineLen ]]; then
					maxGvnLineLen=${#arg}
				fi
				# Track current given line.
				msg+=( "$arg" )
			fi  ;;
		-p|--pretty)
			# Use all formatting.
			headerFooter=true
			prePostFix=true  ;;
		--pp|--pre-post-fix)
			# Use post/pre fix formatting.
			prePostFix=true  ;;
		*)
			echo "$outputLogPrefix Calling function provided invalid option: '$fullArg', see doc:" >&2
			echo "$OUTPUT_DOC" >&2
			exit 140  ;;
	esac
done

 ###########################
## Error Check Argument(s) ##
 ###########################
# Used to track max number of message character(s) that be exist on each line (accounts for pre/post fix).
maxAlwMsgLen=$maxAlwLineLen

## Ensure Message Text Option was Provided ##
if $msgGiven; then
	## Ensure Message Text was Provided ##
	if [[ -n "${msg[@]}" ]]; then
		
		# Remove indent value from max message character(s) per line.
		if [[ $indent -gt 0 ]]; then
			maxAlwMsgLen=$(($maxAlwMsgLen-$indent))
		fi
		
		# Remove prefix & postfix length from max message character(s) per line.
		if $prePostFix; then
			maxAlwMsgLen=$(($maxAlwMsgLen-$(($((${#fChar}+1))*2))))
		fi
		
		## Verify Max Message Character(s) Per Line is Valid ##
		if [[ $maxAlwMsgLen -lt 1 ]]; then
			# Build helpful error message(s).
			errMsg="$outputLogPrefix Max line length ($maxAlwLineLen) is too short to contain '$indent' space(s) of indent"
			if $prePostFix; then
				errMsg="$errMsg and the prefix character '$fChar'."
			else
				errMsg="$errMsg."
			fi
			echo $errMsg >&2
			
			if [[ $(($DEFAULT_INDENT)) -ge $(($maxAlwLineLen)) ]]; then
				echo "$outputLogPrefix Decrease default indent ($DEFAULT_INDENT) to bellow max allowed line length ($maxAlwLineLen)." >&2
			elif [[ $(($indent)) -ge $(($maxAlwLineLen)) ]]; then
				echo "$outputLogPrefix Decrease provided indent value ($indent) to bellow max allowed line length ($maxAlwLineLen)." >&2
			fi
			
			echo "$OUTPUT_DOC" >&2
			exit 141
		fi
	else
		echo "$outputLogPrefix Message text must be given, see doc:" >&2
		echo "$OUTPUT_DOC" >&2
		exit 141
	fi
else
	echo "$outputLogPrefix Message option must be provided, see doc:" >&2
	echo "$OUTPUT_DOC" >&2
	exit 142
fi

 ########################
## Format Given Message ##
 ########################
## Generate indentation text ##
indentTxt=$(printf %${indent}s |tr " " " ")
readonly indentTxt

## Split Long Lines ##
# Determine if any lines given are long enough to require splitting.
if [[ $maxGvnLineLen -gt $maxAlwMsgLen ]]; then
	# Used to track current message line being processed.
	i=0
	# Used to track final line of message as total number of lines increases.
	end=${#msg[*]}
	# Tracks length of new longest line.
	newMaxMsgLen=0

	# Loop through each line, breaking up long ones along the way.
	while [ $i -lt $end ]; do
		# Determine if current line requires splitting.
		if [[ ${#msg[$i]} -gt $maxAlwMsgLen ]]; then
			# Copy previous array elements in.
			tmp=("${msg[@]:0:$i}")
			# Add first part of split line.
			tmp+=("${msg[$i]:0:$maxAlwMsgLen}")
			# Add last part of split line.
			tmp+=("${msg[$i]:$maxAlwMsgLen}")
			# Add remaining element(s) of array and save off new array.
			tmp+=("${msg[@]:$(($i+1))}")
			msg=("${tmp[@]}")
			# Line was split, so number of lines has increased.
			end=$(($end+1))
		fi

		# Mark current line's processing as complete.
		i=$(($i+1))
	done
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
	unset stdOut errOut rtOut
	eval "$( (eval $cmd) \
		2> >(errOut=$(cat); typeset -p errOut) \
		 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
	
	# Ensure header/footer was generated successfully.
	if [[ $rtOut -eq 0 ]]; then
		# Save off header/footer.
		if [[ ! -z $indentTxt ]]; then
			headerFooterTxt="$indentTxt$stdOut"
		else
			headerFooterTxt=$stdOut
		fi
	else
		echo "$outputLogPrefix createHeaderFooter() failed to create header/footer text. stderr bellow:" >&2
		echo "$errOut" >&2
		exit 3
	fi
fi

 #########################
## Produce Final Message ##
 #########################
## Header ##
if $headerFooter; then
	rtOutput="$rtOutput$headerFooterTxt"
fi

## Add Message, Prefix, & Postfix ##
for ((i=0; i<${#msg[@]}; i++)); do
	# Determine if prefix is needed.
	if $prePostFix; then
		rtOutput="$rtOutput$indentTxt$fChar "
	else
		rtOutput="$rtOutput$indentTxt"
	fi

	# Add current line of message.
	rtOutput="$rtOutput${msg[$i]}"

	# Determine if postfix is needed.
	if $prePostFix; then
		# Add lines after message so postfix characters line up.
		for ((j=${#msg[$i]}; j<$maxGvnLineLen; j++)); do
			rtOutput="$rtOutput "
		done
		# Add postfix character.
		rtOutput="$rtOutput $fChar\n"
	else
		rtOutput="$rtOutput\n"
	fi
done

## Footer ##
if $headerFooter; then
	rtOutput="$rtOutput$headerFooterTxt"
fi

## Write Final Message ##
printf "$rtOutput"
exit 0

