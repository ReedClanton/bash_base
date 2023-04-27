##########
## Local ##
##########
funcName="log"

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
elif [ -f $HOME/shell/functions/$funcName/util/constants.sh ]; then
	. $HOME/shell/functions/$funcName/util/constants.sh
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
if ! command -v output >/dev/null; then
	if [ -f $PWD/../../output/output.sh ]; then
		. $PWD/../../output/output.sh
	elif [ -f $PWD/src/shell/functions/output/output.sh ]; then
		. $PWD/src/shell/functions/output/output.sh
	elif [ -f $HOME/shell/functions/output/output.sh ]; then
		. $HOME/shell/functions/output/output.sh
	elif [ "$SHELL_FUNCTIONS" != "" ]; then
		if [ -f $SHELL_FUNCTIONS/output/output.sh ]; then
			. $SHELL_FUNCTIONS/output/output.sh
		else
			echo "ERROR $funcName(): output() wasn't already defined and couldn't be found from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
			exit 202
		fi
	else
		echo "ERROR $funcName(): output() wasn't already defined and couldn't be found from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
		exit 202
	fi
fi
if ! command -v checkRequiredOpts >/dev/null; then
	if [ -f $PWD/../../util/checkRequiredOpts.sh ]; then
		. $PWD/../../util/checkRequiredOpts.sh
	elif [ -f $PWD/src/shell/functions/util/checkRequiredOpts.sh ]; then
		. $PWD/src/shell/functions/util/checkRequiredOpts.sh
	elif [ -f $HOME/shell/functions/util/checkRequiredOpts.sh ]; then
		. $HOME/shell/functions/util/checkRequiredOpts.sh
	elif [ "$SHELL_FUNCTIONS" != "" ]; then
		if [ -f $SHELL_FUNCTIONS/util/checkRequiredOpts.sh ]; then
			. $SHELL_FUNCTIONS/util/checkRequiredOpts.sh
		else
			echo "ERROR $funcName(): checkRequiredOpts() wasn't already defined and couldn't be found from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
			exit 202
		fi
	else
		echo "ERROR $funcName(): checkRequiredOpts() wasn't already defined and couldn't be found from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
		exit 202
	fi
fi

######################
## Local Variable(s) ##
######################
# NoOp
