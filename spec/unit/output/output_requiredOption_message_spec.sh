Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Required option:" outputOutput:requiredOption
		Describe "Message:" outputOutputrequiredOption:message
			Describe "Input single line:" outputOutputrequiredOptionMessage:inputSingleLine
				Describe "-m:" outputOutputrequiredOptionMessageInputSingleLine:m
					It "Alphanumeric" outputOutputrequiredOptionMessageInputSingleLineM:alphanumeric
						When call $output -m="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3"
						The status should be success
					End
					It "Sentence" outputOutputrequiredOptionMessageInputSingleLineM:sentence
						When call $output -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputSingleLine:msg
					It "Alphanumeric" outputOutputrequiredOptionMessageInputSingleLineMsg:alphanumeric
						When call $output --msg="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3"
						The status should be success
					End
					It "Sentence" outputOutputrequiredOptionMessageInputSingleLineMsg:sentence
						When call $output --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input multiple lines, single message:" outputOutputrequiredOptionMessage:inputMultipleLinesSingleMessage
				Describe "-m:" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessage:m
					It "Sentence" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessageM:sentence
						When call $output -m="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessage:msg
					It "Sentence" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessageMsg:sentence
						When call $output --msg="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input multiple lines, multiple messages:" outputOutputrequiredOptionMessage:inputMultipleLinesMultipleMessages
				Describe "-m:" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesm
					It "One line per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesM:oneLinePerMessage
						When call $output -m="mes6sag3 mes6sag3" -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
					It "Multiple lines per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesM:multipleLinesPerMessage
						When call $output -m="mes6sag3\nmes6sag3" -m="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 4
						The stdout line 1 should equal "mes6sag3"
						The stdout line 2 should equal "mes6sag3"
						The stdout line 3 should equal "mes6sag3"
						The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessages:msg
					It "One line per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:oneLinePerMessage
						When call $output --msg="mes6sag3 mes6sag3" --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
					It "Multiple lines per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:multipleLinesPerMessage
						When call $output --msg="mes6sag3\nmes6sag3" --msg="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 4
						The stdout line 1 should equal "mes6sag3"
						The stdout line 2 should equal "mes6sag3"
						The stdout line 3 should equal "mes6sag3"
						The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input tabs:" outputOutputrequiredOptionMessage:inputTabs
				Describe "-m:" outputOutputrequiredOptionMessageInputTabs:m
					It "Sentence"
						When call $output -m="mes6sag3\t\tmes6sag3\t"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3		mes6sag3	"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputTabs:msg
					It "Sentence"
						When call $output --msg="\tmes6sag3\t\tmes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "	mes6sag3		mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input invalid:" outputOutputrequiredOptionMessage:inputInvalid
				Describe "-m:" outputOutputrequiredOptionMessageInputInvalid:m
					It "Blank" outputOutputrequiredOptionMessageInputInvalidM:blank
						When call $output -m=""
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputrequiredOptionMessageInputInvalidM:null
						When call $output -m=
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputrequiredOptionMessageInputInvalidM:missing
						When call $output -m
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputInvalid:msg
					It "Blank" outputOutputrequiredOptionMessageInputInvalidMsg:blank
						When call $output --msg=""
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputrequiredOptionMessageInputInvalidMsg:null
						When call $output --msg=
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputrequiredOptionMessageInputInvalidMsg:missing
						When call $output --msg
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
			End
		End
	End
End

