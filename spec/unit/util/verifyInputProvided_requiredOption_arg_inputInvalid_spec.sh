# Setup required environment variable(s).
% VERIFY_INPUT_PROVIDED_DOC:"#/ DESCRIPTION:"

Describe "Util:" util
	Describe "verifyInputProvided():" util:verifyInputProvided
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/verifyInputProvided.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" utilVerifyInputProvided:requiredOption
			Describe "Arg:" utilVerifyInputProvidedRequiredOption:arg
				Describe "Input invalid:" utilVerifyInputProvidedRequiredOptionArg:inputInvalid
					It "None" utilVerifyInputProvidedRequiredOptionArgInputInvalid:none
						When run verifyInputProvided "$CALLING_DOC"
						The stdout should not be present
						The stderr line 1 should start with "ERROR verifyInputProvided(): "
						The stderr line 2 should include "$VERIFY_INPUT_PROVIDED_DOC"
						The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
					End
					Describe "-a:" utilVerifyInputProvidedRequiredOptionArgInputInvalid:a
						It "Missing" utilVerifyInputProvidedRequiredOptionArgInputInvalidA:missing
							When run verifyInputProvided "$CALLING_DOC" -a
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$VERIFY_INPUT_PROVIDED_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--arg:" utilVerifyInputProvidedRequiredOptionArgInputInvalid:arg
						It "Missing" utilVerifyInputProvidedRequiredOptionArgInputInvalidArg:missing
							When run verifyInputProvided "$CALLING_DOC" --arg
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$VERIFY_INPUT_PROVIDED_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
			End
		End
	End
End

