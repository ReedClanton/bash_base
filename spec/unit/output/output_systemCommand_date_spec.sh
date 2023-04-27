Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Mock date():" outputOutput:mockDate
			It "Not defined" outputOutputMockDate:notDefined
				When run output -f
				The stdout should not be present
				The stderr line 1 should start with "ERROR output():	"
				The status should equal $OPTION_NAME_INVALID_RT
			End
			It "Defined" outputOutputMockDate:defined
				date() { echo "2023/03/31 22:06:55 MDT"; }
				When run output -f
				The stdout should not be present
				The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR"
				The status should equal $OPTION_NAME_INVALID_RT
			End
		End
	End
End

