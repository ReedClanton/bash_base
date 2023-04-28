# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% WARN:2
readonly WARN
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$WARN

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
			Describe "Warn:" logLogOptionalOption:warn
				It "-w" logLogOptionalOptionWarn:w
					When run log -m=m -w
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN :	m"
					The status should be success
				End
				It "--warn" logLogOptionalOptionWarn:warn
					When run log -m=m --warn
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN :	m"
					The status should be success
				End
			End
		End
	End
End

