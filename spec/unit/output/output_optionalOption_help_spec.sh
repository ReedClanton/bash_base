Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Help:" outputOutputOptionalOption:help
			It "-h" outputOutputOptionalOptionHelp:h
				When call $output -h
				The stderr should not be present
				The stdout should include "DESCRIPTION:"
				The status should be success
			End
			It "--help" outputOutputOptionalOptionHelp:help
				When call $output --help
				The stderr should not be present
				The stdout should include "DESCRIPTION:"
				The status should be success
			End
		End
	End
End

