#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the determines how
#/	much indentation is added prior to the given message text (`--indent`).
#/
#/ USAGE: ./bash_unit [OPTIONS]... ./tests/output/<thisFileName>.sh
#/
#/ TODO(S):
#/	- Test with special characters.
#/	- Test return values.
#/	- TODO

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
}

#/ DESCRIPTION:
#/	Ensure indent option can handle a value of 0.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__no_indent() {
 	assert_equals "a" "$($output -m='a' --indent=0)"
}

#/ DESCRIPTION:
#/	Ensure indent option can handle a value of 1.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__single_indent() {
 	assert_equals " a" "$($output -m='a' --indent=1)"
}

#/ DESCRIPTION:
#/	TODO
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
#/	- Figure out why it always returns 3 rather than 2.
#test_output__single_line__lower_alpha__single_char__invalid_return_code() {
# 	assert_status_code 2 "$($output -m='a' --indent=-1)"
#}

