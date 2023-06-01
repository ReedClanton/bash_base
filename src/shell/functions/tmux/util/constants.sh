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

##############################################################
## New Session Default(s): New Window Bottom Pane Command(s) ##
##############################################################
# Commands that will be run by default in the bottom pane of window created when a new session is created.
defaultNewSessionWindowBottomPaneCommands="bashtop"
if [ "$DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS" ]; then
	if [ "$DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS" != "$defaultNewSessionWindowBottomPaneCommands" ]; then
		echo "$tmuxConstantsLogPrefix DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS can't be changed from '$DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS' to '$defaultNewSessionWindowBottomPaneCommands', open a new terminal session."
	fi
else
	DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS=$defaultNewSessionWindowBottomPaneCommands
	readonly DEFAULT_NEW_SESSION_WINDOW_BOTTOM_PANE_COMMANDS
fi
# Clean up.
unset defaultNewSessionWindowBottomPaneCommands

###########################################################
## New Session Default(s): New Window Top Pane Command(s) ##
###########################################################
# Commands that will be run by default in the window created when a new session is created.
#defaultNewSessionWindowTopPaneCommands="clear;neofetch;pwd;ls -GAp"
#if [ "$DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS" ]; then
#	if [ "$DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS" != "$defaultNewSessionWindowTopPaneCommands" ]; then
#		echo "$tmuxConstantsLogPrefix DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS can't be changed from '$DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS' to '$defaultNewSessionWindowTopPaneCommands', open a new terminal session."
#	fi
#else
#	DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS=$defaultNewSessionWindowTopPaneCommands
#	readonly DEFAULT_NEW_SESSION_WINDOW_TOP_PANE_COMMANDS
#fi
# Clean up.
#unset defaultNewSessionWindowTopPaneCommands

######################################################
## New Session Default(s): New Session's Window Name ##
######################################################
# Default name of new session's window.
defaultNewSessionWindowName="home"
if [ "$DEFAULT_NEW_SESSION_WINDOW_NAME" ]; then
	if [ "$DEFAULT_NEW_SESSION_WINDOW_NAME" != "$defaultNewSessionWindowName" ]; then
		echo "$tmuxConstantsLogPrefix DEFAULT_NEW_SESSION_WINDOW_NAME can't be changed from '$DEFAULT_NEW_SESSION_WINDOW_NAME' to '$defaultNewSessionWindowName', open a new terminal session."
	fi
else
	DEFAULT_NEW_SESSION_WINDOW_NAME=$defaultNewSessionWindowName
	readonly DEFAULT_NEW_SESSION_WINDOW_NAME
fi
# Clean up.
unset defaultNewSessionWindowName

##################################################################
## New Session Default(s): New Session's Window's Root Directory ##
##################################################################
# Default root directory new session's window will be rooted at (start at).
defaultNewSessionWindowRootDirectory="$HOME"
if [ "$DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY" ]; then
	if [ "$DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY" != "$defaultNewSessionWindowRootDirectory" ]; then
		echo "$tmuxConstantsLogPrefix DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY can't be changed from '$DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY' to '$defaultNewSessionWindowRootDirectory', open a new terminal session."
	fi
else
	DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY=$defaultNewSessionWindowRootDirectory
	readonly DEFAULT_NEW_SESSION_WINDOW_ROOT_DIRECTORY
fi
# Clean up.
unset defaultNewSessionWindowRootDirectory
