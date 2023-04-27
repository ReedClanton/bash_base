# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$TRACE

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		# Mock out.
		checkRequiredOpts() { :; }
		
		Describe "Required option:" logLog:requiredOption
			Describe "Message:" logLogRequiredOption:message
				Describe "Input single line:" logLogRequiredOptionMessage:inputSingleLine
					Describe "-m:" logLogRequiredOptionMessageInputSingleLine:m
						It "Alphanumeric" logLogRequiredOptionMessageInputSingleLineM:alphanumeric
							When run log -m="mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	mes6sag3"
							The status should be success
						End
						It "Sentence" logLogRequiredOptionMessageInputSingleLineM:sentence
							When run log -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputSingleLineM:blank
							When run log -m=""
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	"
							The status should be success
							
						End
						It "Null" logLogRequiredOptionMessageInputSingleLineM:null
							When run log -m=
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	"
							The status should be success
						End
					End
					Describe "--msg:" logLogRequiredOptionMessageInputSingleLine:msg
						It "Alphanumeric" logLogRequiredOptionMessageInputSingleLineMsg:alphanumeric
							When run log --msg="mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	mes6sag3"
							The status should be success
						End
						It "Sentence" logLogRequiredOptionMessageInputSingleLineMsg:sentence
							When run log --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputSingleLineMsg:blank
							When run log --msg=""
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	"
							The status should be success
						End
						It "Null" logLogRequiredOptionMessageInputSingleLineMsg:null
							When run log --msg=
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	"
							The status should be success
						End
					End
				End
				Describe "Input multiple lines, single message:" logLogRequiredOptionMessage:inputMultipleLinesSingleMessage
					Describe "-m:" logLogRequiredOptionMessageInputMultipleLinesSingleMessage:m
						It "Sentence" logLogRequiredOptionMessageInputMultipleLinesSingleMessageM:sentence
							When run log -m="mes6sag1 mes6sag1 mes6sag1\nmes6sag2 mes6sag2 mes6sag2"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "TRACE:	mes6sag1 mes6sag1 mes6sag1"
							The stdout line 2 should equal "mes6sag2 mes6sag2 mes6sag2"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputMultipleLinesSingleMessageM:blank
							When run log -m="\n\n\n"
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 4
						End
					End
					Describe "--msg:" logLogRequiredOptionMessageInputMultipleLinesSingleMessage:msg
						It "Sentence" logLogRequiredOptionMessageInputMultipleLinesSingleMessageMsg:sentence
							When run log --msg="mes6sag1 mes6sag1 mes6sag1\nmes6sag2 mes6sag2 mes6sag2"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "TRACE:	mes6sag1 mes6sag1 mes6sag1"
							The stdout line 2 should equal "mes6sag2 mes6sag2 mes6sag2"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputMultipleLinesSingleMessageMsg:blank
							When run log --msg="\n\n\n\n"
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
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
				Describe "Input multiple lines, multiple messages:" logLogRequiredOptionMessage:inputMultipleLinesMultipleMessages
					Describe "-m:" logLogRequiredOptionMessageInputMultipleLinesMultipleMessages:m
						It "One line per message" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesM:oneLinePerMessage
							When run log -m="mes6sag3 mes6sag3" -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "TRACE:	mes6sag3 mes6sag3"
							The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Multiple lines per message" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesM:multipleLinesPerMessage
							When run log -m="mes6sag3\nmes6sag3" -m="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal "TRACE:	mes6sag3"
							The stdout line 2 should equal "mes6sag3"
							The stdout line 3 should equal "mes6sag3"
							The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesM:blank
							When run log -m="\n\n" -m="\n\n\n\n\n"
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
							The stdout line 2 should be blank
							The stdout line 3 should be blank
							The stdout line 4 should be blank
							The stdout line 5 should be blank
							The stdout line 6 should be blank
							The status should be success
							Skip "until I figure out how to get shellspec to see blank lines (CUT works, test doesn't)."
							The lines of stdout should equal 6
						End
						It "Null" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesM:null
							When run log -m= -m= -m= -m= -m= -m= -m=
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
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
					Describe "--msg:" logLogRequiredOptionMessageInputMultipleLinesMultipleMessages:msg
						It "One line per message" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:oneLinePerMessage
							When run log --msg="mes6sag3 mes6sag3" --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 2
							The stdout line 1 should equal "TRACE:	mes6sag3 mes6sag3"
							The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Multiple lines per message" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:multipleLinesPerMessage
							When run log --msg="mes6sag3\nmes6sag3" --msg="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal "TRACE:	mes6sag3"
							The stdout line 2 should equal "mes6sag3"
							The stdout line 3 should equal "mes6sag3"
							The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
							The status should be success
						End
						It "Blank" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:blank
							When run log --msg="\n\n" --msg="\n\n\n" --msg=""
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
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
						It "Null" logLogRequiredOptionMessageInputMultipleLinesMultipleMessagesMsg:null
							When run log --msg= --msg= --msg= --msg= --msg= --msg= --msg= --msg= --msg=
							The stderr should not be present
							The stdout line 1 should equal "TRACE:	"
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
				Describe "Input tabs:" logLogRequiredOptionMessage:inputTabs
					Describe "-m:" logLogRequiredOptionMessageInputTabs:m
						It "Sentence" logLogRequiredOptionMessageInputTabsM:sentence
							When run log -m="mes6sag3\t\tmes6sag3\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	mes6sag3		mes6sag3	"
							The status should be success
						End
						It "Tab" logLogRequiredOptionMessageInputTabsM:tab
							When run log -m="\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:		"
							The status should be success
						End
					End
					Describe "--msg:" logLogRequiredOptionMessageInputTabs:msg
						It "Sentence" logLogRequiredOptionMessageInputTabsMsg:sentence
							When run log --msg="\tmes6sag3\t\tmes6sag3"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:		mes6sag3		mes6sag3"
							The status should be success
						End
						It "Tab" logLogRequiredOptionMessageInputTabsMsg:tab
							When run log --msg="\t\t\t"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:				"
							The status should be success
						End
					End
				End
			End
		End
	End
End

