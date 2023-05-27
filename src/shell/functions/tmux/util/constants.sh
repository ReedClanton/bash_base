###################################
## Local Variable(s) & Processing ##
###################################
# Error prefix added to error output messages.
tmuxConstantsLogPrefix="WARN  tmux/util/constants.sh:"
if command -v date >/dev/null; then
	tmuxConstantsLogPrefix="$(command -v date +'%Y/%m/%d %I:%M:%S %Z') $tmuxConstantsLogPrefix"
fi

#########################
## TMUX Session Name(s) ##
#########################
# Temporary session name used until session configuration is complete.
tempSessionName="tmp"
if [ "$TEMP_SESSION_NAME" ]; then
	if [ "$TEMP_SESSION_NAME" != "$tempSessionName" ]; then
		echo "$tmuxConstantsLogPrefix TEMP_SESSION_NAME can't be changed from '$TEMP_SESSION_NAME' to '$tempSessionName', open a new terminal session."
	fi
else
	TEMP_SESSION_NAME=$tempSessionName
	readonly TEMP_SESSION_NAME
fi
# Clean up.
unset tempSessionName
