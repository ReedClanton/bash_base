# Setup required environment variable(s).
% OUTPUT_DOC:"#/ DESCRIPTION:"

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Help:" outputOutputOptionalOption:help
				It "-h" outputOutputOptionalOptionHelp:h
					When run output -h
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$OUTPUT_DOC"
					The status should be success
				End
				It "--help" outputOutputOptionalOptionHelp:help
					When run output --help
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$OUTPUT_DOC"
					The status should be success
				End
			End
		End
	End
End

