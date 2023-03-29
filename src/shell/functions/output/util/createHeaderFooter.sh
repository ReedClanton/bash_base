 #########################
## Global(s)/Constant(s) ##
 #########################
## Global(s) ##
# NoOp
## Constant(s) ##
. $SHELL_FUNCTIONS/output/util/constents.sh

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
#/	-l=<maxMsgLength>, --line-length=<maxMsgLength>
#/		Max number of characters in any line of message. Used to determine how
#/		long header/footer should be. Value must be a non-negative number.
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
#/	- 141: Returned when given value of line length is invalid.
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
headerFooter=''
# Tracks character used for formatting.
fChar=$DEFAULT_CHAR
# Tracks desired total length of header/footer.
len=2
# Error prefix added to error output messages.
if [ "$(type -t date)" = "" ]; then
	errPFix="ERROR createHeaderFooter():"
else
	errPFix="$(date +'%Y/%m/%d %H:%M:%S %Z') ERROR createHeaderFooter():"
fi

 #####################
## Process Option(s) ##
 #####################
for fullArg in "${@}"; do
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		--prefix)
			headerFooter+=' '
			len=$(($len+1))  ;;
		-l=*|--line-length=*)
			# Ensure provided line length is valid.
			if echo "$arg" | grep -qE "^[[:space:]]*(\+)?[[:digit:]]+[[:space:]]*$"; then
				len=$(($arg+$len))
			else
				echo "$errPFix Line length must be a non-negative number, was '$arg', see doc:" >&2
				echo "$CREATE_HEADER_FOOTER_DOC" >&2
				exit 141
			fi  ;;
		-c=*|--char=*)
			# Track user desired formatting character(s).
			fChar=$arg
			# Update desired header/footer length to accommodate formatting character(s).
			if [[ ${#fChar} -gt 1 ]]; then
				len=$(($(($((${#fChar}-1))*2))+$len))
			fi  ;;
		-h|--help)
			echo "$CREATE_HEADER_FOOTER_DOC" >&2
			exit 0  ;;
		*)
			echo "$errPFix Caller provided invalid option: '$fullArg', see doc:" >&2
			echo "$CREATE_HEADER_FOOTER_DOC" >&2
			exit 140  ;;
	esac
done

## Build Header/Footer ##
while [[ ${#headerFooter} -lt $len ]]; do
	# When near the end, given formatting character(s) may need to be split up.
	if [[ $((${#headerFooter}+${#fChar})) -gt $len ]]; then
		headerFooter+=${fChar:0:$(($len-${#headerFooter}))}
	else
		headerFooter+=$fChar
	fi
done
# Add final part of header.
headerFooter+='\n'
echo "$headerFooter"
exit 0

