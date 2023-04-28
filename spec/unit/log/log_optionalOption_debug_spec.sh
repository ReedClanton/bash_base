# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% DEBUG:4
readonly DEBUG
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$DEBUG

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
			Describe "Debug:" logLogOptionalOption:debug
				It "-d" logLogOptionalOptionDebug:d
					When run log -m=m -d
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG:	m"
					The status should be success
				End
				It "--debug" logLogOptionalOptionDebug:debug
					When run log -m=m --debug
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG:	m"
					The status should be success
				End
			End
		End
	End
End

