# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:60
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
		
		Describe "Required option:" outputOutput:requiredOption
			Describe "Message:" outputOutputRequiredOption:message
				Describe "Input single line:" outputOutputRequiredOptionMessage:inputSingleLine
					Describe "-m:" outputOutputRequiredOptionMessageInputSingleLine:m
						It "Alphanumeric" outputOutputRequiredOptionMessageInputSingleLineM:alphanumeric
							When run output -m="mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "mes6sag3"
							The status should be success
						End
						It "Sentence" outputOutputRequiredOptionMessageInputSingleLineM:sentence
							When run output -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputSingleLineM:blank
							When run output -m=""
							The stderr should not be present
							The stdout line 1 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 1
						End
						It "Null" outputOutputRequiredOptionMessageInputSingleLineM:null
							When run output -m=
							The stderr should not be present
							The stdout line 1 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 1
						End
					End
					Describe "--msg:" outputOutputRequiredOptionMessageInputSingleLine:msg
						It "Alphanumeric" outputOutputRequiredOptionMessageInputSingleLineMsg:alphanumeric
							When run output --msg="mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "mes6sag3"
							The status should be success
						End
						It "Sentence" outputOutputRequiredOptionMessageInputSingleLineMsg:sentence
							When run output --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputSingleLineMsg:blank
							When run output --msg=""
							The stderr should not be present
							The stdout line 1 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 1
						End
						It "Null" outputOutputRequiredOptionMessageInputSingleLineMsg:null
							When run output --msg=
							The stderr should not be present
							The stdout line 1 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 1
						End
					End
				End
				Describe "Input multiple lines, single message:" outputOutputRequiredOptionMessage:inputMultipleLinesSingleMessage
					Describe "-m:" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessage:m
						It "Sentence" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessageM:sentence
							When run output -m="mes6sag1 mes6sag1 mes6sag1\nmes6sag2 mes6sag2 mes6sag2"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "mes6sag1 mes6sag1 mes6sag1"
							The stdout line 2 should equal "mes6sag2 mes6sag2 mes6sag2"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessageM:blank
							When run output -m="\n\n\n"
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 4
						End
					End
					Describe "--msg:" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessage:msg
						It "Sentence" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessageMsg:sentence
							When run output --msg="mes6sag1 mes6sag1 mes6sag1\nmes6sag2 mes6sag2 mes6sag2"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "mes6sag1 mes6sag1 mes6sag1"
							The stdout line 2 should equal "mes6sag2 mes6sag2 mes6sag2"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputMultipleLinesSingleMessageMsg:blank
							When run output --msg="\n\n\n\n"
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 5
						End
					End
				End
				Describe "Input multiple lines, multiple messages:" outputOutputRequiredOptionMessage:inputMultipleLinesMultipleMessages
					Describe "-m:" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessages:m
						It "One line per message" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesM:oneLinePerMessage
							When run output -m="mes6sag3 mes6sag3" -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "mes6sag3 mes6sag3"
							The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Multiple lines per message" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesM:multipleLinesPerMessage
							When run output -m="mes6sag3\nmes6sag3" -m="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal "mes6sag3"
							The stdout line 2 should equal "mes6sag3"
							The stdout line 3 should equal "mes6sag3"
							The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesM:blank
							When run output -m="\n\n" -m="\n\n\n\n\n"
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The stdout line 6 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 6
						End
						It "Null" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesM:null
							When run output -m= -m= -m= -m= -m= -m= -m=
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The stdout line 6 should be blank
							The stdout line 7 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 7
						End
					End
					Describe "--msg:" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessages:msg
						It "One line per message" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:oneLinePerMessage
							When run output --msg="mes6sag3 mes6sag3" --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "mes6sag3 mes6sag3"
							The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Multiple lines per message" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:multipleLinesPerMessage
							When run output --msg="mes6sag3\nmes6sag3" --msg="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal "mes6sag3"
							The stdout line 2 should equal "mes6sag3"
							The stdout line 3 should equal "mes6sag3"
							The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:blank
							When run output --msg="\n\n" --msg="\n\n\n" --msg=""
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The stdout line 6 should be blank
							The stdout line 7 should be blank
							The stdout line 8 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 8
						End
						It "Null" outputOutputRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:null
							When run output --msg= --msg= --msg= --msg= --msg= --msg= --msg= --msg= --msg=
							The stderr should not be present
							The stdout line 1 should be blank
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The stdout line 6 should be blank
							The stdout line 7 should be blank
							The stdout line 8 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 9
						End
					End
				End
				Describe "Input tabs:" outputOutputRequiredOptionMessage:inputTabs
					Describe "-m:" outputOutputRequiredOptionMessageInputTabs:m
						It "Sentence" outputOutputRequiredOptionMessageInputTabsM:sentence
							When run output -m="mes6sag3\t\tmes6sag3\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "mes6sag3		mes6sag3	"
							The status should be success
						End
						It "Tab" outputOutputRequiredOptionMessageInputTabsM:tab
							When run output -m="\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "	"
							The status should be success
						End
					End
					Describe "--msg:" outputOutputRequiredOptionMessageInputTabs:msg
						It "Sentence" outputOutputRequiredOptionMessageInputTabsMsg:sentence
							When run output --msg="\tmes6sag3\t\tmes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "	mes6sag3		mes6sag3"
							The status should be success
						End
						It "Tab" outputOutputRequiredOptionMessageInputTabsMsg:tab
							When run output --msg="\t\t\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "			"
							The status should be success
						End
					End
				End
			End
		End
	End
End

