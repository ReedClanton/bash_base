#!/usr/bin/env sh

 #####################
## Output Formatting ##
 #####################
# Indicates that text shouldn't be formatted as a title.
declare -irx NO_TITLE=0
# Indicates that text should be formatted as a top level title.
#	Example:
#		 ##############
#		## Title Text ##
#		 ##############
declare -irx FULL_TITLE=1
# Indicates that text should be formatted as a one line title.
#	Example:
#		## Title Text ##
declare -irx LINE_TITLE=2

 #########################
## Shell Function Logging ##
 #########################
>>>>>>> main
# Indicates no logs should be produced.
declare -irx NONE=0
# Indicates that only error level logs should be produced.
declare -irx ERROR=1
# Indicates that error and warning level logs should be produced.
declare -irx WARN=2
# Indicates that error, warning, and info level logs should be produced.
declare -irx INFO=3
# Indicates that error, warning, info, and debug level logs should be produced.
declare -irx DEBUG=4
# Indicates that error, warning, info, debug, and trace level logs should be produced.
declare -irx TRACE=5
# Indicates that all logs should be produced.
declare -irx ALL=$TRACE
# Determines shell function logging level.
declare -ix SHELL_LOG_LEVEL=$INFO

