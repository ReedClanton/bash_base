# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# createHeaderFooter() shouldn't be called, but mock it out just in case.
	createHeaderFooter() { return $CATCHALL_RT; }
			
	Describe "Default indent:" outputOutput:defaultIndent
		Describe "Bound:" outputOutputDefaultIndent:bound
			# Ensure default indent is used when --indent isn't passed in.
			DEFAULT_INDENT=2
			
			It "Bellow upper" outputOutputDefaultIndentBound:bellowUpper
				When run source $output -m=msg1msg
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "  msg1msg"
				The status should be success
			End
			It "At upper" outputOutputDefaultIndentBound:atUpper
				When run source $output -m=msg1msg2
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "  msg1msg2"
				The status should be success
			End
			It "Above upper" outputOutputDefaultIndentBound:aboveUpper
				When run source $output -m=msg1msg2m
				The stderr should not be present
				The lines of stdout should equal 2
				The stdout line 1 should equal "  msg1msg2"
				The stdout line 2 should equal "  m"
				The status should be success
			End
			It "Far above upper" outputOutputDefaultIndentBound:farAboveUpper
				When run source $output -m=msg1msg2msg3msg4msg5msg6msg7msg8
				The stderr should not be present
				The lines of stdout should equal 4
				The stdout line 1 should equal "  msg1msg2"
				The stdout line 2 should equal "  msg3msg4"
				The stdout line 3 should equal "  msg5msg6"
				The stdout line 4 should equal "  msg7msg8"
				The status should be success
			End
		End
		Describe "Longer than allowed line length:" outputOutputDefaultIndent:longerThanAllowedLineLength
			DEFAULT_INDENT=10
			
			It "No prefix" outputOutputDefaultIndentLongerThanAllowedLineLength:noPrefix
				When run source $output -m=m
				The stdout should not be present
				The stderr should include "ERROR"
				The status should equal $OPTION_VALUE_INVALID_RT
			End
			It "With prefix" outputOutputDefaultIndentLongerThanAllowedLineLength:withPrefix
				When run source $output -m=m --pp
				The stdout should not be present
				The stderr should include "ERROR"
				The status should equal $OPTION_VALUE_INVALID_RT
			End
		End
	End
End

