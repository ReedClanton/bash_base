# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT
% INFO_CHAR:'#'
readonly INFO_CHAR

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Info:" outputOutputOptionalOption:info
			It "-i" outputOutputOptionalOptionInfo:i
				When run source $output -m=m --pp -i
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "# m #"
				The status should be success
			End
			It "--info" outputOutputOptionalOptionInfo:info
				When run source $output -m=m --pp --info
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "# m #"
				The status should be success
			End
		End
	End
End

