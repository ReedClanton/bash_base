##########
## Local ##
##########
funcDirName="tmux"
funcName="tmux/util/main.sh"

##############
## Import(s) ##
##############
## Global(s) ##
# NoOp
## Constant(s) ##
if [ -f $PWD/constants.sh ]; then
	. $PWD/constants.sh
elif [ -f $PWD/src/shell/functions/$funcDirName/util/constants.sh ]; then
	. $PWD/src/shell/functions/$funcDirName/util/constants.sh
elif [ -f $HOME/shell/functions/$funcDirName/util/constants.sh ]; then
	. $HOME/shell/functions/$funcDirName/util/constants.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcDirName/util/constants.sh ]; then
		. $SHELL_FUNCTIONS/$funcDirName/util/constants.sh
	else
		echo "ERROR $funcName: Couldn't find constants file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName: Couldn't find constants file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi
## Code ##
# log() #
importFuncName="log"
if ! command -v log >/dev/null; then
	if [ -f $PWD/../../$importFuncName/$importFuncName.sh ]; then
		. $PWD/../../$importFuncName/$importFuncName.sh
	elif [ -f $PWD/src/shell/functions/$importFuncName/$importFuncName.sh ]; then
		. $PWD/src/shell/functions/$importFuncName/$importFuncName.sh
	elif [ -f $HOME/shell/functions/$importFuncName/$importFuncName.sh ]; then
		. $HOME/shell/functions/$importFuncName/$importFuncName.sh
	elif [ "$SHELL_FUNCTIONS" != "" ]; then
		if [ -f $SHELL_FUNCTIONS/$importFuncName/$importFuncName.sh ]; then
			. $SHELL_FUNCTIONS/$importFuncName/$importFuncName.sh
		else
			echo "ERROR $funcName(): $importFuncName() wasn't already defined and couldn't be found from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
			exit 202
		fi
	else
		echo "ERROR $funcName(): $importFuncName() wasn't already defined and couldn't be found from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
		exit 202
	fi
fi
# tCreateWindowHome() #
importFuncName="tCreateWindowHome"
if [ -f $PWD/$importFuncName.sh ]; then
	. $PWD/$importFuncName.sh
elif [ -f $PWD/src/shell/functions/$funcDirName/util/$importFuncName.sh ]; then
	. $PWD/src/shell/functions/$funcDirName/util/$importFuncName.sh
elif [ -f $HOME/shell/functions/$funcDirName/util/$importFuncName.sh ]; then
	. $HOME/shell/functions/$funcDirName/util/$importFuncName.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcDirName/util/$importFuncName.sh ]; then
		. $SHELL_FUNCTIONS/$funcDirName/util/$importFuncName.sh
	else
		echo "ERROR $funcName: Couldn't find $importFuncName() util function file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName: Couldn't find $importFuncName() util function file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

######################
## Local Variable(s) ##
######################
# NoOp
