# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				It "None" outputUtilCreateHeaderFooterOptionalOption:none outputUtilCreateHeaderFooterOptionalOptionNone
					When run createHeaderFooter
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "\n"
					The status should be success
				End
			End
		End
	End
End

