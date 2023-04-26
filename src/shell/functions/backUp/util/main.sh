##########
## Local ##
##########
funcName="backUp"

##############
## Import(s) ##
##############
## Global(s) ##
# NoOp
## Constant(s) ##
if [ -f $PWD/constants.sh ]; then
	. $PWD/constants.sh
elif [ -f $PWD/src/shell/functions/$funcName/util/constants.sh ]; then
	. $PWD/src/shell/functions/$funcName/util/constants.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcName/util/constants.sh ]; then
		. $SHELL_FUNCTIONS/$funcName/util/constants.sh
	else
		echo "ERROR $funcName(): Couldn't find constants file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName(): Couldn't find constants file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi
## Code ##
if ! command -v log >/dev/null; then
	if [ -f $PWD/../../log/log.sh ]; then
		. $PWD/../../log/log.sh
	elif [ -f $PWD/src/shell/functions/log/log.sh ]; then
		. $PWD/src/shell/functions/log/log.sh
	elif [ "$SHELL_FUNCTIONS" != "" ]; then
		if [ -f $SHELL_FUNCTIONS/log/log.sh ]; then
			. $SHELL_FUNCTIONS/log/log.sh
		else
			echo "ERROR $funcName(): log() wasn't already defined and couldn't be found from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
			exit 202
		fi
	else
		echo "ERROR $funcName(): log() wasn't already defined and couldn't be found from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
		exit 202
	fi
fi

######################
## Local Variable(s) ##
######################
# NoOp
