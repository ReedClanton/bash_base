##########
## Local ##
##########
funcName="output"

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
if [ -f $PWD/createHeaderFooter.sh ]; then
	. $PWD/createHeaderFooter.sh
elif [ -f $PWD/src/shell/functions/$funcName/util/createHeaderFooter.sh ]; then
	. $PWD/src/shell/functions/$funcName/util/createHeaderFooter.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcName/util/createHeaderFooter.sh ]; then
		. $SHELL_FUNCTIONS/$funcName/util/createHeaderFooter.sh
	else
		echo "ERROR $funcName(): Couldn't find createHeaderFooter() util function file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName(): Couldn't find createHeaderFooter() util function file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

######################
## Local Variable(s) ##
######################
# NoOp
