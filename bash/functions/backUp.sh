#! /bin/bash

 ###############
## Function(s) ##
 ###############
IFS='' read -r -d '' BACKUP_DOC <<"EOF"
#/ DESCRIPTION:
#/	TODO
#/ 
#/ USAGE: functionName [OPTIONS]... [ARGUMENTS]...
#/
#/ NOTE(S):
#/	- None.
#/  
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be
#/		done.
#/		(OPTIONAL)
#/	-q, --quiet
#/		Produces no output other than error level.
#/			- Note: Default log level value: $BASH_LOG_LEVEL.
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
#/	backUp --help
#/ 
#/ TODO(S):
#/	- Implement -q option.
#/	- Implement environment error checking.
#/	- Fill out doc.
#/	- Fix logger so it takes into account log level.
#/	- Success of backup should be reflected in return value.
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
# Used to build prefix to log message.
backupDir="$(date +"%Y-%m-%d")"
# Tracks directory being backed up.
declare backupSourcePath="$HOME/"
# Tracks directory backup will be created in.
declare backupPath="/run/media/reedclanton/Common/Fedora/Home/$backupDir/"
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

 #####################
## Next Section Name ##
 #####################
# Determine what directory backup should be placed in.
rsync \
	--delete-excluded \
	-r \
	-q \
	--include='/.bash*' \
	--exclude='/.*' --exclude='/GDrive' \
	$backupSourcePath \
	$backupPath
exit 0

