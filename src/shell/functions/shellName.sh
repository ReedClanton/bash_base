#!/usr/bin/env sh

SHELL_NAME_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Produces the name of shell that this code is running under to stdOut.
#/ 
#/ USAGE: shellName [SPECIAL_OPTION]
#/
#/ NOTE(S):
#/	- Diffrent shells render special characters, like tab and new line,
#/		diffrently. Thus if this doc contains any special characters that have
#/		two backslashes, know that only one is intended.
#/	- Used by shell environment config file(s), thus the log() function can't be used.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Shell name has been found.
#/	- 3: Returned when shell name can't be found for any reason.
#/	- 140: Returned when given option name is invalid.
#/ 
#/ EXAMPLE(S):
#/	shellName
#/	shellName --help
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/ 
#/ TODO(S):
#/	- None
EOF
)
######################
## Process Option(s) ##
######################
for fullArg in "$@"; do
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$SHELL_NAME_DOC"
			exit 0
			;;
		*)
			echo "Invalid given argument: '$fullArg', see doc:"
			echo "$SHELL_NAME_DOC"
			exit 140
			;;
	esac
done

# Determine name of current shell.
shellName=${SHELL#/*/*/*/*/}
if [[ "$SHELL" = "$shellName" ]]; then
	shellName=${SHELL#/*/*/*/}
	if [[ "$SHELL" = "$shellName" ]]; then
		shellName=${SHELL#/*/*/}
		if [[ "$SHELL" = "$shellName" ]]; then
			shellName=${SHELL#/*/}
			if [[ "$SHELL" = "$shellName" ]]; then
				shellName=${SHELL#/}
			fi
		fi
	fi
fi

# Ensure shell name was found.
if [[ "$SHELL" != "$shellName" && "$shellName" != "" ]]; then
	printf "$shellName"
	exit 0
else
	printf "Failed, couldn't determine shell name from SHELL ($SHELL).\n"
	exit 3
fi
