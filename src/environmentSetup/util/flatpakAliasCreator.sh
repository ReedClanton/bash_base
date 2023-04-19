#!/usr/bin/env sh

##########################
## Global(s)/Constant(s) ##
##########################
## Global(s) ##
# NoOp
## Constant(s) ##
# NoOp

######################
## Local Variable(s) ##
######################
# NoOp

################
## Function(s) ##
################
IFS='' read -r -d '' FLATPAK_ALIAS_CREATOR_DOC <<"EOF"
#/ DESCRIPTION:
#/	Generates an alias for each flatpak app installed on system. Allows user to
#/	set alias name. Aliases are written to a file in the user's home shell directory.
#/
#/ USAGE: flatpakAliasCreator [OPTIONS]...
#/
#/ NOTE(S):
#/	- Don't re-direct standard out when you call this because it takes input from user.
#/
#/ OPTION(S):
#/	-h, --help
#/		Print this help message. Function will return code of '0'. No processing will be done.
#/		(OPTIONAL)
#/ 
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Aliases are created and written to file.
#/	- 140: Returned when given option name is invalid.
#/	- 161: Returned when failed to create file for flatpak aliases.
#/	- 161: Returned when failed to write to flatpak aliases file and file is then removed.
#/	- 162: Returned when failed to write to flatpak aliases file and failed to
#/			remove file. User must remove it manually.
#/	- 164: Returned when failed to write to flatpak aliases file and failed to
#/			remove it because it couldn't be accessed.
#/
#/ EXAMPLE(S):
#/	flatpakAliasCreator
#/	flatpakAliasCreator -h
#/	flatpakAliasCreator --help
#/
#/ TODO(S):
#/	- None
EOF
funcName=flatpakAliasCreator

log -c=$funcName -m="Resetting local variable(s)..."
################################
## Reset/Set Local Variable(s) ##
################################
# Logging var(s).
traceLvl="-c=$funcName"
readonly traceLvl
debugLvl="-d -c=$funcName"
readonly debugLvl
infoLvl="-i -c=$funcName"
readonly infoLvl
warnLvl="-w -c=$funcName"
readonly warnLvl
errorLvl="-e -c=$funcName"
readonly errorLvl
# Tracks user's home directory.
usrHome=$HOME
readonly usrHome
# Location of flatpak alias file.
flatpakAliasFilePath=$usrHome/shell/shell_flatpak_aliases
# Header added to top of flatpak aliases file.
flatpakAliasTemplateTop="#!/usr/bin/env sh\n\n #####################\n## Flatpak Alias(es) ##\n #####################\n"
readonly flatpakAliasTemplateTop
log $traceLvl -m="Local variable(s) reset."

######################
## Process Option(s) ##
######################
for fullArg in "$@"; do
	log $traceLvl -m="Processing option: '$fullArg'..."
	# Tracks value of current option.
	arg=${fullArg#*=}

	# Determine what option user gave.
	case $fullArg in
		-h|--help)
			echo "$FLATPAK_ALIAS_CREATOR_DOC"
			exit 0
			;;
		*)
			log $errorLvl --full-title -m="Invalid given argument: '$fullArg', see doc:"
			echo "$FLATPAK_ALIAS_CREATOR_DOC"
			exit 140
			;;
	esac
done

#############################################
## Creation & Setup of Flatpak Aliases File ##
#############################################
log $debugLvl -m="Creation & setup of flatpak alias file in '$flatpakAliasFilePath'..."
## Creation ##
cmd="touch $flatpakAliasFilePath"
unset stdOut errOut rtOut
eval "$( (eval $cmd) \
	2> >(errOut=$(cat); typeset -p errOut) \
	 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"

# Ensure flatpak alias file was created.
if [[ $rtOut -eq 0 ]]; then
	## Setup ##
	log $debugLvl -m="Flatpak aliases file created, formatting it..."
	aliases=$flatpakAliasTemplateTop

	for flatpakPath in /var/lib/flatpak/app/*; do
		# Track app and alias name.
		fullFlatpakAppName=${flatpakPath#/var/lib/flatpak/app/}
		flatpakAppName=${fullFlatpakAppName##*.}
		flatpakAppName="$(tr '[:upper:]' '[:lower:]' <<< ${flatpakAppName:0:1})${flatpakAppName:1}"

		# Ask user what alias name they want to use.
		printf "Generate alias of flatpak app '$fullFlatpakAppName' named '$flatpakAppName' (Y/skip/<aliasName>): "
		read usrInput
		# Process user's input.
		if [[ "$usrInput" != "skip" ]]; then
			if [[ "$usrInput" != "Y" && "$usrInput" != "y" && "$usrInput" != "" ]]; then
				flatpakAppName=$usrInput
			fi

			log $infoLvl -m="Generating alias of flatpak app '$fullFlatpakAppName' with name '$flatpakAppName'..."
			aliases="${aliases}alias $flatpakAppName=\"flatpak run $fullFlatpakAppName\"\n"
		else
			log $infoLvl -m="Skipped alias creation for '$fullFlatpakAppName'."
		fi
	done

	# Write flatpak aliases file.
	cmd="printf '$aliases\n' >$flatpakAliasFilePath 2>&1"
	unset stdOut errOut rtOut
	eval "$( (eval $cmd) \
		2> >(errOut=$(cat); typeset -p errOut) \
		 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
	# Ensure file was written to successfully.
	if [[ $rtOut -eq 0 ]]; then
		log $infoLvl -m="Flatpak alias(es) file creation successful."
		exit 0
	else
		log $errorLvl -m="Failed to write alias(es) to '$flatpakAliasFilePath', removing file..."
		# Remove flatpak aliases file if it exits.
		if [[ -f "$flatpakAliasFilePath" ]]; then
			cmd="rm -rf $flatpakAliasFilePath"
			unset stdOut errOut rtOut
			eval "$( (eval $cmd) \
				2> >(errOut=$(cat); typeset -p errOut) \
				 > >(stdOut=$(cat); typeset -p stdOut); rtOut=$?; typeset -p rtOut )"
			if [[ $rtVal -ne 0 ]]; then
				log $errorLvl -m="Failed to remove flatpak aliases file '$flatpakAliasFilePath'."
				exit 162
			fi
		else
			log $warnLvl -m="Flatpak aliases file doesn't exist or can't be accessed, removal skipped."
			exit 164
		fi
		log $infoLvl -m="Removed flatpak aliases file."
		exit 161
	fi
else
	log $errorLvl -m="Failed to create file for flatpak aliases ($flatpakAliasFilePath)."
	exit 161
fi
