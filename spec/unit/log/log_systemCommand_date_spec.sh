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
		
		Describe "Mock date():" logLog:mockDate
			It "Not defined" logLogMockDate:notDefined
				When run log -m=m
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "TRACE:	m"
				The status should be success
			End
			It "Defined" logLogMockDate:defined
				date() { echo "2023/04/26 14:11:16 MDT"; }
				When run log -m=m
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "2023/04/26 14:11:16 MDT TRACE:	m"
				The status should be success
			End
		End
	End
End

