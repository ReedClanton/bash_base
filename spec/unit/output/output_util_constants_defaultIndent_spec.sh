# Setup required environment variable(s).
% OUTPUT_DOC:"#/ DESCRIPTION:"
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
				
		Describe "Default indent:" outputOutput:defaultIndent
			Describe "Bound:" outputOutputDefaultIndent:bound
				DEFAULT_INDENT=2
				
				It "Bellow upper" outputOutputDefaultIndentBound:bellowUpper
					When run output -m=msg1msg
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "  msg1msg"
					The status should be success
				End
				It "At upper" outputOutputDefaultIndentBound:atUpper
					When run output -m=msg1msg2
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "  msg1msg2"
					The status should be success
				End
				It "Above upper" outputOutputDefaultIndentBound:aboveUpper
					When run output -m=msg1msg2m
					The stderr should not be present
					The lines of stdout should equal 2
					The stdout line 1 should equal "  msg1msg2"
					The stdout line 2 should equal "  m"
					The status should be success
				End
				It "Far above upper" outputOutputDefaultIndentBound:farAboveUpper
					When run output -m=msg1msg2msg3msg4msg5msg6msg7msg8
					The stderr should not be present
					The lines of stdout should equal 4
					The stdout line 1 should equal "  msg1msg2"
					The stdout line 2 should equal "  msg3msg4"
					The stdout line 3 should equal "  msg5msg6"
					The stdout line 4 should equal "  msg7msg8"
					The status should be success
				End
			End
			Describe "Almost longer than allowed line length:" outputOutputDefaultIndent:almostLongerThanAllowedLineLength
				DEFAULT_INDENT=9
				
				It "No prefix" outputOutputDefaultIndentAlmostLongerThanAllowedLineLength:noPrefix
					When run output -m=m
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "         m"
					The status should be success
				End
				It "With prefix" outputOutputDefaultIndentAlmostLongerThanAllowedLineLength:withPrefix
					When run output -m=m --pp
					The stdout should not be present
					The stderr line 1 should start with "ERROR output(): "
					The stderr should include "$OUTPUT_DOC"
					The status should equal $ENV_VAR_BAD_VALUE_RT
				End
			End
			Describe "Longer than allowed line length:" outputOutputDefaultIndent:longerThanAllowedLineLength
				DEFAULT_INDENT=10
				
				It "No prefix" outputOutputDefaultIndentLongerThanAllowedLineLength:noPrefix
					When run output -m=m
					The stdout should not be present
					The stderr line 1 should start with "ERROR output(): "
					The stderr should include "$OUTPUT_DOC"
					The status should equal $ENV_VAR_BAD_VALUE_RT
				End
				It "With prefix" outputOutputDefaultIndentLongerThanAllowedLineLength:withPrefix
					When run output -m=m --pp
					The stdout should not be present
					The stderr line 1 should start with "ERROR output(): "
					The stderr should include "$OUTPUT_DOC"
					The status should equal $ENV_VAR_BAD_VALUE_RT
				End
			End
		End
	End
End

