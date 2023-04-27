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
		checkRequiredOpts() { :; }
		
		Describe "Option mix:" logLog:optionMix
			Describe "Caller and warn:" logLogOptionMix:callerAndWarn
				It "--caller and --warn:" logLogOptionMixCallerAndWarn:callerAndWarn
					When run log -m=m --caller="functionName()" --warn
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN  functionName():	m"
					The status should be success
				End
				It "-c and --warn:" logLogOptionMixCallerAndWarn:cAndWarn
					When run log -m=m -c="functionName()" --warn
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN  functionName():	m"
					The status should be success
				End
				It "--caller and -w:" logLogOptionMixCallerAndWarn:callerAndW
					When run log -m=m --caller="functionName()" -w
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN  functionName():	m"
					The status should be success
				End
				It "-c and -w:" logLogOptionMixCallerAndWarn:cAndW
					When run log -m=m -c="functionName()" -w
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN  functionName():	m"
					The status should be success
				End
			End
		End
	End
End

