#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the option that adds
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) to the provided message text.
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
#/	Ensure message text includes $DEFAULT_CHAR as pre-fix and post-fix when
#/	provided `--pp`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp() {
 	assert_equals "$DEFAULT_CHAR wW1 $DEFAULT_CHAR" "$(output -m='wW1' --pp)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $DEFAULT_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix() {
 	assert_equals "$DEFAULT_CHAR eE2 $DEFAULT_CHAR" "$(output -m='eE2' --pre-post-fix)"
}

