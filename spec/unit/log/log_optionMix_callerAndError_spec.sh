# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% ERROR:1
readonly ERROR
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$ERROR

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
			Describe "Caller and error:" logLogOptionMix:callerAndError
				It "--caller and --error:" logLogOptionMixCallerAndError:callerAndError
					When run log -m=m --caller="functionName()" --error
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "ERROR functionName():	m"
					The status should be success
				End
				It "-c and --error:" logLogOptionMixCallerAndError:cAndError
					When run log -m=m -c="functionName()" --error
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "ERROR functionName():	m"
					The status should be success
				End
				It "--caller and -e:" logLogOptionMixCallerAndError:callerAndE
					When run log -m=m --caller="functionName()" -e
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "ERROR functionName():	m"
					The status should be success
				End
				It "-c and -e:" logLogOptionMixCallerAndDebug:cAndE
					When run log -m=m -c="functionName()" -e
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "ERROR functionName():	m"
					The status should be success
				End
			End
		End
	End
End

