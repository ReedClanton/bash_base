##########
## Local ##
##########
funcName="environmentSetup"

##############
## Import(s) ##
##############
## Global(s) ##
# NoOp
## Constant(s) ##
# NoOp
## Code ##
if [ -f $PWD/util/flatpakAliasCreator.sh ]; then
	. $PWD/util/flatpakAliasCreator.sh
else
	echo "ERROR $funcName(): Couldn't find flatpakAliasCreator() util function file from PWD ($PWD)." >&2
	exit 202
fi
if [ -f $PWD/../shell/functions/shellName/shellName.sh ]; then
	. $PWD/util/flatpakAliasCreator.sh.sh
else
	echo "ERROR $funcName(): Couldn't find shellName() util function file from PWD ($PWD)." >&2
	exit 202
fi

######################
## Local Variable(s) ##
######################
# NoOp
