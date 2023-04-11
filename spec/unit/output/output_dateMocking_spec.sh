Describe "output():" output:output
	# Mock out sourcing of util (constants, globals, helper functions, etc).
	inScriptSource() { return 0; }
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# createHeaderFooter() shouldn't be called, but mock it out just in case.
	createHeaderFooter() { return $CATCHALL_RT; }
	
	Describe "Mock date():" outputOutput:mockDate
		It "Not defined" outputOutputMockDate:notDefined
			When run source $output -f
			The stdout should not be present
			The stderr line 1 should start with "ERROR"
			The status should equal $OPTION_NAME_INVALID_RT
		End
	End
	Describe "Mock date():" outputOutput:mockDate
		date() { echo "2023/03/31 22:06:55 MDT"; }
		It "Defined" outputOutputMockDate:defined
			When run source $output -f
			The stdout should not be present
			The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR"
			The status should equal $OPTION_NAME_INVALID_RT
		End
	End
End

