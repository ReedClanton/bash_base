Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Mock out 'cat' so it returns stdin.
			cat() { input=""; read input; echo $input; }
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Help:" outputUtilCreateHeaderFooterOptionalOption:help
					It "-h" outputUtilCreateHeaderFooterOptionalOptionHelp:h
						When run createHeaderFooter -h
						The stderr should not be present
						The stdout should include "DESCRIPTION:"
						The status should be success
					End
					It "--help" outputUtilCreateHeaderFooterOptionalOptionHelp:help
						When run createHeaderFooter --help
						The stderr should not be present
						The stdout should include "DESCRIPTION:"
						The status should be success
					End
				End
			End
		End
	End
End

