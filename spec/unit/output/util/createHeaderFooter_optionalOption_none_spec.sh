# Setup required environment variable(s).
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "Output:" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				It "None" outputUtilCreateHeaderFooterOptionalOption:none outputUtilCreateHeaderFooterOptionalOptionNone
					When run createHeaderFooter
					The stdout should not be present
					The stderr should include "DESCRIPTION:"
					The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
				End
			End
		End
	End
End

