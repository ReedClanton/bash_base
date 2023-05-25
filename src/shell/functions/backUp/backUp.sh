# Needed so unit tests can mock out sourced file(s).
if ! command -v inScriptSource >/dev/null; then
	inScriptSource() { . "$@"; }
fi

##############
## Import(s) ##
##############
funcName="backUp"
if [ -f $PWD/util/main.sh ]; then
	inScriptSource $PWD/util/main.sh
elif [ -f $PWD/src/shell/functions/$funcName/util/main.sh ]; then
	inScriptSource $PWD/src/shell/functions/$funcName/util/main.sh
elif [ "$SHELL_FUNCTIONS" != "" ]; then
	if [ -f $SHELL_FUNCTIONS/$funcName/util/main.sh ]; then
		inScriptSource $SHELL_FUNCTIONS/$funcName/util/main.sh
	else
		echo "ERROR $funcName(): Couldn't find 'main.sh' file from SHELL_FUNCTIONS: '$SHELL_FUNCTIONS'." >&2
		exit 202
	fi
else
	echo "ERROR $funcName(): Couldn't find 'main.sh' file from PWD ($PWD) and SHELL_FUNCTIONS isn't set." >&2
	exit 202
fi

################
## Function(s) ##
################
BACK_UP_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/		The behavor of this is intended to be primarily controled by
#/	environment variables set in `./util/constants.sh` rather than by option(s)
#/	and argument(s). This is because doing so allows this function to be called
#/	across environment setup code without having to update each call when a
#/	change in behavor is desired.
#/		A *full* back up is one that backs up all files that can be backed up
#/	from '$DEFAULT_BACK_UP_SOURCE_PATH' or the value provided by
#/	`--source-back-up-path', to '$DEFAULT_FULL_BACK_UP_DEST_PATH'. Some files,
#/	like soft (symbolic), can only be backed up to
#/	'$DEFAULT_FULL_BACK_UP_DEST_PATH' when the drive that contains that path
#/	uses a filesystem that supports symbolic links.
#/		A *partial* back up is one that backs up files from
#/	'$DEFAULT_BACK_UP_SOURCE_PATH' that arn't included in the list of excluded
#/	file(s) to '$DEFAULT_PARTIAL_BACK_UP_DEST_PATH'.
#/		List of excluded file(s) is determined by '$DEFAULT_EXCLUDED_FILES' or
#/	the value(s) provided by '--exclude'.
#/		Files included in '$DEFAULT_INCLUDED_FILES', or the value(s) provided
#/	by '--include', will be included even if they would normally be covered by
#/	'$DEFAULT_EXCLUDED_FILES' or '--exclude'.
#/ 
#/ USAGE: backUp [SPECIAL_OPTION] [OPTIONS...]
#/
#/ NOTE(S):
#/	- Diffrent shells render special characters, like tab and new line,
#/		diffrently. Thus if this doc contains any special characters that have
#/		two backslashes, know that only one is intended.
#/
#/ SPECIAL OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/  
#/ OPTION(S):
#/	--destination-back-up-directory=<directoryNameBackUpWillBePlacedIn>
#/			Sets directory name that will be created at
#/		'$DEFAULT_PARTIAL_BACK_UP_DEST_PATH', or
#/		'$DEFAULT_FULL_BACK_UP_DEST_PATH' when '--full-back-up' is provided.
#/		This is the directory that will contain backed up data.
#/			- Note: Default is to use path from
#/				'$DEFAULT_PARTIAL_BACK_UP_DEST_PATH' or
#/				'$DEFAULT_FULL_BACK_UP_DEST_PATH' when '--full-back-up' is
#/				provided.
#/		(OPTIONAL)
#/	--destination-back-up-path=</path/to/destination/that/back/up/directory/should/be/created/in/>
#/			Path that a directory named '$DEFAULT_PARTIAL_BACK_UP_DEST_DIR', or
#/		'$DEFAULT_FULL_BACK_UP_DEST_DIR' when '--full-back-up' is provided,
#/		will be created at (the directory that will contain the back up). When
#/		provided, '$DEFAULT_FULL_BACK_UP_DEST_PATH' and
#/		'$DEFAULT_FULL_BACK_UP_DEST_PATH' will be ignored.
#/			- Note: Default is to use path from
#/				'$DEFAULT_PARTIAL_BACK_UP_DEST_PATH' or
#/				'$DEFAULT_FULL_BACK_UP_DEST_PATH' when '--full-back-up' is
#/				provided.
#/		(OPTIONAL)
#/	--exclude="<list> <of> <excluded> <files> <and> <or> <directories> "
#/			File(s)/directory(ies) that mach one of the provided values won't
#/		be backed up. When provided, '$DEFAULT_EXCLUDED_FILES' will be ignored.
#/			- Note: Default is to use value(s) from '$DEFAULT_EXCLUDED_FILES'.
#/			- Note: Each value should start with '<', end with '>', and have a
#/				space (' ') after each element (including the last one).
#/			- Note: All values *must* be passed in at once.
#/		(OPTIONAL)
#/	--full-back-up
#/			When provided, all file(s) from '$DEFAULT_BACK_UP_SOURCE_PATH' will
#/		be backed up (i.e. '$DEFAULT_EXCLUDED_FILES' and
#/		'$DEFAULT_INCLUDED_FILES' will be ignored). If '--exclude' and/or
#/		'--include' are provided, then they will still be respected.
#/			- Note: Default is to do a partial back up.
#/			- Note: Back up will be placed in '$DEFAULT_FULL_BACK_UP_DEST_DIR'.
#/		(OPTIONAL)
#/	--include="<list> <of> <included> <files> <and> <or> <directories> "
#/			File(s)/directory(ies) that mach one of the provided values will be
#/		backed up even if they would otherwise match a value from
#/		'$DEFAULT_EXCLUDED_FILES' or '--exclude'. When provided,
#/		'$DEFAULT_INCLUDED_FILES' will be ignored.
#/			- Note: Default is to use value(s) from '$DEFAULT_INCLUDED_FILES'.
#/			- Note: Each value should start with '<', end with '>', and have a
#/				space (' ') after each element (including the last one).
#/			- Note: All values *must* be passed in at once.
#/			- Note: This value will be ignored when exclude list is empty.
#/		(OPTIONAL)
#/	--source-back-up-path=</path/to/directory/to/be/backed/up/>
#/			Contents of provided directory will be backed up. When provided,
#/		'$DEFAULT_BACK_UP_SOURCE_PATH' will be ignored.
#/			- Note: Default is to use path from '$DEFAULT_BACK_UP_SOURCE_PATH'.
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Back up is successful.
#/	- 140: Returned when given option is invalid.
#/	- 203: Returned when rsync isn't installed/accessible.
#/ 
#/ EXAMPLE(S):
#/	backUp
#/	backUp --help
#/	backUp --full-back-up
#/	backUp --excluded="</Some Directory Name> </DoNotBackUpIfStartsWith*> "
#/
#/ AUTHOR(S):
#/	- Reed Clanton
#/ 
#/ TODO(S):
#/	- Explore alternatives to rsync that may be used if rsync isn't installed.
#/	- Update RETURN CODE(S) section.
#/	- Update EXAMPLE(S) section.
#/	- Missing back up location should be handled.
#/	- Dynamicly determin if symbolic links can be used based on how destination drive is formatted.
EOF
)

backUp() {
	################################
	## Reset/Set Local Variable(s) ##
	################################
	log -t -c=${FUNCNAME[0]} -m="Resetting local variable(s)..."
	# Logging var(s).
	TRACE_LVL="--caller=${FUNCNAME[0]} --trace"
	DEBUG_LVL="--caller=${FUNCNAME[0]} --debug"
	INFO_LVL="--caller=${FUNCNAME[0]} --info"
	WARN_LVL="--caller=${FUNCNAME[0]} --warn"
	ERROR_LVL="--caller=${FUNCNAME[0]} --error"
	# Tracks directory being backed up.
	backUpSourcePath=$DEFAULT_BACK_UP_SOURCE_PATH
	# Name of directory back ups are stored in.
	backUpDir=$DEFAULT_PARTIAL_BACK_UP_DEST_DIR
	# Tracks if caller provided directory name back up will be stored in.
	backUpDirProvided=false
	# Tracks path back up will be created at.
	backUpDestPath=$DEFAULT_PARTIAL_BACK_UP_DEST_PATH
	# Tracks if caller provided back up destination path.
	backUpDestPathProvided=false
	# Tracks back up command's option(s).
	options="--recursive --copy-links --times --atimes --specials --safe-links --inplace --delete-excluded"
	# Tracks file(s)/directory(ies) that shouldn't be backed up.
	excludeList="$DEFAULT_EXCLUDED_FILES"
	# Tracks if caller provided exclude list.
	excludeListProvided=false
	# Tracks file(s)/directory(ies) that should be backed up even if they match exclude list.
	includeList="$DEFAULT_INCLUDED_FILES"
	# Tracks if caller provided include list.
	includeListProvided=false
	log $TRACE_LVL -m="Local variable(s) reset."

	#####################
	## Process Input(s) ##
	#####################
	# The "@" variable behaves strangely, so save it off.
	atString="$@"
	# Determine if input processing is needed.
	if [ "$atString" ]; then
		log $TRACE_LVL -m="Processing provided argument(s): '$atString'..."
		providedArgs="$@"
		while [ "$providedArgs" ]; do
			# Split out current loop's value from the rest.
			currentArg=${providedArgs%%" -"*}
			# Remove current element from the rest of caller's input.
			providedArgs="${providedArgs#*" -"}"
			if [ "$currentArg" = "$providedArgs" ]; then
				providedArgs=""
			else
				providedArgs="-$providedArgs"
			fi
			# Tracks current argument's value.
			currentArgValue=${currentArg#*=}

			# Determine what user want's done.
			case $currentArg in
				--destination-back-up-directory=*)
					log $TRACE_LVL -m="Setting back up destination directory to: '$currentArgValue'..."
					backUpDir=$currentArgValue
					backUpDirProvided=true
					log $DEBUG_LVL -m="Destination back up directory set."
					;;
				--destination-back-up-path=*)
					log $TRACE_LVL -m="Setting back up destination path to: '$currentArgValue'..."
					backUpDestPath=$currentArgValue
					backUpDestPathProvided=true
					log $DEBUG_LVL -m="Destination back up path set."
					;;
				--exclude=*)
					log $TRACE_LVL -m="Setting exclude list to: '$currentArgValue'..."
					case $currentArgValue in
						\<*\>" ")
							excludeList="$currentArgValue"
							excludeListProvided=true
							log $DEBUG_LVL -m="Exclude list updated."
							;;
						*)
							log $ERROR_LVL --full-title -m="Exclude list format invalid, see doc:"
							echo "$BACK_UP_DOC"
							return 141
							;;
					esac
					;;
				--full-back-up)
					log $TRACE_LVL -m="Configuring full back up..."
					# Update each to default for full back up unless they've been changed.
					if ! $backUpDirProvided; then
						backUpDir=$DEFAULT_FULL_BACK_UP_DEST_DIR
					fi
					if ! $backUpDestPathProvided; then
						backUpDestPath=$DEFAULT_FULL_BACK_UP_DEST_PATH
					fi
					# Remove excluded and include list unless they've been set by caller.
					if ! $excludeListProvided; then
						excludeList=""
					fi
					if ! $includeListProvided; then
						includeList=""
					fi
					log $WARN_LVL -m="Back up will (likely) take a long time..."
					;;
				--include=*)
					log $TRACE_LVL -m="Updating include list with: '$currentArgValue'..."
					case $currentArgValue in
						\<*\>" ")
							includeList="$currentArgValue"
							includeListProvided=true
							log $DEBUG_LVL -m="Include list updated."
							;;
						*)
							log $ERROR_LVL --full-title -m="Include list format invalid, see doc:"
							echo "$BACK_UP_DOC"
							return 141
							;;
					esac
					;;
				-h | --help)
					echo "$BACK_UP_DOC"
					return 0
					;;
				--source-back-up-path=*)
					log $TRACE_LVL -m="Setting back up destination path to: '$currentArgValue'..."
					backUpDestPath="$currentArgValue"
					log $DEBUG_LVL -m="Back up destination path set."
					;;
				*)
					log $ERROR_LVL --full-title -m="Invalid given argument: '$currentArg', see doc:"
					echo "$BACK_UP_DOC"
					return 140
					;;
			esac
		done
	else
		log $DEBUG_LVL -m="Argument processing skipped because none were provided (@: '$atString')."

		# Provide user a chance to cancel.
		countDown=4
		log $INFO_LVL -m="Back up starting in '$countDown' seconds..."
		while [ $countDown -ne 0 ]; do
			countDown=$(($countDown - 1))
			if [ $countDown -eq 0 ]; then
				echo -ne "\033[0K\r$countDown"
			else
				echo -ne "\033[0K\r$countDown"
			fi
			sleep 1
		done
		# Reset cursor to start of line.
		echo -ne "\033[0K\r"
	fi

	###############################
	## Error Checking Environment ##
	###############################
	log $TRACE_LVL -m="Ensuring rsync is installed..."
	if command -v rsync >/dev/null; then
		log $TRACE_LVL -m="rsync is installed."
	else
		log $ERROR_LVL -m="rsync isn't installed."
		return 203
	fi

	##########################
	## Build Back Up Command ##
	##########################
	# Update back up command with exclude list data.
	if [ "$excludeList" ]; then
		log $TRACE_LVL -m="Updating back up command with excluded file(s)/directory(ies)..."
		while [ "$excludeList" ]; do
			# Split out current loop's value from the rest.
			currentExclude=${excludeList#*<}
			currentExclude=${currentExclude%%> *}
			log $TRACE_LVL -m="Excluding '$currentExclude'..."
			# Remove current element from the rest of the list.
			excludeList=${excludeList#*> }
			# Add current element to options.
			options="$options --exclude='$currentExclude'"
		done

		# Update back up command with include list data.
		if [ "$includeList" ]; then
			log $TRACE_LVL -m="Updating back up command with included file(s)/directory(ies)..."
			while [ "$includeList" ]; do
				# Split out current loop's value from the rest.
				currentInclude=${includeList#*<}
				currentInclude=${currentInclude%%> *}
				log $TRACE_LVL -m="Including '$currentInclude'..."
				# Remove current element from the rest of list.
				includeList=${includeList#*> }
				# Add current element to options.
				options="$options --include='$currentInclude'"
			done
		else
			log $TRACE_LVL -m="No file(s)/directory(ies) from excluded list will be included."
		fi
	else
		log $TRACE_LVL -m="No file(s)/directory(ies) will be excluded."
	fi

	################
	## Run Back Up ##
	################
	# Mark back up as in progress.
	inProgressFile="backUpInProgress-$backUpDir"
	inProgressPath=$backUpDestPath/$inProgressFile
	log $INFO_LVL -m="Adding '$inProgressFile' marker file one directory up from back up directory..."
	touch $inProgressPath
	
	# Back up.
	cmd="rsync $options $backUpSourcePath $backUpDestPath$backUpDir"
	log $INFO_LVL -m="Running back up command:" -m="\t'$cmd'"
	unset stdOut stdErr stdRt
	stdOut=$(eval $cmd 2>|stdErr.txt)
	stdRt=$?
	backUpRt=$stdRt
	# Save off stderr and remove temporary file used to store it.
	stdErr=$(cat stdErr.txt)
	rm ./stdErr.txt

	# Produce back up command's output as logs.
	if [ $stdRt -ne 0 ]; then
		log $ERROR_LVL -m="rsync error output:" -m="$stdErr"
	else
		# Let caller know back up was successful.
		log $INFO_LVL -m="Back up successful."
		if [ "$stdOut" != "" ]; then
			log $TRACE_LVL -m="rsync std output:" -m="$stdOut"
		fi
	
		# Rename back up directory now that backup is complete.
		log $DEBUG_LVL -m="Removing in progress marker file..."
		unset stdOut stdErr stdRt
		stdOut=$(eval rm $inProgressPath 2>|stdErr.txt)
		stdRt=$?
		# Save off stderr and remove temporary file used to store it.
		stdErr=$(cat stdErr.txt)
		rm ./stdErr.txt
		# Let user know if rename failed.
		if [ $stdRt -ne 0 ]; then
			log $WARN_LVL -m="Failed to remove in progress marker file."
		fi
	fi

	return $backUpRt
}
