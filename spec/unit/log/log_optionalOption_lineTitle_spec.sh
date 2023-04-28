# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% FULL_TITLE:1
readonly FULL_TITLE
% LINE_TITLE:2
readonly LINE_TITLE
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
		verifyInputProvided() { :; }
		
		Describe "Optional option:" logLog:optionalOption
			Describe "--line-title:" logLogOptionalOption:lineTitle
				It "Single character formatting character" logLogOptionalOptionLineTitle:singleCharacterFormattingCharacter
					TRACE_CHAR='#'
					output() { echo "$TRACE_CHAR m $TRACE_CHAR"; }
					When run log -m=m --line-title
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	$TRACE_CHAR m $TRACE_CHAR"
					The status should be success
				End
				It "Two character formatting character" logLogOptionalOptionLineTitle:twoCharacterFormattingCharacter
					TRACE_CHAR='&!'
					output() { echo "$TRACE_CHAR m $TRACE_CHAR"; }
					When run log -m=m --line-title
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	$TRACE_CHAR m $TRACE_CHAR"
					The status should be success
				End
				It "Many character formatting character" logLogOptionalOptionLineTitle:manyCharacterFormattingCharacter
					TRACE_CHAR='!#*@'
					output() { echo "$TRACE_CHAR m $TRACE_CHAR"; }
					When run log -m=m --line-title
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	$TRACE_CHAR m $TRACE_CHAR"
					The status should be success
				End
				It "Many character formatting character, message broken up" logLogOptionalOptionLineTitle:manyCharacterFormattingCharacterMessageBrokenUp
					TRACE_CHAR='!#*@'
					output() { echo "$TRACE_CHAR msg1 $TRACE_CHAR"; echo "$TRACE_CHAR msg2 $TRACE_CHAR"; }
					When run log -m=msg1 --msg=msg2 --line-title
					The stderr should not be present
					The lines of stdout should equal 2
					The stdout line 1 should equal "TRACE:	$TRACE_CHAR msg1 $TRACE_CHAR"
					The stdout line 2 should equal "$TRACE_CHAR msg2 $TRACE_CHAR"
					The status should be success
				End
			End
		End
	End
End

