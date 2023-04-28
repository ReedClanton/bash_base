Describe "Util:" util
	Describe "verifyInputProvided():" util:verifyInputProvided
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/verifyInputProvided.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Mock date():" utilVerifyInputProvided:mockDate
			It "Not defined" utilVerifyInputProvidedMockDate:notDefined
				When run verifyInputProvided
				The stdout should not be present
				The stderr line 1 should start with "ERROR verifyInputProvided(): "
				The status should equal $ARGUMENT_REQUIRED_NOT_PROVIDED_RT
			End
			It "Defined" utilVerifyInputProvidedMockDate:defined
				date() { echo "2023/03/31 22:06:55 MDT"; }
				When run verifyInputProvided
				The stdout should not be present
				The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR verifyInputProvided(): "
				The status should equal $ARGUMENT_REQUIRED_NOT_PROVIDED_RT
			End
		End
	End
End

