#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the options that add
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) for debug level
#/	(`-e` & `--error`) provided message text.
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
#/	Ensure message text includes $ERROR_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `-e`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_-e() {
 	assert_equals "$ERROR_CHAR 7zZ $ERROR_CHAR" "$($output -m='7zZ' --pp -e)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $ERROR_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `--error`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_--error() {
 	assert_equals "$ERROR_CHAR 8xX $ERROR_CHAR" "$($output -m='8xX' --pp --error)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $ERROR_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `-e`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_-e() {
 	assert_equals "$ERROR_CHAR 9cC $ERROR_CHAR" "$($output -m='9cC' --pre-post-fix -e)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $ERROR_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `--error`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_--error() {
 	assert_equals "$ERROR_CHAR 0vV $ERROR_CHAR" "$($output -m='0vV' --pre-post-fix --error)"
}

