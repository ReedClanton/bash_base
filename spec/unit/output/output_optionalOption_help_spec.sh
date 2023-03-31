Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Optional option(s):" output:optionalOptions outputOptionalOptions optionalOptions
		Describe "Help:" outputOptionalOptions:help optionalOptions:help
			It "-h" outputOptionalOptions:"-h" help:"-h" outputOptions:"-h" option:"-h"
				When call $output -h
				The stderr should not be present
				The stdout should include "DESCRIPTION:"
				The status should be success
			End
			It "--help" outputOptionalOptions:"--help" help:"--help" outputOptions:"--help" option:"--help"
				When call $output --help
				The stderr should not be present
				The stdout should include "DESCRIPTION:"
				The status should be success
			End
		End
	End
End

