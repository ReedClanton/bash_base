# shellcheck shell=sh

# For more information regarding shellspec's spec_helper file, see: https://github.com/shellspec/shellspec#spec_helper

 ######################################
## Global (Across All specfiles) Data ##
 ######################################
## Constant(s) ##
# Return Value(s) #
OPTION_NAME_INVALID_RT=140
OPTION_VALUE_INVALID_RT=141
## Variable(s) ##
# NoOp
## Function(s) ##
# Value Checking Function(s) #
isPositive() { [ $(($1)) -gt 0 ]; }
isNotNegative() { [ $(($1)) -ge 0 ]; }
## Alias(es) ##
# TODO: Move scriptSourceThis to here.

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
