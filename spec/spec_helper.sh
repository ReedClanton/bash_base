# shellcheck shell=sh

# For more information regarding shellspec's spec_helper file, see: https://github.com/shellspec/shellspec#spec_helper

#######################################
## Global (Across All specfiles) Data ##
#######################################
## Constant(s) ##
# Return Value(s) #
CATCHALL_RT=1
MINOR_EXECUTION_FAILURE_RT=3
COMMAND_NOT_FOUND_RT=127
OPTION_NAME_INVALID_RT=140
OPTION_VALUE_INVALID_RT=141
OPTION_REQUIRED_NOT_PROVIDED_RT=142
ARGUMENT_REQUIRED_NOT_PROVIDED_RT=152
ENV_VAR_BAD_VALUE_RT=200
CODE_NOT_ACCESSIBLE_RT=202
REQUIRED_SYSTEM_COMMAND_NOT_ACCESSIBLE_RT=203
GENERIC_ENVIRONMENT_ISSUE_RT=209

## Variable(s) ##
# NoOp

## Function(s) ##
# Value Checking Function(s) #
isPositive() { [ $(($1)) -gt 0 ]; }
isNotNegative() { [ $(($1)) -ge 0 ]; }
isGreaterThan() { [ $1 -gt $2 ]; }
isInclusivelyBetween() { [ $1 -le $2 ] && [ $2 -le $3 ]; }
containsTab() {
	# Save off test output.
	testOutput="${containsTab:?}"
	if [ "${testOutput#*"	"*}" != "$testOutput" ] || [ "${testOutput#*"\t"*}" != "$testOutput" ]; then
		return 0
	fi
	return 3
}
containsVerticalTab() {
	# Save off test output.
	testOutput="${containsVerticalTab:?}"
	if [ "${testOutput#*"$(printf "\v")"*}" != "$testOutput" ] || [ "${testOutput#*"\v"*}" != "$testOutput" ]; then
		return 0
	fi
	return 3
}
containsFormFeed() {
	# Save off test output.
	testOutput="${containsFormFeed:?}"
	if [ "${testOutput#*"$(printf "\f")"*}" != "$testOutput" ] || [ "${testOutput#*"\f"*}" != "$testOutput" ]; then
		return 0
	fi
	return 3
}
containsCarriageReturn() {
	# Save off test output.
	testOutput="${containsCarriageReturn:?}"
	if [ "${testOutput#*"$(printf "\r")"*}" != "$testOutput" ] || [ "${testOutput#*"\r"*}" != "$testOutput" ]; then
		return 0
	fi
	return 3
}
containsEscapeSequence() {
	# Save off test output.
	testOutput="${containsEscapeSequence:?}"
	if [ "${testOutput#*"$(printf "\e")"*}" != "$testOutput" ] || [ "${testOutput#*"\e"*}" != "$testOutput" ]; then
		return 0
	fi
	return 3
}
# Shell Checking Function(s) #
isNotBash() {
	psCmd=$(ps -p$$ -ocommand=)
	if [ "$psCmd" = "${psCmd%bash*}" ]; then
		return 0
	fi
	return 1
}
isNotDash() {
	psCmd=$(ps -p$$ -ocommand=)
	if [ "$psCmd" = "${psCmd%*dash*}" ]; then
		return 0
	fi
	return 1
}
isNotKsh() {
	psCmd=$(ps -p$$ -ocommand=)
	if [ "$psCmd" = "${psCmd%ksh*}" ]; then
		return 0
	fi
	return 1
}
isNotZsh() {
	psCmd=$(ps -p$$ -ocommand=)
	if [ "$psCmd" = "${psCmd%zsh*}" ]; then
		return 0
	fi
	return 1
}
# Mocking System Commands #
# Most code uses the 'cat' command to copy method doc to a variable, so it's mocked here.
cat() { input=""; read input; echo $input; }
# Used to mock out sourcing of util (constants, globals, helper functions, etc).
inScriptSource() { return 0; }
## Alias(es) ##
# NoOp

# This callback function will be invoked only once before loading specfiles.
spec_helper_precheck() {
  # Available functions: info, warn, error, abort, setenv, unsetenv
  # Available variables: VERSION, SHELL_TYPE, SHELL_VERSION
  : minimum_version "0.28.1"
}

# This callback function will be invoked after a specfile has been loaded.
spec_helper_loaded() {
  :
}

# This callback function will be invoked after core modules has been loaded.
spec_helper_configure() {
  # Available functions: import, before_each, after_each, before_all, after_all
  : import 'support/custom_matcher'
}
