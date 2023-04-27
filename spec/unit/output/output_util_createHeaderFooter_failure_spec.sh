# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Util:" outputOutput:util
			Describe "createHeaderFooter():" outputOutputUtil:createHeaderFooter
				Describe "Failure:" outputOutputUtilCreateHeaderFooter:failure
					Describe "Non zero return code:" outputOutputUtilCreateHeaderFooterFailure:nonZeroReturnCode
						It "140" outputOutputUtilCreateHeaderFooterFailureNonZeroReturnCode:140
							createHeaderFooter() { return $OPTION_NAME_INVALID_RT; }
							cat() { createHeaderFooter; }
							When run output -m=m -p
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "141" outputOutputUtilCreateHeaderFooterFailureNonZeroReturnCode:141
							createHeaderFooter() { return $OPTION_VALUE_INVALID_RT; }
							cat() { createHeaderFooter; }
							When run output -m=ms --header-footer
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "142" outputOutputUtilCreateHeaderFooterFailureNonZeroReturnCode:142
							createHeaderFooter() { return $OPTION_REQUIRED_NOT_PROVIDED_RT; }
							cat() { createHeaderFooter; }
							When run output -m="message 1" -m=msg2 --pretty
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
			End
		End
	End
End

