Describe "output():" output
	# Mock out sourcing of constants file.
	inScriptSource() { return 0; }
	
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Help:" outputUtilCreateHeaderFooterOptionalOption:help
					It "-h" outputUtilCreateHeaderFooterOptionalOptionHelp:h
						When run source $createHeaderFooter -h
						The stderr should not be present
						The stdout should include "DESCRIPTION:"
						The status should be success
					End
					It "--help" outputUtilCreateHeaderFooterOptionalOptionHelp:help
						When run source $createHeaderFooter --help
						The stderr should not be present
						The stdout should include "DESCRIPTION:"
						The status should be success
					End
				End
			End
		End
	End
End

