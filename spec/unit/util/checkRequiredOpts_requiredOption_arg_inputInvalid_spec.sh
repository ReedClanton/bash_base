# Setup required environment variable(s).
% CHECK_REQUIRED_OPTS_DOC:"#/ DESCRIPTION:"

Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" utilCheckRequiredOpts:requiredOption
			Describe "Arg:" utilCheckRequiredOptsRequiredOption:arg
				Describe "Input invalid:" utilCheckRequiredOptsRequiredOptionArg:inputInvalid
					It "None" utilCheckRequiredOptsRequiredOptionArgInputInvalid:none
						When run checkRequiredOpts "$CALLING_DOC"
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$CHECK_REQUIRED_OPTS_DOC"
						The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
					End
					Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:a
						It "Missing" utilCheckRequiredOptsRequiredOptionArgInputInvalidA:missing
							When run checkRequiredOpts "$CALLING_DOC" -a
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr should include "$CHECK_REQUIRED_OPTS_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:arg
						It "Missing" utilCheckRequiredOptsRequiredOptionArgInputInvalidArg:missing
							When run checkRequiredOpts "$CALLING_DOC" --arg
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr should include "$CHECK_REQUIRED_OPTS_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "Invalid character:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:invalidCharacter
						Describe "-a" utilCheckRequiredOptsRequiredOptionArgInputInvalidInvalidCharacter:a
							Todo "Write tests"
						End
						Describe "--arg" utilCheckRequiredOptsRequiredOptionArgInputInvalidInvalidCharacter:arg
							Todo "Write tests"
						End
					End
				End
			End
		End
	End
End

