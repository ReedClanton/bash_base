#!/usr/bin/env sh

 #########################
## Global(s)/Constant(s) ##
 #########################
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
#/	- TODO
#/  
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be
#/		done.
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0:
#/		Returned when:
#/			- Help message is requested OR
#/			- Shell name has been found.
#/	- 20:
#/		Returned when:
#/			- Given option is invalid.
#/	- 21:
#/		Returned when:
#/			- Shell name couldn't be found for any reason.
#/ 
#/ EXAMPLE(S):
#/	shellName
#/	shellName --help
#/ 
#/ TODO(S):
#/	- Fill out doc.
EOF
log -c="shellName" -m="Resetting local variable(s)..."
 ###############################
## Reset/Set Local Variable(s) ##
 ###############################
# Logging var(s).
traceLvl="-c=shellName"
debugLvl="-c=shellName -d"
infoLvl="-c=shellName -i"
warnLvl="-c=shellName -w"
errLvl="-c=shellName -e"
log $traceLvl -m="Local variable(s) reset."

 #####################
## Process Option(s) ##
 #####################
for fullArg in "${@}"; do
	log $traceLvl -m="Processing option: '$fullArg'..."
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$SHELL_NAME_DOC"
			exit 0  ;;
		*)
			log $errLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
			echo "$SHELL_NAME_DOC"
			exit 20  ;;
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
	exit 21
fi

