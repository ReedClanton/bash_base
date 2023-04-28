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
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

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
			Describe "--full-title:" logLogOptionalOption:fullTitle
				It "Single message line" logLogOptionalOptionFullTitleSingleCharacterFormattingCharacter:singleMessageLine
					output() {
						echo " $DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR"
						echo "$DEFAULT_CHAR m $DEFAULT_CHAR"
						echo " $DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR"
					}
					When run log -m=m --full-title
					The stderr should not be present
					The lines of stdout should equal 4
					The stdout line 1 should equal "TRACE:	"
					The stdout line 2 should equal " ###"
					The stdout line 3 should equal "# m #"
					The stdout line 4 should equal " ###"
					The status should be success
				End
				It "Multiline message" logLogOptionalOptionFullTitleSingleCharacterFormattingCharacter:multilineMessage
					output() {
						echo " $DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR"
						echo "$DEFAULT_CHAR ms   $DEFAULT_CHAR"
						echo "$DEFAULT_CHAR msg2 $DEFAULT_CHAR"
						echo " $DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR$DEFAULT_CHAR"
					}
					When run log -m=ms -m=msg2 --full-title
					The stderr should not be present
					The lines of stdout should equal 5
					The stdout line 1 should equal "TRACE:	"
					The stdout line 2 should equal " ######"
					The stdout line 3 should equal "# ms   #"
					The stdout line 4 should equal "# msg2 #"
					The stdout line 5 should equal " ######"
					The status should be success
				End
			End
		End
	End
End

