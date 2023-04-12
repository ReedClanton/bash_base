 #############
## Import(s) ##
 #############
## Global(s) ##
# NoOp
## Constant(s) ##
if [ -f $PWD/constants.sh ]; then
	. $PWD/constants.sh
elif [ -f $PWD/src/shell/functions/output/util/constants.sh ]; then
	. $PWD/src/shell/functions/output/util/constants.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/output/util/constants.sh ]; then
		. $SHELL_FUNCTIONS/output/util/constants.sh
	else
		echo "ERROR output(): Couldn't find output()'s constants file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR output(): Couldn't find output()'s constants file from \$PWD ($PWD) and \$SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi
## Code ##
if [ -f $PWD/createHeaderFooter.sh ]; then
	. $PWD/createHeaderFooter.sh
elif [ -f $PWD/src/shell/functions/output/util/createHeaderFooter.sh ]; then
	. $PWD/src/shell/functions/output/util/createHeaderFooter.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/output/util/createHeaderFooter.sh ]; then
		. $SHELL_FUNCTIONS/output/util/createHeaderFooter.sh
	else
		echo "ERROR output(): Couldn't find output()'s createHeaderFooter() util function file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR output(): Couldn't find output()'s createHeaderFooter() util function file from \$PWD ($PWD) and \$SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

 #####################
## Local Variable(s) ##
 #####################
# NoOp

