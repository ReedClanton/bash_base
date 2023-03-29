#!/usr/bin/env sh

 #########################
## Global(s)/Constant(s) ##
 #########################
## Global(s) ##
# NoOp
## Constant(s) ##
# NoOp

 #####################
## Local Variable(s) ##
 #####################
# NoOp

 ###############
## Function(s) ##
 ###############
IFS='' read -r -d '' SHELL_NAME_DOC <<"EOF"
#/ DESCRIPTION:
#/	Produces the name of shell that this code is running under to stdOut.
#/ 
#/ USAGE: shellName [OPTIONS]...
#/
#/ NOTE(S):
#/	- Used by shell environment config file(s). Thus log function can't be used.
#/  
#/ OPTION(S):
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
#/ TODO(S):
#/	- None
EOF
 #####################
## Process Option(s) ##
 #####################
for fullArg in "${@}"; do
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$SHELL_NAME_DOC"
			exit 0  ;;
		*)
			echo "Invalid given argument: '$fullArg', see doc:"
			echo "$SHELL_NAME_DOC"
			exit 140  ;;
	esac
done

# Determine name of current shell.
declare shellName=${SHELL#/*/*/*/*/}
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
	printf "Failed, couldn't determine shell name from \$SHELL ($SHELL).\n"
	exit 3
fi

