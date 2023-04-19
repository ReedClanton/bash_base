#!/usr/bin/env sh

##########################
## Global(s)/Constant(s) ##
##########################
## Global(s) ##
# NoOp
## Constant(s) ##
. $SHELL_FUNCTIONS/backUp/util/constants.sh

######################
## Local Variable(s) ##
######################
# NoOp

################
## Function(s) ##
################
IFS='' read -r -d '' BACKUP_DOC <<"EOF"
#/ DESCRIPTION:
#/	Backs up $DEFAULT_BACK_UP_SOURCE_PATH to $DEFAULT_BACK_UP_DEST_PATH.
#/	Back ups are stored in a folder named for the day the back up was done.
#/	Each time a back up is done on the same day, it overwrite the last back up,
#/	however, once the day changes, the previous day's back up is preserved.
#/	Hidden files and folders that are at the root of $DEFAULT_BACK_UP_SOURCE_PATH
#/	that don't start with '.bash' won't be included. Also the folder called
#/	'GDrive' at the root of $DEFAULT_BACK_UP_SOURCE_PATH will be ignored.
#/ 
#/ USAGE: backUp [OPTIONS]...
#/
#/ NOTE(S):
#/	- This is intended to be run each time a terminal is opened.
#/  
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/	-q, --quiet
#/		Produces no output other than error level.
#/			- Note: Default log level value: $SHELL_LOG_LEVEL.
#/			- Note: *Not yet implemented.*
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Back up is successful.
#/	- 140: Returned when given option is invalid.
#/	- 203: Returned when rsync isn't installed/accessible.
#/ 
#/ EXAMPLE(S):
#/	backUp
#/	backUp --help
#/	backUp -q
#/ 
#/ TODO(S):
#/	- Implement -q option.
#/	- Implement options for changing location back ups are written to.
#/	- Explore alternatives to rsync that may be used if rsync isn't installed.
#/	- Fill out doc.
#/	- Missing back up location should be handled.
EOF
log -c="backUp" -m="Resetting local variable(s)..."

################################
## Reset/Set Local Variable(s) ##
################################
# Logging var(s).
traceLvl="-c=backUp"
readonly traceLvl
debugLvl="-c=backUp -d"
readonly debugLvl
infoLvl="-c=backUp -i"
readonly infoLvl
warnLvl="-c=backUp -w"
readonly warnLvl
errLvl="-c=backUp -e"
readonly errLvl
# Name of directory back ups are stored in.
backUpDir=$DEFAULT_BACK_UP_DEST_DIR
# Tracks directory being backed up.
backUpSourcePath=$DEFAULT_BACK_UP_SOURCE_PATH
# Tracks path backup will be created at.
backUpDestPath=$DEFAULT_BACK_UP_DEST_PATH
# TODO: Comment.
options="-rLtU --specials --safe-links --inplace --delete-excluded --include='/.bash*' --exclude='/.*' --exclude='/GDrive' --exclude='/Downloads/OS'"
log $traceLvl -m="Local variable(s) reset."

######################
## Process Option(s) ##
######################
for fullArg in "$@"; do
	log $traceLvl -m="Processing option: '$fullArg'..."
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$BACKUP_DOC"
			exit 0
			;;
		-q|--quiet)
			log $warnLvl -m="-q/--quiet not implemented yet"  ;;
		*)
			log $errLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
			echo "$BACKUP_DOC"
			exit 140
			;;
	esac
done
	
###############################
## Error Checking Environment ##
###############################
log $traceLvl -m="Ensuring rsync is installed..."
if [[ "$(command -v rsync)" != "" ]]; then
	log $traceLvl -m="rsync is installed."
else
	log $errLvl -m="rsync isn't installed."
	exit 203
fi

################
## Run Back Up ##
################
log $infoLvl -m="Running back up..."
cmd="rsync $options $backUpSourcePath $backUpDestPath"
readonly cmd
unset stdOut errOut rtOut
eval "$( (eval $cmd) \
	2> >(errOut=$(cat); typeset -p errOut) \
	 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"

if [[ $rtOut -ne 0 ]]; then
	log $errLvl -m="rsync error output:" -m="$errOut"
# Figure out why this is failing.
#else
	# TODO: Handle condidtion where rsync stdOut is empty (currently errors).
#	log $traceLvl -m="$stdOut"
fi

exit $rtOu
