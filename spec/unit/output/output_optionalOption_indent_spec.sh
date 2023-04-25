# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		outputPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $outputPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Indent:" outputOutputOptionalOption:indent
				Describe "Bound:" outputOutputOptionalOptionIndent:bound
					Describe "--indent:" outputOutputOptionalOptionIndentBound:indent
						It "Far bellow lower" outputOutputOptionalOptionIndentBoundIndent:farBellowLower
							When run output -m="m" --indent="-999999999"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Bellow lower" outputOutputOptionalOptionIndentBoundIndent:bellowLower
							When run output -m="m" --indent="-1"
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "At lower" outputOutputOptionalOptionIndentBoundIndent:atLower
							When run output -m="m" --indent=0
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "m"
							The status should be success
						End
						It "Above lower" outputOutputOptionalOptionIndentBoundIndent:aboveLower
							When run output -m="m" --indent=1
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal " m"
							The status should be success
						End
						Describe "Single character message:" outputOutputOptionalOptionIndentBoundIndent:singleCharacterMessage
							It "Far bellow upper" outputOutputOptionalOptionIndentBoundIndentSingleCharacterMessage:farBellowUpper
								When run output -m="m" --indent=7
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "       m"
								The status should be success
							End
							It "Bellow upper" outputOutputOptionalOptionIndentBoundIndentSingleCharacterMessage:bellowUpper
								When run output -m="m" --indent=8
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "        m"
								The status should be success
							End
							It "At upper" outputOutputOptionalOptionIndentBoundIndentSingleCharacterMessage:atUpper
								When run output -m="m" --indent=9
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "         m"
								The status should be success
							End
							It "Above upper" outputOutputOptionalOptionIndentBoundIndentSingleCharacterMessage:aboveUpper
								When run output -m="m" --indent=10
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Far above upper" outputOutputOptionalOptionIndentBoundIndentSingleCharacterMessage:farAboveUpper
								When run output -m="m" --indent=999
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "Multiple character message:" outputOutputOptionalOptionIndentBoundIndent:multipleCharacterMessage
							It "Far bellow upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:farBellowUpper
								When run output -m="msg" --indent=5
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "     msg"
								The status should be success
							End
							It "Further bellow upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:furtherBellowUpper
								When run output -m="msg" --indent=7
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "       msg"
								The status should be success
							End
							It "Bellow upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:bellowUpper
								When run output -m="msg" --indent=8
								The stderr should not be present
								The lines of stdout should equal 2
								The stdout line 1 should equal "        ms"
								The stdout line 2 should equal "        g"
								The status should be success
							End
							It "At upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:atUpper
								When run output -m="msg" --indent=9
								The stderr should not be present
								The lines of stdout should equal 3
								The stdout line 1 should equal "         m"
								The stdout line 2 should equal "         s"
								The stdout line 3 should equal "         g"
								The status should be success
							End
							It "Above upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:aboveUpper
								When run output -m="msg" --indent=10
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Far above upper" outputOutputOptionalOptionIndentBoundIndentMultipleCharacterMessage:farAboveUpper
								When run output -m="msg" --indent=999
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
				End
			End
		End
	End
End

