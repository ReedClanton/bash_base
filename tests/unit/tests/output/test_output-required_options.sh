#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with required option(s).
#/
#/ USAGE: ./bash_unit [OPTIONS]... ./tests/output/<thisFileName>.sh
#/
#/ TODO(S):
#/	- Test special characters.
#/	- Test when message text is spread out over multiple lines.
#/	- Test return values.
#/	- Test --help.
#/	- Test -h.

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
#/	Ensure message text containing a single lower case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__lower_alpha__single_char() {
	assert_equals "q" "$($output -m='q')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a single upper case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__upper_alpha__single_char() {
	assert_equals "Q" "$($output -m='Q')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple lower case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__lower_alpha__multiple_char() {
	assert_equals "test" "$($output -m='test')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__upper_alpha__multiple_char() {
	assert_equals "TEST" "$($output -m='TEST')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a digit is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__numeric__single_char() {
	assert_equals "1" "$($output -m='1')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple digits is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__numeric__multiple_char() {
	assert_equals "1234567890" "$($output -m='1234567890')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple lower case alphanumeric charecters
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__lower_alphanumeric__multiple_char() {
	assert_equals "t1e2s3t4" "$($output -m='t1e2s3t4')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper case alphanumeric charecters
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__upper_alphanumeric__multiple_char() {
 	assert_equals "T1E2S3T4" "$($output -m='T1E2S3T4')"
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single special character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__special__single_char() {
 	assert_equals "!" "$($output -m='!')"
 	assert_equals "@" "$($output -m='@')"
 	assert_equals "#" "$($output -m='#')"
 	assert_equals "$" "$($output -m='$')"
# 	assert_equals "%" "$($output -m='%')"
 	assert_equals "^" "$($output -m='^')"
 	assert_equals "&" "$($output -m='&')"
 	assert_equals "*" "$($output -m='*')"
 	assert_equals "(" "$($output -m='(')"
 	assert_equals ")" "$($output -m=')')"
 	assert_equals "\-" "$($output -m='\-')"
 	assert_equals "_" "$($output -m='_')"
 	assert_equals "=" "$($output -m='=')"
 	assert_equals "+" "$($output -m='+')"
 	assert_equals "[" "$($output -m='[')"
 	assert_equals "{" "$($output -m='{')"
 	assert_equals "]" "$($output -m=']')"
 	assert_equals "}" "$($output -m='}')"
 	assert_equals "\\" "$($output -m='\\')"
 	assert_equals "\\" "$($output -m='\\')"
 	assert_equals ";" "$($output -m=';')"
 	assert_equals ":" "$($output -m=':')"
# 	assert_equals "'" "$($output -m=''')"
 	assert_equals '"' "$($output -m='"')"
 	assert_equals "," "$($output -m=',')"
 	assert_equals "<" "$($output -m='<')"
 	assert_equals "." "$($output -m='.')"
 	assert_equals ">" "$($output -m='>')"
 	assert_equals "/" "$($output -m='/')"
 	assert_equals "?" "$($output -m='?')"
 	assert_equals " " "$($output -m=' ')"
 	assert_equals '`' "$($output -m='`')"
 	assert_equals "~" "$($output -m='~')"
 	assert_equals "?" "$($output -m='?')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a single lower case letter results in a
#/	non-error return code.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
#/	- Figure out why output always returns 127.
#test_output__single_line__lower_alpha__single_char__valid_return_code() {
#	assert_status_code 0 "$($output -m='t')"
#}

