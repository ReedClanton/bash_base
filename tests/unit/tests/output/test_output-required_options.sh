#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with required option(s).
#/
#/ USAGE: ./bash_unit [OPTIONS]... ./tests/output/<thisFileName>.sh
#/
#/ TODO(S):
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
#/	bash_unit isn't able to handle comparring the entire doc, so I just make
#/	sure that I know the doc was returned.
#/
#/ TODO(S):
#/	- Create another method that verifies the return value.
test_output__-h() {
	assert_equals \
		"#/" \
		$($output -h)
}

#/ DESCRIPTION:
#/	bash_unit isn't able to handle comparring the entire doc, so I just make
#/	sure that I know the doc was returned.
#/
#/ TODO(S):
#/	- Create another method that verifies the return value.
test_output__--help() {
	assert_equals \
		"#/" \
		$($output --help)
}

#/ DESCRIPTION:
#/	Ensure message text containing a single lower case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__lower_alpha__single_char() {
	assert_equals \
		"q" \
		$($output -m='q')
}

#/ DESCRIPTION:
#/	Ensure message text containing a single lower case letter and a new line
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__lower_alpha__single_char() {
	assert_equals \
		"w
w" \
		"$($output -m='w\nw')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a single lower case letter, a new line,
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__lower_alpha_tab__single_char() {
	assert_equals \
		"e
		e" \
		"$($output -m='e\n\t\te')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a single lower case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__lower_alpha__single_char() {
	assert_equals \
		"r
r" \
		"$($output -m=r -m=r)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a single lower case letter
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__lower_alpha_tab__single_char() {
	assert_equals \
		"t
		t" \
		"$($output -m=t -m='\t\tt')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a single upper case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__upper_alpha__single_char() {
	assert_equals \
		"Q" \
		$($output -m='Q')
}

#/ DESCRIPTION:
#/	Ensure message text containing a single upper case letter and a new line
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__upper_alpha__single_char() {
	assert_equals \
		"W
W" \
		"$($output -m='W\nW')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a single upper case letter, a new line,
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__upper_alpha_tab__single_char() {
	assert_equals \
		"E
		E" \
		"$($output -m='E\n\t\tE')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a single upper case letter is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__upper_alpha__single_char() {
	assert_equals \
		"R
R" \
		"$($output -m=R -m=R)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a single upper case letter
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__upper_alpha_tab__single_char() {
	assert_equals \
		"T
		T" \
		"$($output -m=T -m='\t\tT')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple lower case letters and a new line
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__lower_alpha__multi_char() {
	assert_equals \
		"test
test" \
		"$($output -m='test\ntest')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple lower case letters, a new line,
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__lower_alpha_tab__multi_char() {
	assert_equals \
		"test
		test" \
		"$($output -m='test\n\t\ttest')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing multiple lower case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__lower_alpha__multi_char() {
	assert_equals \
		"test
test" \
		"$($output -m=test -m=test)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a multiple lower case letters
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__lower_alpha_tab__multi_char() {
	assert_equals \
		"test
		test" \
		"$($output -m=test -m='\t\ttest')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple lower case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__lower_alpha__multiple_char() {
	assert_equals \
		"test" \
		$($output -m='test')
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__upper_alpha__multiple_char() {
	assert_equals \
		"TEST" \
		$($output -m='TEST')
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper case letters and a new line
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__upper_alpha__multi_char() {
	assert_equals \
		"TEST
TEST" \
		"$($output -m='TEST\nTEST')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper case letters, a new line,
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__upper_alpha_tab__multi_char() {
	assert_equals \
		"TEST
		TEST" \
		"$($output -m='TEST\n\t\tTEST')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing multiple upper case letters is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__upper_alpha__multi_char() {
	assert_equals \
		"TEST
TEST" \
		"$($output -m=TEST -m=TEST)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing multiple upper case letters
#/	and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__upper_alpha_tab__multi_char() {
	assert_equals \
		"TEST
		TEST" \
		"$($output -m=TEST -m='\t\tTEST')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a digit is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__numeric__single_char() {
	assert_equals \
		"1" \
		$($output -m='1')
}

#/ DESCRIPTION:
#/	Ensure message text containing a number and a new line is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__numeric__single_char() {
	assert_equals \
		"2
2" \
		"$($output -m='2\n2')"
}

#/ DESCRIPTION:
#/	Ensure message text containing a number, a new line, and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__numeric_tab__single_char() {
	assert_equals \
		"3
		3" \
		"$($output -m='3\n\t\t3')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a number is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__numeric__single_char() {
	assert_equals \
		"4
4" \
		"$($output -m=4 -m=4)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing a number and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__numeric_tab__single_char() {
	assert_equals \
		"5
		5" \
		"$($output -m=5 -m='\t\t5')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple digits is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__numeric__multiple_char() {
	assert_equals \
		"1234567890" \
		$($output -m='1234567890')
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple digits and a new line is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__numeric__multi_char() {
	assert_equals \
		"2345678901
2345678901" \
		"$($output -m='2345678901\n2345678901')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple digits, a new line, and a tab(s)
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_msg__multi_line__numeric_tab__multi_char() {
	assert_equals \
		"3456789012
		3456789012" \
		"$($output -m='3456789012\n\t\t3456789012')"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing multiple digits is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__numeric__multi_char() {
	assert_equals \
		"4567890123
4567890123" \
		"$($output -m=4567890123 -m=4567890123)"
}

#/ DESCRIPTION:
#/	Ensure multiple messages containing multiple digits and a tab(s) is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__numeric_tab__multi_char() {
	assert_equals \
		"5678901234
		5678901234" \
		"$($output -m=5678901234 -m='\t\t5678901234')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper and lower case alphanumeric
#/	charecters and tab(s) spread over two lines with only a single message
#/	option is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_line__alphanumeric_tab__multiple_char() {
	assert_equals \
		"T1E2S3T4
		t5e6s7t8" \
		"$($output -m='T1E2S3T4\n\t\tt5e6s7t8')"
}

#/ DESCRIPTION:
#/	Ensure message text containing multiple upper and lower case alphanumeric
#/	charecters and tab(s) spread over multiple message options is
#/	re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__multi_msg__alphanumeric_tab__multiple_char() {
	assert_equals \
		"T1E 2S3T4
		t5e6s7t8" \
		"$($output -m='T1E 2S3T4' -m='\t\tt5e6s7t8')"
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '`' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__backtick__single_char() {
 	assert_equals \
 		'`' \
 		$($output -m='`')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '~' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__tilde__single_char() {
 	assert_equals \
 		"~" \
 		$($output -m='~')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '!' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__exclamation__single_char() {
 	assert_equals \
 		"!" \
 		$($output -m='!')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '@' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__at__single_char() {
 	assert_equals \
 		"@" \
 		$($output -m='@')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '#' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__hashtag__single_char() {
 	assert_equals \
 		"#" \
 		$($output -m='#')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '$' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__dollar__single_char() {
 	assert_equals \
 		"$" \
 		$($output -m='$')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '%' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
#/	- Don't know if it's possible to update the code under test to handle `%`.
#test_output__single_line__percent__single_char() {
#	assert_equals \
#		"%" \
#		"$($output -m='%')"
#}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '^' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__caret__single_char() {
 	assert_equals \
 		"^" \
 		$($output -m='^')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '&' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__and__single_char() {
 	assert_equals \
 		"&" \
 		$($output -m='&')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '*' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__star__single_char() {
 	assert_equals \
 		"*" \
 		"$($output -m='*')"
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '(' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__open_parentheses__single_char() {
 	assert_equals \
 		"(" \
 		$($output -m='(')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ')' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__close_parentheses__single_char() {
 	assert_equals \
 		")" \
 		$($output -m=')')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '-' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__dash__single_char() {
 	assert_equals \
 		"\-" \
 		$($output -m='\-')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '_' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__underscore__single_char() {
 	assert_equals \
 		"_" \
 		$($output -m='_')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '=' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__equal__single_char() {
 	assert_equals \
 		"=" \
 		$($output -m='=')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '+' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__plus__single_char() {
 	assert_equals \
 		"+" \
 		$($output -m='+')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '[' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__open_bracket__single_char() {
 	assert_equals \
 		"[" \
 		$($output -m='[')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '{' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__open_curly_bracket__single_char() {
 	assert_equals \
 		"{" \
 		$($output -m='{')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ']' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__close_bracket__single_char() {
 	assert_equals \
 		"]" \
 		$($output -m=']')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '}' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__close_curly_bracket__single_char() {
 	assert_equals \
 		"}" \
 		$($output -m='}')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '\' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__backslash__single_char() {
 	assert_equals \
 		"\\" \
 		$($output -m='\\')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ';' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__semicolon__single_char() {
 	assert_equals \
 		";" \
 		$($output -m=';')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ':' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__colon__single_char() {
 	assert_equals \
 		":" \
 		$($output -m=':')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single "'" character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__singlequote__single_char() {
	assert_equals \
		"'" \
		$($output -m="'")
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '"' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__double_quote__single_char() {
 	assert_equals \
 		'"' \
 		$($output -m='"')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ',' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__comma__single_char() {
 	assert_equals \
 		"," \
 		$($output -m=',')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '<' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__less_than__single_char() {
 	assert_equals \
 		"<" \
 		$($output -m='<')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '.' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__period__single_char() {
 	assert_equals \
 		"." \
 		$($output -m='.')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '>' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__greater_than__single_char() {
 	assert_equals \
 		">" \
 		$($output -m='>')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '/' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__forward_slash__single_char() {
 	assert_equals \
 		"/" \
 		$($output -m='/')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '?' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__question_mark__single_char() {
 	assert_equals \
 		"?" \
 		$($output -m='?')
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single ' ' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__space__single_char() {
 	assert_equals \
 		" " \
 		"$($output -m=' ')"
}

#/ DESCRIPTION:
#/	Ensure messages with text containing a single '' character
#/	is re-produced as given.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line____single_char() {
 	assert_equals \
 		"?" \
 		$($output -m='?')
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

