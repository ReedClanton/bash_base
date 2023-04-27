# Setup required environment variable(s).
% LOG_DOC:"#/ DESCRIPTION:"

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		# Mock out output().
		output() { :; }
		
		Describe "Required option:" logLog:requiredOption
			Describe "Message:" logLogRequiredOption:message
				Describe "Input invalid:" logLogRequiredOptionMessage:inputInvalid
					It "None" logLogRequiredOptionMessageInputInvalid:none
						checkRequiredOpts() {
							printf "# Missing required argument(s), see doc bellow... #\n" >&2
							echo "$LOG_DOC" >&2
							return 3
						}
						When run log
						The stdout should not be present
						The stderr line 1 should include "ERROR log():	"
						The stderr line 2 should include "$LOG_DOC"
						The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
					End
					Describe "-m:" logLogRequiredOptionMessageInputInvalid:m
						It "Missing" logLogRequiredOptionMessageInputInvalidM:missing
							When run log -m
							The stdout should not be present
							The stderr line 1 should include "ERROR log():	"
							The stderr line 2 should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--msg:" logLogRequiredOptionMessageInputInvalid:msg
						It "Missing" logLogRequiredOptionMessageInputInvalidMsg:missing
							When run log --msg
							The stdout should not be present
							The stderr line 1 should include "ERROR log():	"
							The stderr line 2 should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
			End
		End
	End
End

