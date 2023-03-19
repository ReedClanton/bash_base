#/ DESCRIPTION:
#/	Contains unit test(s) of output.sh that only deals with the options that add
#/	a pre-fix and post-fix (`--pp` & `--pre-post-fix`) for info level
#/	(`-i` & `--info`) provided message text.
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
		../../../../src/bash/functions/output.sh "${@}"
	}
}

#/ DESCRIPTION:
#/	Ensure message text includes $INFO_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `-t`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_-i() {
	source ../../../../src/bash/functions/constants/output.sh
 	assert_equals "$INFO_CHAR iI7 $INFO_CHAR" "$(output -m='iI7' --pp -i)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $INFO_CHAR as pre-fix and post-fix when
#/	provided `--pp` and `--info`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pp_--info() {
	source ../../../../src/bash/functions/constants/output.sh
 	assert_equals "$INFO_CHAR oO7 $INFO_CHAR" "$(output -m='oO7' --pp --info)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $INFO_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `-i`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_-i() {
	source ../../../../src/bash/functions/constants/output.sh
 	assert_equals "$INFO_CHAR pP8 $INFO_CHAR" "$(output -m='pP8' --pre-post-fix -i)"
}

#/ DESCRIPTION:
#/	Ensure message text includes $INFO_CHAR as pre-fix and post-fix when
#/	provided `--pre-post-fix` and `--info`.
#/
#/ TODO(S):
#/	- Mock out method call(s).
#/	- Mock out constant(s).
test_output__single_line__--pre-post-fix_--info() {
	source ../../../../src/bash/functions/constants/output.sh
 	assert_equals "$INFO_CHAR aA9 $INFO_CHAR" "$(output -m='aA9' --pre-post-fix --info)"
}

