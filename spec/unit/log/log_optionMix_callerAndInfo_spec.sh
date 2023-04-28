# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% INFO:3
readonly INFO
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$INFO

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
			Describe "Caller and info:" logLogOptionMix:callerAndInfo
				It "--caller and --info:" logLogOptionMixCallerAndInfo:callerAndInfo
					When run log -m=m --caller="functionName()" --info
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO  functionName():	m"
					The status should be success
				End
				It "-c and --info:" logLogOptionMixCallerAndInfo:cAndInfo
					When run log -m=m -c="functionName()" --info
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO  functionName():	m"
					The status should be success
				End
				It "--caller and -i:" logLogOptionMixCallerAndInfo:callerAndI
					When run log -m=m --caller="functionName()" -i
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO  functionName():	m"
					The status should be success
				End
				It "-c and -i:" logLogOptionMixCallerAndDebug:cAndI
					When run log -m=m -c="functionName()" -i
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO  functionName():	m"
					The status should be success
				End
			End
		End
	End
End

