######################
## Output Formatting ##
######################
# Indicates that text shouldn't be formatted as a title.
NO_TITLE=0
readonly NO_TITLE
export NO_TITLE
# Indicates that text should be formatted as a top level title.
#	Example:
#		 ##############
#		## Title Text ##
#		 ##############
FULL_TITLE=1
readonly FULL_TITLE
export FULL_TITLE
# Indicates that text should be formatted as a one line title.
#	Example:
#		## Title Text ##
LINE_TITLE=2
readonly LINE_TITLE
export LINE_TITLE

##########################
## Shell Function Logging ##
##########################
# Indicates no logs should be produced.
NONE=0
readonly NONE
export NONE
# Indicates that only error level logs should be produced.
ERROR=1
readonly ERROR
export ERROR
# Indicates that error and warning level logs should be produced.
WARN=2
readonly WARN
export WARN
# Indicates that error, warning, and info level logs should be produced.
INFO=3
readonly INFO
export INFO
# Indicates that error, warning, info, and debug level logs should be produced.
DEBUG=4
readonly DEBUG
export DEBUG
# Indicates that error, warning, info, debug, and trace level logs should be produced.
TRACE=5
readonly TRACE
export TRACE
# Indicates that all logs should be produced.
ALL=6
readonly ALL
export ALL
# Determines shell function logging level.
SHELL_LOG_LEVEL=3
export SHELL_LOG_LEVEL
