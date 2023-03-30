 #########################
## Global(s)/Constant(s) ##
 #########################
## Global(s) ##
# NoOp
## Constant(s) ##
. $SHELL_FUNCTIONS/output/util/constants.sh

 #####################
## Local Variable(s) ##
 #####################
# NoOp

IFS='' read -r -d '' CREATE_HEADER_FOOTER_DOC <<"EOF"
#/ DESCRIPTION:
#/	Returns text intended to be used as a header or footer in stdout. Upon
#/	failure, a non-zero code will be returned and output will be produced to
#/	stderr.
#/
#/ USAGE: createHeaderFooter [OPTIONS]...
#/
#/ NOTE(S):
#/	- Method may not use the log function because this is used by that method.
#/
#/ OPTION(S):
#/	-f=<formattingCharacter>, --formatting-character=<formattingCharacter>
#/		Sets character used to create header and footer.
#/			- Note: Default value: $DEFAULT_CHAR.
#/			- Note: Some special characters may require two to be given.
#/			- Note: Some characters may require quotes (ex. `>`).
#/			- Note: Given value may not include a back slash.
#/		(OPTIONAL)
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/	-l=<maxMsgLength>, --line-length=<maxMsgLength>
#/		Max number of characters in any line of message. Used to determine how
#/		long header/footer should be. Value must be a non-negative number.
#/			- Note: Default value: `0`.
#/			- Note: This value should only include characters in message.
#/		(OPTIONAL)
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
#/
#/ EXAMPLE(S):
#/	createHeaderFooter --help
#/	createHeaderFooter
#/	createHeaderFooter -l=96 --prefix -f='#'
#/	createHeaderFooter -l=10 -f="@@"
#/	createHeaderFooter -l=12 -f=!
#/
#/ TODO(S):
#/	- None
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
		-f=*|--formatting-character=*)
			# Ensure a valid value was provided.
			case "$arg" in
				*\\*|"")
					echo "$errPFix Formatting character may not be blank or a special character (ex. new line, tab), was '$arg', see doc:" >&2
					echo "$CREATE_HEADER_FOOTER_DOC" >&2
					exit 141  ;;
				*)
					# Track user desired formatting character(s) and update desired
					# header/footer length to accommodate formatting character(s).
					fChar=$arg
					len=$(($(($((${#fChar}-1))*2))+$len))  ;;
			esac  ;;
		-h|--help)
			echo "$CREATE_HEADER_FOOTER_DOC"
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

# Add new line and return.
echo "$headerFooter\n"
exit 0

