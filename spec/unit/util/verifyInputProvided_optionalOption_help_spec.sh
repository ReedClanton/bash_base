# Setup required environment variable(s).
% VERIFY_INPUT_PROVIDED_DOC:"#/ DESCRIPTION:"

Describe "Util:" util
	Describe "verifyInputProvided():" util:verifyInputProvided
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/verifyInputProvided.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" utilVerifyInputProvided:optionalOption
			Describe "Help:" utilVerifyInputProvidedOptionalOption:help
				It "-h" utilVerifyInputProvidedOptionalOptionHelp:h
					When run verifyInputProvided -h
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$VERIFY_INPUT_PROVIDED_DOC"
					The status should be success
				End
				It "--help" utilVerifyInputProvidedOptionalOptionHelp:help
					When run verifyInputProvided --help
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$VERIFY_INPUT_PROVIDED_DOC"
					The status should be success
				End
			End
		End
	End
End

