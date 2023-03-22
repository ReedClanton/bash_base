#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the options that add
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) for debug level
#/	(`-d` & `--debug`) provided message text.
#/
#/ USAGE: ./bash_unit [OPTIONS]... ./tests/output/<thisFileName>.sh
#/
#/ TODO(S):
#/	- Test with special characters.
#/	- Test when message text is spread out over multiple lines.
#/	- Test return values.
#/	- Figure out if/how I can move the sourcing of the constents file to a setup method.

#/ DESCRIPTION:
#/	Setup that's run once prior to all test(s) in this file.
#/
#/ TODO(S):
#/	- None
setup_suite() {
	# Allows tests to just call `output` rather than accessing the full path.
	function output() {
		../../../../src/shell/functions/output.sh "${@}"
	}
}

setup() {
	# Ensure required environment variable(s) are set.
	. ../../../../src/shell/shell_functions
	# Ensure required constants have been set.
	. $SHELL_FUNCTIONS_CONSTANTS/output.sh
}

#/ DESCRIPTION:
#/	Ensure message text includes $DEBUG_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `-d`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_-d() {
 	assert_equals "$DEBUG_CHAR sS0 $DEBUG_CHAR" "$(output -m='sS0' --pp -d)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $DEBUG_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `--debug`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_--debug() {
 	assert_equals "$DEBUG_CHAR 0dD $DEBUG_CHAR" "$(output -m='0dD' --pp --debug)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $DEBUG_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `-d`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_-d() {
 	assert_equals "$DEBUG_CHAR 1fF $DEBUG_CHAR" "$(output -m='1fF' --pre-post-fix -d)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $DEBUG_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `--debug`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_--debug() {
 	assert_equals "$DEBUG_CHAR 2gG $DEBUG_CHAR" "$(output -m='2gG' --pre-post-fix --debug)"
}

