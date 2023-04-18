# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Mock out sourcing of util (constants, globals, helper functions, etc).
	inScriptSource() { return 0; }
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# createHeaderFooter() shouldn't be called, but mock it out just in case.
	createHeaderFooter() { return $CATCHALL_RT; }
	
	Describe "Required option:" outputOutput:requiredOption
		Describe "Message:" outputOutputrequiredOption:message
			Describe "Input single line:" outputOutputrequiredOptionMessage:inputSingleLine
				Describe "-m:" outputOutputrequiredOptionMessageInputSingleLine:m
					It "Alphanumeric" outputOutputrequiredOptionMessageInputSingleLineM:alphanumeric
						When run source $output -m="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3"
						The status should be success
					End
					It "Sentence" outputOutputrequiredOptionMessageInputSingleLineM:sentence
						When run source $output -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputSingleLine:msg
					It "Alphanumeric" outputOutputrequiredOptionMessageInputSingleLineMsg:alphanumeric
						When run source $output --msg="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3"
						The status should be success
					End
					It "Sentence" outputOutputrequiredOptionMessageInputSingleLineMsg:sentence
						When run source $output --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input multiple lines, single message:" outputOutputrequiredOptionMessage:inputMultipleLinesSingleMessage
				Describe "-m:" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessage:m
					It "Sentence" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessageM:sentence
						When run source $output -m="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessage:msg
					It "Sentence" outputOutputrequiredOptionMessageInputMultipleLinesSingleMessageMsg:sentence
						When run source $output --msg="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
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
						When run source $output -m="mes6sag3 mes6sag3" -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
					It "Multiple lines per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesM:multipleLinesPerMessage
						When run source $output -m="mes6sag3\nmes6sag3" -m="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
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
						When run source $output --msg="mes6sag3 mes6sag3" --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
					It "Multiple lines per message" outputOutputrequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:multipleLinesPerMessage
						When run source $output --msg="mes6sag3\nmes6sag3" --msg="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
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
						When run source $output -m="mes6sag3\t\tmes6sag3\t"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3		mes6sag3	"
						The status should be success
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputTabs:msg
					It "Sentence"
						When run source $output --msg="\tmes6sag3\t\tmes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "	mes6sag3		mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input invalid:" outputOutputrequiredOptionMessage:inputInvalid
				It "None" outputOutputrequiredOptionMessageInputInvalid:none
					When run source $output
					The stdout should not be present
					The stderr should include "ERROR"
					The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
				End
				Describe "-m:" outputOutputrequiredOptionMessageInputInvalid:m
					It "Blank" outputOutputrequiredOptionMessageInputInvalidM:blank
						When run source $output -m=""
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputrequiredOptionMessageInputInvalidM:null
						When run source $output -m=
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputrequiredOptionMessageInputInvalidM:missing
						When run source $output -m
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
				Describe "--msg:" outputOutputrequiredOptionMessageInputInvalid:msg
					It "Blank" outputOutputrequiredOptionMessageInputInvalidMsg:blank
						When run source $output --msg=""
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputrequiredOptionMessageInputInvalidMsg:null
						When run source $output --msg=
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputrequiredOptionMessageInputInvalidMsg:missing
						When run source $output --msg
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
			End
		End
	End
End

