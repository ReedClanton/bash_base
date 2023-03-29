#!/usr/bin/env sh

 #########################
## Global(s)/Constant(s) ##
 #########################
## Global(s) ##
. $SHELL_FUNCTIONS/output/globals.sh
## Constant(s) ##
. $SHELL_FUNCTIONS/output/constents.sh

 #####################
## Local Variable(s) ##
 #####################
# NoOp

IFS='' read -r -d '' CREATE_HEADER_FOOTER_DOC <<"EOF"
#/ DESCRIPTION:
#/	Returns text intended to be used as a header or footer in std out.
#/
#/ USAGE: createHeaderFooter [OPTIONS]... -l=<maxMsgLength>
#/
#/ NOTE(S):
#/	- Method may not use the log function because this is used by that method.
#/	- This method is in the same directory as output because a local variable
#/		is used by this method to return a value to the output method when
#/		called by the output method.
#/
#/ OPTION(S):
#/	-c=<formattingCharacter>, --char=<formattingCharacter>
#/		Sets character used to create header and footer.
#/			- Note: Default value: $DEFAULT_CHAR.
#/			- Note: Some special characters may require two to be given:
#/				-c="55"  _> %
#/			- Note: Some *other* special characters may not work at all (ex. back slash).
#/		(OPTIONAL)
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/	-l=<maxMsgLength>, --lineLength=<maxMsgLength>
#/		Max number of characters in any line of message. Used to determine how
#/		long header/footer should be.
#/			- Note: Line length only includes characters in message.
#/		(REQUIRED)
#/	--prefix
#/		Length of header/footer changes depending on if a prefix is being used.
#/			- Note: Should *always* be given if header/footer is used with a prefix.
#/		(REQUIRED/OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful.
#/	- 140: Returned when given option name is invalid.
#/	- 142: TODO: Returned when required option(s) are not provided.
#/
#/ EXAMPLE(S):
#/	createHeaderFooter --help
#/	createHeaderFooter -l=96 --prefix -c='#'
#/	createHeaderFooter -l=10 -c="@@"
#/	createHeaderFooter -l=12 -c=!
#/
#/ TODO(S):
#/	- Implement: Error checking to ensure requried options are provided.
#/	- Return 1 when required arguments are not provided.
#/	- Display this message when required argument(s) are not provided.
#/	- Move this function to its own file.
EOF
 ###############################
## Reset/Set Local Variable(s) ##
 ###############################
# Tracks header/footer text.
rtCreateHeaderFooter=''
# Tracks character used for formatting.
fChar=$DEFAULT_CHAR
# Tracks desired total length of header/footer.
declare -i len=2

 #####################
## Process Option(s) ##
 #####################
for fullArg in "${@}"; do
	# Tracks value of current option.
	declare arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		--prefix)
			rtCreateHeaderFooter+=' '
			len+=1  ;;
		-l=*|--lineLength=*)
			len+=$arg  ;;
		-c=*|--char=*)
			# Track user desired formatting character(s).
			fChar=$arg
			# Update desired header/footer length to accommodate formatting character(s).
			if [[ ${#fChar} -gt 1 ]]; then
				len+=$(($((${#fChar}-1))*2))
			fi  ;;
		-h|--help)
			echo "$CREATE_HEADER_FOOTER_DOC"
			exit 0  ;;
		*)
			printf "$(date +'%Y/%m/%d %H:%M:%S %Z') ERROR createHeaderFooter: Caller provided invalid option: '$fullArg', see doc:\n"
			echo "$CREATE_HEADER_FOOTER_DOC"
			exit 140  ;;
	esac
done

## Build Header/Footer ##
while [[ ${#rtCreateHeaderFooter} -lt $len ]]; do
	# When near the end, given formatting character(s) may need to be split up.
	if [[ $((${#rtCreateHeaderFooter}+${#fChar})) -gt $len ]]; then
		rtCreateHeaderFooter+=${fChar:0:$(($len-${#rtCreateHeaderFooter}))}
	else
		rtCreateHeaderFooter+=$fChar
	fi
done
# Add final part of header.
rtCreateHeaderFooter+='\n'
echo "$rtCreateHeaderFooter"
exit 0

