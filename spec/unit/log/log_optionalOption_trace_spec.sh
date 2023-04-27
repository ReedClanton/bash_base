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
		
		Describe "Optional option:" logLog:optionalOption
			Describe "Trace:" logLogOptionalOption:trace
				It "None" logLogOptionalOptionTrace:none
					When run log -m=m
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	m"
					The status should be success
				End
				It "-t" logLogOptionalOptionTrace:t
					When run log -m=m -t
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	m"
					The status should be success
				End
				It "--trace" logLogOptionalOptionTrace:trace
					When run log -m=m --trace
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE:	m"
					The status should be success
				End
			End
		End
	End
End

