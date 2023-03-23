#!/usr/bin/env sh

 #############
## Import(s) ##
 #############
## Global(s) ##
. $SHELL_FUNCTIONS/output/globals.sh
## Constant(s) ##
. $SHELL_FUNCTIONS/output/constents.sh
## Code ##
alias createHeaderFooter=$SHELL_FUNCTIONS/output/util/createHeaderFooter.sh

 #####################
## Local Variable(s) ##
 #####################
# NoOp

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
#/		Print this help message. Function will return code of '0'. No processing will be
#/		done.
#/		(OPTIONAL)
#/	-m=<msg>, --msg=<msg>
#/		Message user would like formatted output produced of.
#/			- Note: If multiple are given, each will show up on a new line.
#/			- Note: If one line exceeds the set max line length, it will be broken up.
#/				The est of the line will start with the same inditation.
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
#/	-l=<maxLineLength>, --lineLength=<maxLineLength>
#/		Sets max number of characters that may be included on a sinlge line.
#/			- Note: Line length includes prefix and postfix if included.
#/			- Note: Default value: 100.
#/		(OPTIONAL)
#/	--header-footer
#/		When given, message produced will include a header and footer.
#/			- Note: Redundant if -p given.
#/		(OPTIONAL)
#/	-c=<formattingCharacter>, --char=<formattingCharacter>
#/		Sets character used by header, footer, prefix, and postfix.
#/			- Note: Default value: $DEFAULT_CHAR.
#/			- Note: Some special characters may require two to be given (ex. -c="%%").
#/			- Note: Some *other* special characters may not work at all (ex. back
#/				slash).
#/		(OPTIONAL)
#/	--indent=<numSpacesToIndent>
#/		Sets number of spaces formatted message, including prefix/postfix/header/footer
#/		if used, should be indented.
#/			- Note: Default value: $DEFAULT_INDENT.
#/		(OPTIONAL)
#/	-t, --trace
#/		When given, *trace* formatting character ($TRACE_CHAR) is used as formatting
#/		character.
#/			- Note: If the formatting character isn't set, and no level is provided
#/				(ex. debug, error), then the default formatting character
#/				($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-d, --debug
#/		When given, *debug* formatting character ($DEBUG_CHAR) is used as formatting
#/		character.
#/			- Note: If the formatting character isn't set, and no level is provided
#/				(ex. debug, error), then the default formatting character
#/				($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-i, --info
#/		When given, *info* formatting character ($INFO_CHAR) is used as formatting
#/		character.
#/			- Note: If the formatting character isn't set, and no level is provided
#/				(ex. debug, error), then the default formatting character
#/				($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-w, --warn
#/		When given, *warn* formatting character ($WARN_CHAR) is used as formatting
#/		character.
#/			- Note: If the formatting character isn't set, and no level is provided
#/				(ex. debug, error), then the default formatting character
#/				($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/	-e, --error
#/		When given, *error* formatting character ($ERROR_CHAR) is used as formatting
#/		character.
#/			- Note: If the formatting character isn't set, and no level is provided
#/				(ex. debug, error), then the default formatting character
#/				($DEFAULT_CHAR) is used.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0:
#/		Returned when:
#/			- Help message is requested OR
#/			- Processing is successfull.
#/	- 2:
#/		Returned when:
#/			- No message text is given.
#/	- 3:
#/		Returned when:
#/			- Provided indent value is negative.
#/	- 4:
#/		Returned when:
#/			- Provided max line length value is too small:
#/				- Line length - prefix - postfix > 0.
#/	- 20:
#/		Returned when:
#/			- Provided option is invalid.
#/
#/ EXAMPLE(S):
#/	output --help
#/	output -m="line 1" -m="line 2" -m="line 3\nline 4" -m="line 5"
#/	output -m="line 1" -m="longline 2" -l=6
#/	output -m="line 1" -m="longline 2" -l=10 -p
#/	output -m="line 1" -m="longline 2" -l=10 --pre-post-fix --header-footer
#/	output -m="line 1" --pretty --error
#/	output -m="line 1" -p -w
#/	output -m="line 1" -p -c="^"
#/	output -m="line 1" -p --char="&&"
#/
#/ TODO(S):
#/	- Implement: Dynamicly determine, based on last character of line being split up, if
#/		a '-' is needed.
#/	- Implement: Ability to append end of line that was too long to fit on one row to
#/		the start of the next line.
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
tmp=1
msg=()
# Contains final (formatted) message text.
rtOutput=''
# Prefix used to produce error logs.
errPrefix="$(date +'%Y/%m/%d %H:%M:%S %Z') ERROR output:"
readonly errPrefix

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
		-c=*|--char=*)
			fChar=$arg  ;;
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
			indent=$arg  ;;
		-l=*|--lineLength=*)
			maxAlwLineLen=$arg  ;;
		-m=*|--msg=*)
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
			printf "$errPrefix Calling function provided invalid option: '$fullArg', see doc:\n"
			echo "$OUTPUT_DOC"
			exit 20  ;;
	esac
done

 ###########################
## Error Check Argument(s) ##
 ###########################
## Ensure Message Text Was Provided ##
if [[ -z "${msg[@]}" ]]; then
	printf "$errPrefix Message text must be given, see doc:\n"
	echo "$OUTPUT_DOC"
	exit 2
fi

## Ensure Valid Indent Value Was Given ##
# Used to track max number of message character(s) that be exist on each line (accounts for pre/post fix).
maxAlwMsgLen=$maxAlwLineLen
# Remove indent value from max message character(s) per line.
if [[ $indent -ge 0 ]]; then
	maxAlwMsgLen=$(($maxAlwMsgLen-$indent))
else
	printf "$errPrefix Indentation value: '$indent' invalid. Must be non-negative, see doc:\n"
	echo "$OUTPUT_DOC"
	exit 3
fi
# Remove prefix & postfix length from max message character(s) per line.
if $prePostFix; then
	maxAlwMsgLen=$(($maxAlwMsgLen-$(($((${#fChar}+1))*2))))
fi

## Verify Max Message Character(s) Per Line is Valid ##
# Ensure there's enough room to include message character(s).
if [[ $maxAlwMsgLen -lt 1 ]]; then
	printf "$errPrefix Max line length of '$maxAlwLineLen' invalid because there's no room for message text. See Doc:\n"
	echo "$OUTPUT_DOC"
	exit 4
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
			end+=1
		fi

		# Mark current line's processing as complete.
		i+=1
	done
	# Update longest given line.
	maxGvnLineLen=$maxAlwMsgLen
fi

## Generate Header/Footer ##
# Determine if header/footer is needed.
if $headerFooter; then
	# Call function that creates header/footer.
	if $prePostFix; then
		createHeaderFooter --prefix -l=$maxGvnLineLen -c=$fChar
	else
		createHeaderFooter -l=$maxGvnLineLen -c=$fChar
	fi
	# Save off header/footer.
	if [[ ! -z $indentTxt ]]; then
		headerFooterTxt="$indentTxt$rtCreateHeaderFooter"
	else
		headerFooterTxt=$rtCreateHeaderFooter
	fi
fi

 #########################
## Produce Final Message ##
 #########################
## Header ##
if $headerFooter; then
	rtOutput+=$headerFooterTxt
fi

## Add Message, Prefix, & Postfix ##
for ((i=0; i<${#msg[@]}; i++)); do
	# Determine if prefix is needed.
	if $prePostFix; then
		rtOutput+="$indentTxt$fChar "
	else
		rtOutput+="$indentTxt"
	fi

	# Add current line of message.
	rtOutput+="${msg[$i]}"

	# Determine if postfix is needed.
	if $prePostFix; then
		# Add lines after message so postfix characters line up.
		for ((j=${#msg[$i]}; j<$maxGvnLineLen; j++)); do
			rtOutput+=' '
		done
		# Add postfix character.
		rtOutput+=" $fChar\n"
	else
		rtOutput+="\n"
	fi
done

## Footer ##
if $headerFooter; then
	rtOutput+=$headerFooterTxt
fi

## Write Final Message ##
printf "$rtOutput"
exit 0

