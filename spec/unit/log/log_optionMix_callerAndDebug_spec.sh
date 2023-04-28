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
		
		Describe "Option mix:" logLog:optionMix
			Describe "Caller and debug:" logLogOptionMix:callerAndDebug
				It "--caller and --debug:" logLogOptionMixCallerAndDebug:callerAndDebug
					When run log -m=m --caller="functionName()" --debug
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG functionName():	m"
					The status should be success
				End
				It "-c and --debug:" logLogOptionMixCallerAndDebug:cAndDebug
					When run log -m=m -c="functionName()" --debug
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG functionName():	m"
					The status should be success
				End
				It "--caller and -d:" logLogOptionMixCallerAndDebug:callerAndD
					When run log -m=m --caller="functionName()" -d
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG functionName():	m"
					The status should be success
				End
				It "-c and -d:" logLogOptionMixCallerAndDebug:cAndD
					When run log -m=m -c="functionName()" -d
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "DEBUG functionName():	m"
					The status should be success
				End
			End
		End
	End
End

