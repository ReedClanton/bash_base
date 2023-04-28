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
		verifyInputProvided() { :; }
		
		Describe "Option mix:" logLog:optionMix
			Describe "Caller and trace:" logLogOptionMix:callerAndTrace
				It "--caller and --trace:" logLogOptionMixCallerAndTrace:callerAndTrace
					When run log -m=m --caller="functionName()" --trace
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE functionName():	m"
					The status should be success
				End
				It "-c and --trace:" logLogOptionMixCallerAndTrace:cAndTrace
					When run log -m=m -c="functionName()" --trace
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE functionName():	m"
					The status should be success
				End
				It "--caller and -t:" logLogOptionMixCallerAndTrace:callerAndT
					When run log -m=m --caller="functionName()" -t
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE functionName():	m"
					The status should be success
				End
				It "-c and -t:" logLogOptionMixCallerAndTrace:cAndT
					When run log -m=m -c="functionName()" -t
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "TRACE functionName():	m"
					The status should be success
				End
			End
		End
	End
End

