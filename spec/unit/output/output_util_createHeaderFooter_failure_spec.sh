# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "createHeaderFooter() failure:" outputOutput:createHeaderFooterFailure
			Describe "Non zero return code:" outputOutputCreateHeaderFooterFailure:nonZeroReturnCode
				It "140" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:140
					createHeaderFooter() { return $OPTION_NAME_INVALID_RT; }
					cat() { createHeaderFooter; }
					When run output -m=m -p
					The stdout should not be present
					The stderr should include "ERROR"
					The status should equal $MINOR_EXECUTION_FAILURE_RT
				End
				It "141" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:141
					createHeaderFooter() { return $OPTION_VALUE_INVALID_RT; }
					cat() { createHeaderFooter; }
					When run output -m=ms --header-footer
					The stdout should not be present
					The stderr should include "ERROR"
					The status should equal $MINOR_EXECUTION_FAILURE_RT
				End
				It "202" outputOutputCreateHeaderFooterFailureNonZeroReturnCode:202
					createHeaderFooter() { return $CODE_NOT_ACCESSIBLE_RT; }
					cat() { createHeaderFooter; }
					When run output -m="message 1" -m=msg2 --pretty
					The stdout should not be present
					The stderr should include "ERROR"
					The status should equal $MINOR_EXECUTION_FAILURE_RT
				End
			End
		End
	End
End

