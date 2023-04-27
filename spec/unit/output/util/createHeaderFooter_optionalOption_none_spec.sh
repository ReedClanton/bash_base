# Setup required environment variable(s).
% CREATE_HEADER_FOOTER_DOC:"#/ DESCRIPTION:"
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "Output:" output
	Describe "Util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				It "None" outputUtilCreateHeaderFooterOptionalOption:none outputUtilCreateHeaderFooterOptionalOptionNone
					When run createHeaderFooter
					The stdout should not be present
					The lines of stderr should equal 2
					The stderr line 1 should start with "ERROR createHeaderFooter():	"
					The stderr line 2 should equal "$CREATE_HEADER_FOOTER_DOC"
					The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
				End
			End
		End
	End
End

