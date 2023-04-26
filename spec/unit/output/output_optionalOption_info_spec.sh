# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT
% INFO_CHAR:'#'
readonly INFO_CHAR

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		outputPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $outputPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Info:" outputOutputOptionalOption:info
				It "-i" outputOutputOptionalOptionInfo:i
					When run output -m=m --pp -i
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
				It "--info" outputOutputOptionalOptionInfo:info
					When run output -m=m --pp --info
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
			End
		End
	End
End

