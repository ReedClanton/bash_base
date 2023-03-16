#! /bin/bash

 #########################
## Global(s)/Constant(s) ##
 #########################
## Constant(s) ##
source $BASH_FUNCTIONS_CONSTANTS/backUp.sh

 #####################
## Local Variable(s) ##
 #####################
# NoOp

 ###############
## Function(s) ##
 ###############
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
#/ USAGE: functionName [OPTIONS]...
#/
#/ NOTE(S):
#/	- This is intended to be run each time a terminal is opened.
#/  
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be
#/		done.
#/		(OPTIONAL)
#/	-q, --quiet
#/		Produces no output other than error level.
#/			- Note: Default log level value: $BASH_LOG_LEVEL.
#/			- Note: *Not yet implemented.*
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0:
#/		Returned when:
#/			- Help message is requested OR
#/			- Back up is successful.
#/	- 20:
#/		Returned when:
#/			- Given option is invalid.
#/ 
#/ EXAMPLE(S):
#/	backUp
#/	backUp --help
#/	backUp -q
#/ 
#/ TODO(S):
#/	- Implement -q option.
#/	- Implement environment error checking.
#/	- Fill out doc.
#/	- Fix logger so it takes into account log level.
#/	- Success of backup should be reflected in return value.
#/	- Missing back up location should be handled.
#/	- Logger usage should be made more robust.
EOF
# Code is offten called prior to environment initialization,
# so logging function must be manually called.
declare localLogger="/home/reedclanton/bash/functions/log.sh -c=backUp"

$localLogger -m="Resetting local variable(s)..."
 ###############################
## Reset/Set Local Variable(s) ##
 ###############################
# Logging var(s).
declare traceLvl="$localLogger"
declare debugLvl="$localLogger -d"
declare infoLvl="$localLogger -i"
declare warnLvl="$localLogger -w"
declare errorLvl="$localLogger -e"
# Name of directory back ups are stored in.
declare backUpDir=$DEFAULT_BACK_UP_DEST_DIR
# Tracks directory being backed up.
declare backUpSourcePath=$DEFAULT_BACK_UP_SOURCE_PATH
# Tracks path backup will be created at.
declare backUpDestPath=$DEFAULT_BACK_UP_DEST_PATH
$traceLvl -m="Local variable(s) reset."

 #####################
## Process Option(s) ##
 #####################
for fullArg in "${@}"; do
	$traceLvl -m="Processing option: '$fullArg'..."
	# Tracks value of current option.
	declare arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$BACKUP_DOC"
			exit 0  ;;
		-q|--quiet)
			echo "-q/--quiet not implemented yet"  ;;
		*)
			$errorLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
			echo "$BACKUP_DOC"
			exit 20  ;;
	esac
done
	
 ##############################
## Error Checking Environment ##
 ##############################
# TODO: Check if rsync is installed, if it's not, deal with that.

 ###############
## Run Back Up ##
 ###############
# Determine what directory backup should be placed in.
rsync \
	--delete-excluded \
	-r \
	-q \
	--include='/.bash*' \
	--exclude='/.*' --exclude='/GDrive' \
	$backUpSourcePath \
	$backUpDestPath
exit 0

