# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
				
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Line length:" outputOutputOptionalOption:lineLength
				Describe "Input special character:" outputOutputOptionalOptionLineLength:inputSpecialCharacter
					Describe "-l:" outputOutputOptionalOptionLineLengthInputSpecialCharacter:l
						It "Space before" outputOutputOptionalOptionLineLengthInputSpecialCharacterL:spaceBefore
							When run output -m=msg1msg2 -l="          8"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "msg1msg2"
							The status should be success
						End
						It "Space before and after" outputOutputOptionalOptionLineLengthInputSpecialCharacterL:spaceBeforeAndAfter
							When run output -m=msg1msg2 -l="          7              "
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "msg1msg"
							The stdout line 2 should equal "2"
							The status should be success
						End
						It "Space after" outputOutputOptionalOptionLineLengthInputSpecialCharacterL:spaceAfter
							When run output -m=msg1msg2 -l="9              "
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "msg1msg2"
							The status should be success
						End
					End
					Describe "--line-length:" outputOutputOptionalOptionLineLengthInputSpecialCharacter:lineLength
						It "Space before" outputOutputOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceBefore
							When run output -m=msg1msg2 --line-length="          4"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "msg1"
							The stdout line 2 should equal "msg2"
							The status should be success
						End
						It "Space before and after" outputOutputOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceBeforeAndAfter
							When run output -m=msg1msg2 --line-length="          1              "
							The stderr should not be present
							The lines of stdout should equal 8
							The stdout line 1 should equal "m"
							The stdout line 2 should equal "s"
							The stdout line 3 should equal "g"
							The stdout line 4 should equal "1"
							The stdout line 5 should equal "m"
							The stdout line 6 should equal "s"
							The stdout line 7 should equal "g"
							The stdout line 8 should equal "2"
							The status should be success
						End
						It "Space after" outputOutputOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceAfter
							When run output -m=msg1msg2 --line-length="2              "
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal "ms"
							The stdout line 2 should equal "g1"
							The stdout line 3 should equal "ms"
							The stdout line 4 should equal "g2"
							The status should be success
						End
					End
				End
				Describe "Bound:" outputOutputOptionalOptionLineLength:bound
					Describe "-l:" outputOutputOptionalOptionLineLengthBound:l
						It "Far bellow lower" outputOutputOptionalOptionLineLengthBoundL:farBellowLower
							When run output -m=m -l="-999999999"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Bellow lower" outputOutputOptionalOptionLineLengthBoundL:bellowLower
							When run output -m=m -l="-1"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "At lower" outputOutputOptionalOptionLineLengthBoundL:atLower
							When run output -m=m -l=0
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Above lower" outputOutputOptionalOptionLineLengthBoundL:aboveLower
							When run output -m=msg1msg2 -l=1
							The stderr should not be present
							The lines of stdout should equal 8
							The stdout line 1 should equal "m"
							The stdout line 2 should equal "s"
							The stdout line 3 should equal "g"
							The stdout line 4 should equal "1"
							The stdout line 5 should equal "m"
							The stdout line 6 should equal "s"
							The stdout line 7 should equal "g"
							The stdout line 8 should equal "2"
							The status should be success
						End
						It "Far above lower" outputOutputOptionalOptionLineLengthBoundL:farAboveLower
							When run output -m="test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test " -l=1000
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test "
							The status should be success
						End
					End
					Describe "--line-length:" outputOutputOptionalOptionLineLengthBound:lineLength
						It "Far bellow lower" outputOutputOptionalOptionLineLengthBoundLineLength:farBellowLower
							When run output -m=m --line-length="-999999999"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Bellow lower" outputOutputOptionalOptionLineLengthBoundLineLength:bellowLower
							When run output -m=m --line-length="-1"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "At lower" outputOutputOptionalOptionLineLengthBoundLineLength:atLower
							When run output -m=m --line-length=0
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Above lower" outputOutputOptionalOptionLineLengthBoundLineLength:aboveLower
							When run output -m=msg1msg2msg3msg4msg5msg6msg7msg8 --line-length=1
							The lines of stdout should equal 32
							The stdout line 1 should equal "m"
							The stdout line 2 should equal "s"
							The stdout line 3 should equal "g"
							The stdout line 4 should equal "1"
							The stdout line 5 should equal "m"
							The stdout line 6 should equal "s"
							The stdout line 7 should equal "g"
							The stdout line 8 should equal "2"
							The stdout line 9 should equal "m"
							The stdout line 10 should equal "s"
							The stdout line 11 should equal "g"
							The stdout line 12 should equal "3"
							The stdout line 13 should equal "m"
							The stdout line 14 should equal "s"
							The stdout line 15 should equal "g"
							The stdout line 16 should equal "4"
							The stdout line 17 should equal "m"
							The stdout line 18 should equal "s"
							The stdout line 19 should equal "g"
							The stdout line 20 should equal "5"
							The stdout line 21 should equal "m"
							The stdout line 22 should equal "s"
							The stdout line 23 should equal "g"
							The stdout line 24 should equal "6"
							The stdout line 25 should equal "m"
							The stdout line 26 should equal "s"
							The stdout line 27 should equal "g"
							The stdout line 28 should equal "7"
							The stdout line 29 should equal "m"
							The stdout line 30 should equal "s"
							The stdout line 31 should equal "g"
							The stdout line 32 should equal "8"
						End
						It "Far above lower" outputOutputOptionalOptionLineLengthBoundLineLength:farAboveLower
							When run output -m="test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test t" --line-length=10000
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test "
							The stdout line 2 should equal "t"
							The status should be success
						End
					End
				End
			End
		End
	End
End

