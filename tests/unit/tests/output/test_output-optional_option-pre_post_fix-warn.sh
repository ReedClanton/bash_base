#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the options that add
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) for debug level
#/	(`-w` & `--warn`) provided message text.
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
	# Ensure required environment variable(s) are set.
	. ../../../../src/shell/shell_functions
	# Short hand used to call function so full path doesn't have to be used each time.
	output=$SHELL_FUNCTIONS/output/output.sh "${@}"
	# Ensure required constants have been set.
	. $SHELL_FUNCTIONS/output/constents.sh
}

#/ DESCRIPTION:
#/	Ensure message text includes $WARN_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `-w`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_-w() {
 	assert_equals "$WARN_CHAR 3hH $WARN_CHAR" "$($output -m='3hH' --pp -w)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $WARN_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `--warn`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_--warn() {
 	assert_equals "$WARN_CHAR 4jJ $WARN_CHAR" "$($output -m='4jJ' --pp --warn)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $WARN_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `-w`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_-w() {
 	assert_equals "$WARN_CHAR 5kK $WARN_CHAR" "$($output -m='5kK' --pre-post-fix -w)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $WARN_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `--warn`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_--warn() {
 	assert_equals "$WARN_CHAR 6lL $WARN_CHAR" "$($output -m='6lL' --pre-post-fix --warn)"
}

