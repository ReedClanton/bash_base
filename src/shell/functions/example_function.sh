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
IFS='' read -r -d '' FUNCTION_NAME_DOC <<"EOF"
#/ DESCRIPTION:
#/	TODO
#/
#/ USAGE: functionName [OPTIONS]... [ARGUMENTS]...
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
#/	- 0: Returned when:
#/		- Help message is requested OR
#/		- Processing is successful.
#/	- 20: Returned when:
#/		- Given option is invalid.
#/
#/ EXAMPLE(S):
#/	functionName --help
#/
#/ TODO(S):
#/	- TODO
EOF
function functionName {
	log -i -c=${FUNCNAME[0]} --full-title -m="<titleTextHere>"

	log -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	 ###############################
	## Reset/Set Local Variable(s) ##
	 ###############################
	# Logging var(s).
	traceLvl="-c=${FUNCNAME[0]}"
	readonly traceLvl
	debugLvl="-d -c=${FUNCNAME[0]}"
	readonly debugLvl
	infoLvl="-i -c=${FUNCNAME[0]}"
	readonly infoLvl
	warnLvl="-w -c=${FUNCNAME[0]}"
	readonly warnLvl
	errorLvl="-e -c=${FUNCNAME[0]}"
	readonly errorLvl
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
				echo "$FUNCTION_NAME_DOC"
				exit 0  ;;
			*)
				log $errorLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
				echo "$FUNCTION_NAME_DOC"
				return 20  ;;
		esac
	done

	 ###########################
	## Error Check Argument(s) ##
	 ###########################
	log $traceLvl -m="Ensuring all required argument(s) were given..."
	checkRequiredOpts "$FUNCTION_NAME_DOC" "-a=$varHoldingValOfRequiredArg"
	rtVal=$?
	if [[ $rtVal -ne 0 ]]; then
		return $rtVal
	fi
	log $debugLvl -m="All required argument(s) were given."
	
	 #####################
	## Next Section Name ##
	 #####################
	
}

# TODO: Move to README.md.
# Allows calling of file's function(s) from the terminal (fileName.sh functionName args).
case "$1" in
    "")
    	;;
    example)
    	"$@"
    	exit  ;;
    *)
    	log_error "Unkown function: $1()"
    	exit 2  ;;
esac

# TODO: Move to README.md.
#How to call function/command and save off what it returnes, as well as it's std and err output:
```
cmd="Command you want to run here"
unset stdOut errOut rtOut
eval "$( (eval $cmd) \
	2> >(errOut=$(cat); typeset -p errOut) \
	 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
```

