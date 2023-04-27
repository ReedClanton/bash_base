# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "--indent:" outputOutputOptionalOption:indent
				Describe "Bound:" outputOutputOptionalOptionIndent:bound
					It "Far bellow lower" outputOutputOptionalOptionIndentBound:farBellowLower
						When run output -m="m" --indent="-999999999"
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Bellow lower" outputOutputOptionalOptionIndentBound:bellowLower
						When run output -m="m" --indent="-1"
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "At lower" outputOutputOptionalOptionIndentBound:atLower
						When run output -m="m" --indent=0
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "m"
						The status should be success
					End
					It "Above lower" outputOutputOptionalOptionIndentBound:aboveLower
						When run output -m="m" --indent=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " m"
						The status should be success
					End
					Describe "Single character message:" outputOutputOptionalOptionIndentBound:singleCharacterMessage
						It "Far bellow upper" outputOutputOptionalOptionIndentBoundSingleCharacterMessage:farBellowUpper
							When run output -m="m" --indent=7
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "       m"
							The status should be success
						End
						It "Bellow upper" outputOutputOptionalOptionIndentBoundSingleCharacterMessage:bellowUpper
							When run output -m="m" --indent=8
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "        m"
							The status should be success
						End
						It "At upper" outputOutputOptionalOptionIndentBoundSingleCharacterMessage:atUpper
							When run output -m="m" --indent=9
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "         m"
							The status should be success
						End
						It "Above upper" outputOutputOptionalOptionIndentBoundSingleCharacterMessage:aboveUpper
							When run output -m="m" --indent=10
							The stdout should not be present
							The stderr should start with "ERROR output():	"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Far above upper" outputOutputOptionalOptionIndentBoundSingleCharacterMessage:farAboveUpper
							When run output -m="m" --indent=999
							The stdout should not be present
							The stderr should start with "ERROR output():	"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "Multiple character message:" outputOutputOptionalOptionIndentBound:multipleCharacterMessage
						It "Far bellow upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:farBellowUpper
							When run output -m="msg" --indent=5
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "     msg"
							The status should be success
						End
						It "Further bellow upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:furtherBellowUpper
							When run output -m="msg" --indent=7
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "       msg"
							The status should be success
						End
						It "Bellow upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:bellowUpper
							When run output -m="msg" --indent=8
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "        ms"
							The stdout line 2 should equal "        g"
							The status should be success
						End
						It "At upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:atUpper
							When run output -m="msg" --indent=9
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "         m"
							The stdout line 2 should equal "         s"
							The stdout line 3 should equal "         g"
							The status should be success
						End
						It "Above upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:aboveUpper
							When run output -m="msg" --indent=10
							The stdout should not be present
							The stderr should start with "ERROR output():	"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Far above upper" outputOutputOptionalOptionIndentBoundMultipleCharacterMessage:farAboveUpper
							When run output -m="msg" --indent=999
							The stdout should not be present
							The stderr should start with "ERROR output():	"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
				End
			End
		End
	End
End

