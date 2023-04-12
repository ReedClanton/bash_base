# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Mock out sourcing of util (constants, globals, helper functions, etc).
	inScriptSource() { return 0; }
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "createHeaderFooter() failure:" outputOutput:createHeaderFooterFailure
		DEFAULT_CHAR='#'
		
		Describe "Non zero return code:" outputOutputCreateHeaderFooterFailure:nonZeroReturnCode
			It "140" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:140
				createHeaderFooter() { return $OPTION_NAME_INVALID_RT; }
				When run source $output -m=m -p
				The stdout should not be present
				The stderr should include "ERROR"
				The status should equal $MINOR_EXECUTION_FAILURE_RT
			End
			It "141" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:141
				createHeaderFooter() { return $OPTION_VALUE_INVALID_RT; }
				When run source $output -m=ms --header-footer
				The stdout should not be present
				The stderr should include "ERROR"
				The status should equal $MINOR_EXECUTION_FAILURE_RT
			End
			It "202" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:202
				createHeaderFooter() { return $CODE_NOT_ACCESSIBLE_RT; }
				When run source $output -m="message 1" -m=msg2 --pretty
				The stdout should not be present
				The stderr should include "ERROR"
				The status should equal $MINOR_EXECUTION_FAILURE_RT
			End
		End
	End
End

