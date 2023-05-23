###################################
## Local Variable(s) & Processing ##
###################################
# Tracks if date command may be used.
useDate=false
# Error prefix added to error output messages.
backUpConstantsLogPrefix="WARN  backup/util/constants.sh:"
if command -v date >/dev/null; then
	alias date=$(command -v date)
	backUpConstantsLogPrefix="$(date +'%Y/%m/%d %I:%M:%S %Z') $backUpConstantsLogPrefix"
	useDate=true
fi

#####################################################
## Default Excluded/Included File(s)/Directory(ies) ##
#####################################################
## Excluded ##
# Important Note:
#	Each value should start with '<', end with '>', and have a space (' ')
#	after each element (including the last one).
defaultExcludedFiles="</.*> </Downloads/OS> </VirtualBox*> "
if [ "$DEFAULT_EXCLUDED_FILES" ]; then
	if [ "$DEFAULT_EXCLUDED_FILES" != "$defaultExcludedFiles" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_EXCLUDED_FILES can't be changed from '$DEFAULT_EXCLUDED_FILES' to '$defaultExcludedFiles', open a new terminal session."
	fi
else
	DEFAULT_EXCLUDED_FILES=$defaultExcludedFiles
	readonly DEFAULT_EXCLUDED_FILES
fi
# Clean up.
unset defaultExcludedFiles

## Included ##
# Important Note:
#	Each value should start with '<', end with '>', and have a space (' ')
#	after each element (including the last one).
# TODO: Revert to real value.
defaultIncludedFiles="</.bash*> </.*rc> </.*profile> "
if [ "$DEFAULT_INCLUDED_FILES" ]; then
	if [ "$DEFAULT_INCLUDED_FILES" != "$defaultIncludedFiles" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_INCLUDED_FILES can't be changed from '$DEFAULT_INCLUDED_FILES' to '$defaultIncludedFiles', open a new terminal session."
	fi
else
	DEFAULT_INCLUDED_FILES=$defaultIncludedFiles
	readonly DEFAULT_INCLUDED_FILES
fi
# Clean up.
unset defaultIncludedFiles

###########################
## Default Directory(ies) ##
###########################
## Full Back Up ##
# Name of directory *full* back ups are stored in.
if $useDate; then
	defaultFullBackUpDestDir="$(date +"%Y_%m_%d")-full"
else
	defaultFullBackUpDestDir=latest_back_up-full
fi
if [ "$DEFAULT_FULL_BACK_UP_DEST_DIR" ]; then
	if [ "$DEFAULT_FULL_BACK_UP_DEST_DIR" != "$defaultFullBackUpDestDir" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_FULL_BACK_UP_DEST_DIR can't be changed from '$DEFAULT_FULL_BACK_UP_DEST_DIR' to '$defaultFullBackUpDestDir', open a new terminal session."
	fi
else
	DEFAULT_FULL_BACK_UP_DEST_DIR=$defaultFullBackUpDestDir
	readonly DEFAULT_FULL_BACK_UP_DEST_DIR
fi
# Clean up.
unset defaultFullBackUpDestDir

## Partial Back Up ##
# Name of directory *partial* back ups are stored in.
if $useDate; then
	defaultPartialBackUpDestDir="$(date +"%Y_%m_%d")-partial"
else
	defaultPartialBackUpDestDir=latest_back_up-partial
fi
if [ "$DEFAULT_PARTIAL_BACK_UP_DEST_DIR" ]; then
	if [ "$DEFAULT_PARTIAL_BACK_UP_DEST_DIR" != "$defaultPartialBackUpDestDir" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_PARTIAL_BACK_UP_DEST_DIR can't be changed from '$DEFAULT_PARTIAL_BACK_UP_DEST_DIR' to '$defaultPartialBackUpDestDir', open a new terminal session."
	fi
else
	DEFAULT_PARTIAL_BACK_UP_DEST_DIR=$defaultPartialBackUpDestDir
	readonly DEFAULT_PARTIAL_BACK_UP_DEST_DIR
fi
# Clean up.
unset defaultPartialBackUpDestDir

####################
## Default Path(s) ##
####################
# Tracks default path to directory being backed up.
defaultBackUpSourcePath="$HOME/"
if [ "$DEFAULT_BACK_UP_SOURCE_PATH" ]; then
	if [ "$DEFAULT_BACK_UP_SOURCE_PATH" != "$defaultBackUpSourcePath" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_BACK_UP_SOURCE_PATH can't be changed from '$DEFAULT_BACK_UP_SOURCE_PATH' to '$defaultBackUpSourcePath', open a new terminal session."
	fi
else
	DEFAULT_BACK_UP_SOURCE_PATH=$defaultBackUpSourcePath
	readonly DEFAULT_BACK_UP_SOURCE_PATH
fi
# Clean up.
unset defaultBackUpSourcePath

## Full Back Up ##
# Tracks path backup will be created at.
defaultFullBackUpDestPath="/run/media/reedclanton/Common/Fedora/Home/"
if [ "$DEFAULT_FULL_BACK_UP_DEST_PATH" ]; then
	if [ "$DEFAULT_FULL_BACK_UP_DEST_PATH" != "$defaultFullBackUpDestPath" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_FULL_BACK_UP_DEST_PATH can't be changed from '$DEFAULT_FULL_BACK_UP_DEST_PATH' to '$defaultFullBackUpDestPath', open a new terminal session."
	fi
else
	DEFAULT_FULL_BACK_UP_DEST_PATH=$defaultFullBackUpDestPath
	readonly DEFAULT_FULL_BACK_UP_DEST_PATH
fi
# Clean up.
unset defaultFullBackUpDestPath

## Partial Back Up ##
# Tracks path backup will be created at.
defaultPartialBackUpDestPath="/run/media/reedclanton/Common/Fedora/Home/"
if [ "$DEFAULT_PARTIAL_BACK_UP_DEST_PATH" ]; then
	if [ "$DEFAULT_PARTIAL_BACK_UP_DEST_PATH" != "$defaultPartialBackUpDestPath" ]; then
		echo "$backUpConstantsLogPrefix DEFAULT_PARTIAL_BACK_UP_DEST_PATH can't be changed from '$DEFAULT_PARTIAL_BACK_UP_DEST_PATH' to '$defaultPartialBackUpDestPath', open a new terminal session."
	fi
else
	DEFAULT_PARTIAL_BACK_UP_DEST_PATH=$defaultPartialBackUpDestPath
	readonly DEFAULT_PARTIAL_BACK_UP_DEST_PATH
fi
# Clean up.
unset defaultPartialBackUpDestPath

##################
## Local Cleanup ##
##################
unset useDate backUpConstantsLogPrefix
unalias date
