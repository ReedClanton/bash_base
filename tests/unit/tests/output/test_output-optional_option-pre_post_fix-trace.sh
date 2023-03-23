#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the options that add
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) for trace level
#/	(`-t` & `--trace`) provided message text.
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
#/	Ensure message text includes $TRACE_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `-t`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test__--pp_-t() {
 	assert_equals \
 		"$TRACE_CHAR rR3 $TRACE_CHAR" \
 		"$($output -m='rR3' --pp -t)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $TRACE_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `--trace`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test__--pp_--trace() {
 	assert_equals \
 		"$TRACE_CHAR tT4 $TRACE_CHAR" \
 		"$($output -m='tT4' --pp --trace)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $TRACE_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `-t`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test__--pre-post-fix_-t() {
 	assert_equals \
 		"$TRACE_CHAR yY5 $TRACE_CHAR" \
 		"$($output -m='yY5' --pre-post-fix -t)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $TRACE_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `--trace`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test__--pre-post-fix_--trace() {
 	assert_equals \
 		"$TRACE_CHAR uU6 $TRACE_CHAR" \
 		"$($output -m='uU6' --pre-post-fix --trace)"
}

