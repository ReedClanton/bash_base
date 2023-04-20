# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT
% WARN_CHAR:'*'
readonly WARN_CHAR

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Warn:" outputOutputOptionalOption:warn
			It "-w" outputOutputOptionalOptionWarn:w
				When run source $output -m=m --pp -w
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "* m *"
				The status should be success
			End
			It "--warn" outputOutputOptionalOptionWarn:warn
				When run source $output -m=m --pp --warn
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "* m *"
				The status should be success
			End
		End
	End
End

